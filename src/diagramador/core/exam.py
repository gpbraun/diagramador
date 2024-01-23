"""
Diagramador, Gabriel Braun, 2024

Esse módulo implementa uma classe para as avaliações.
"""

from datetime import datetime
from pathlib import Path
from typing import Optional

from pydantic import BaseModel, Field
from rich import progress
from rich.console import Console

from diagramador.console import console
from diagramador.templates import render_doc
from diagramador.utils import Status, tectonic

from .problem import Problem


class ProblemSetParams(BaseModel):
    """
    Conjunto de problemas em uma prova.
    """

    title: str
    subject: str
    start: Optional[int] = None
    problem_ids: list[str] = Field(alias="problems")


class ExamParams(BaseModel):
    """
    Parâmetros do exame.
    """

    id_: str = Field(alias="id")
    title: str
    template: str
    affiliation: str
    date: str = Field(default=str(datetime.now().year))
    problem_set: list[ProblemSetParams]


class Exam(ExamParams):
    """
    Avaliação.
    """

    # parâmetros de estado
    status: Status = Status.OK
    local: bool = False
    message: str = ""
    processed: bool = False
    solutions: bool = False
    problems: dict[str, Problem] = Field(default={})
    # endereços dos diretórios auxiliares
    path: Optional[Path] = None
    out_path: Optional[Path] = None
    tmp_path: Optional[Path] = None
    problems_tmp_path: Optional[Path] = None
    # nomes dos `.pdf` gerados
    pdf_exam_name: Optional[str] = None
    pdf_solution_name: Optional[str] = None
    # dados dos problemas
    points: str = "1,00"
    elements: set[str] = Field(default=set())

    def status_ok(self):
        """
        Retorna: verdadeiro se o Status é OK.
        """
        return self.status == Status.OK

    def latex(self):
        """
        Retorna: arquivo em LaTeX da avaliação.
        """
        return render_doc(self.model_dump(), self.template)

    def latex_solution(self):
        """
        Retorna: arquivo em LaTeX do gabarito da avaliação.
        """
        return render_doc(self.model_dump(), "gabarito")

    def log_status(self):
        """
        Log do status dos problemas com erro no console.
        """
        if self.message:
            console.print(
                "• [bold red]ERRO!",
                self.message,
            )
        for problem in self.problems.values():
            if problem.status == Status.ERROR:
                console.print(
                    "• [bold red]ERRO!",
                    f"Problema [bold blue]{problem.index:02d}",
                    "•",
                    problem.message,
                )
        console.print()
        return self.status

    def process_problems(self, cursor=None):
        """
        Cria os arquivos dos problemas e gera os dados e os elementos.
        """
        prog = progress.Progress(
            progress.TextColumn("• [bold blue]{task.description}"),
            progress.BarColumn(),
            progress.MofNCompleteColumn(),
            "•",
            progress.TimeElapsedColumn(),
            progress.TextColumn("• Problema [bold blue]{task.fields[num]:02d}"),
            progress.TextColumn("• [bold cyan]'{task.fields[id]}'"),
            console=console,
        )

        problem_count = 0
        with prog:
            for index, pset in enumerate(self.problem_set):
                problem_task = prog.add_task(
                    pset.title, total=len(pset.problem_ids), num=0, id="", end=""
                )
                if not pset.start:
                    pset.start = problem_count + 1
                for index, problem_path in enumerate(pset.problem_ids):
                    problem_id = Path(problem_path).stem
                    pset.problem_ids[index] = problem_id
                    problem_count += 1
                    # Parsing com PANDOC

                    prog.update(problem_task, num=problem_count, id=problem_id)
                    if self.local:
                        path = self.path.parent.joinpath(problem_id).with_suffix(".md")
                        problem = Problem.parse_mdfile(problem_id, path)
                    else:
                        problem = Problem.parse_hedgedoc(cursor, problem_id)

                    problem.index = problem_count

                    # registra o problema na lista da avaliação.
                    self.problems[problem_id] = problem

                    # Atualização de parâmetros da avaliação.
                    if not problem.status_ok():
                        self.status = Status.ERROR

                    if problem.solution or problem.answer:
                        self.solutions = True

                    self.elements.update(problem.elements)

                    # Escreve o `.tex` do avaliação.
                    if problem.status_ok():
                        problem.write_tex(self.problems_tmp_path)

                    prog.advance(problem_task)

        # Finalização
        console.print()
        self.points = f"{10/problem_count:.2f}".replace(".", ",")

        if not self.status_ok():
            console.print(
                "[bold red]ERRO!",
                "Falha no processamento:\n",
            )
            self.log_status(console)
        else:
            self.processed = True

        return self.status

    def compile_tex(self, tex_path: Path, log_name="documento"):
        """
        Compila um documento.
        """
        resource_paths = [self.path.parent, self.problems_tmp_path]
        # compila o `.tex`
        console.print(
            f"Compilando [bold]{log_name}[/bold] em:",
            f"[magenta]'{tex_path}'",
        )
        self.status, errors = tectonic(tex_path, resource_paths)

        for error in errors:
            error_id = error.file.stem.replace("_sol", "")
            message = (
                f"[magenta]'{error.file}':{error.line}[/magenta] • [red]{error.message}"
            )

            if error_id == self.id_:
                self.message = message

            elif error_id in self.problems:
                problem = self.problems[error_id]
                problem.status = Status.ERROR
                problem.message = message

        return self.status

    def create_exam_pdf(self):
        """
        Retorna: status da compilação do `.pdf` da avaliação.
        """
        file_name = self.id_

        tex_exam_path = self.tmp_path.joinpath(file_name).with_suffix(".tex")
        tex_exam_path.write_text(self.latex())

        self.compile_tex(tex_exam_path, log_name="avaliação")
        if not self.status_ok():
            self.log_status()
            return self.status

        # copia o `.pdf` pro diretório de output
        tmp_pdf_path = tex_exam_path.with_suffix(".pdf")
        out_pdf_path = (
            self.out_path.joinpath(self.pdf_exam_name)
            if self.pdf_exam_name
            else self.out_path.joinpath(file_name).with_suffix(".pdf")
        )
        out_pdf_path.write_bytes(tmp_pdf_path.read_bytes())

        return self.status

    def create_solution_pdf(self):
        """
        Retorna: status da compilação do `.pdf` do gabarito da avaliação.
        """
        if not self.solutions:
            console.print(
                "[bold yellow]ATENÇÃO!",
                "Nenhum problema possui gabarito.\n",
            )
            return self.status

        file_name = f"{self.id_}_sol"

        tex_solution_path = self.tmp_path.joinpath(file_name).with_suffix(".tex")
        tex_solution_path.write_text(self.latex_solution())

        self.compile_tex(tex_solution_path, log_name="gabarito")
        if not self.status_ok():
            self.log_status(console)
            return self.status

        # copia o `.pdf` pro diretório de output
        tmp_pdf_path = tex_solution_path.with_suffix(".pdf")
        out_pdf_path = (
            self.out_path.joinpath(self.pdf_solution_name)
            if self.pdf_solution_name
            else self.out_path.joinpath(file_name).with_suffix(".pdf")
        )
        out_pdf_path.write_bytes(tmp_pdf_path.read_bytes())

        return self.status

    @classmethod
    def parse_jsonfile(cls, json_path: Path):
        """
        Retorna: prova a partir dos dados de um json.
        """
        exam = cls.model_validate_json(json_path.read_text())
        exam.path = json_path

        if not exam.out_path:
            exam.out_path = exam.path.parent

        if not exam.tmp_path:
            exam.tmp_path = json_path.parent.joinpath(f"_tmp_{exam.id_}")
            exam.tmp_path.mkdir(exist_ok=True)

        if not exam.problems_tmp_path:
            exam.problems_tmp_path = exam.tmp_path.joinpath("problems")
            exam.problems_tmp_path.mkdir(exist_ok=True)

        console.print(
            f"[bold yellow]{exam.title}",
            f"• [bold yellow]{exam.affiliation}",
            f"• [bold yellow]{exam.date}",
            f"• [bold yellow]Modelo {exam.template}\n",
        )

        return exam
