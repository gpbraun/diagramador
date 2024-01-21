"""
Diagramador, Gabriel Braun, 2024

Esse módulo implementa uma classe para as avaliações.
"""

from pathlib import Path

from pydantic import BaseModel, Field
from rich import progress
from rich.console import Console

from diagramador.templates import render_doc
from diagramador.utils import Status, tectonic

from .problem import Problem


class ProblemSet(BaseModel):
    """
    Conjunto de problemas em uma prova.
    """

    title: str
    subject: str
    problems: list[Path]
    problem_ids: list = Field(default=[])


class ProblemParams(BaseModel):
    """
    Status dos problemas.
    """

    status: Status = Status.OK
    path: Path
    index: int
    message: str


class Exam(BaseModel):
    """
    Avaliação.
    """

    id_: str = Field(alias="id")
    status: Status = Status.OK
    local: bool = False
    solutions: bool = False
    problem_params: dict[str, ProblemParams] = Field(default={})
    # parâmetros de diagramação
    title: str
    template: str
    affiliation: str
    date: str
    start: int = 1
    problem_set: list[ProblemSet]
    # endereços dos diretórios auxiliares
    path: Path | None = None
    out_path: Path | None = None
    tmp_path: Path | None = None
    problems_tmp_path: Path | None = None
    # nomes dos `.pdf` gerados
    pdf_exam_name: str | None = None
    pdf_solution_name: str | None = None
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
        Retorna: arquivo em LaTeX da avaliação
        """
        return render_doc(self.model_dump(), self.template)

    def latex_solution(self):
        """
        Retorna: arquivo em LaTeX do gabarito da avaliação.
        """
        return render_doc(self.model_dump(), "gabarito")

    def write_json(self):
        """
        Retorna: endereço do arquivo `.json` criado.
        """
        json_path = self.tmp_path.joinpath(self.id_ + "_status").with_suffix(".json")

        return json_path.write_text(self.model_dump_json(indent=4))

    def log_problem_status(self, console: Console):
        """
        Log do status dos problemas com erro no console.
        """
        for params in self.problem_params.values():
            if params.status == Status.ERROR:
                console.log(
                    "  •",
                    f"Problema [bold blue]{params.index:02d}",
                    "•",
                    f"[magenta]'{params.path}'",
                    "•",
                    f"[red]{params.message}",
                )
        console.log()
        return self.status

    def process_problems(self, console: Console, cursor=None):
        """
        Cria os arquivos dos problemas e gera os dados e os elementos.
        """
        prog = progress.Progress(
            12 * " ",
            "•",
            progress.TextColumn("[bold blue]{task.description}"),
            progress.BarColumn(),
            progress.MofNCompleteColumn(),
            "•",
            progress.TimeElapsedColumn(),
            "•",
            progress.TextColumn("Problema [bold blue]{task.fields[num]:02d}"),
            "•",
            progress.TextColumn("[magenta]'{task.fields[path]}'"),
            progress.TextColumn("{task.fields[end]}"),
            console=console,
        )

        problem_count = 0
        with prog:
            for index, pset in enumerate(self.problem_set):
                problem_task = prog.add_task(
                    pset.title, total=len(pset.problems), num=0, path="", end=""
                )
                for path in pset.problems:
                    problem_count += 1
                    # Parsing com PANDOC
                    path = (
                        self.path.parent.joinpath(path).with_suffix(".md")
                        if self.local
                        else path
                    )
                    prog.update(
                        problem_task,
                        num=problem_count,
                        path=path,
                        end="\n" if index == len(self.problem_set) - 1 else "",
                    )
                    problem_id = path.stem
                    try:
                        problem = (
                            Problem.parse_mdfile(problem_id, path)
                            if self.local
                            else Problem.parse_hedgedoc(cursor, problem_id, str(path))
                        )
                        params = ProblemParams(
                            status=Status.OK,
                            path=path,
                            index=problem_count,
                            message="Processado com sucesso.",
                        )
                    except:
                        self.status = Status.ERROR
                        params = ProblemParams(
                            status=Status.ERROR,
                            path=path,
                            index=problem_count,
                            message="Falha no processamento pelo PANDOC.",
                        )
                    self.problem_params[problem_id] = params

                    if problem.solution:
                        self.solutions = True

                    # Atualização de dados.
                    self.elements.update(problem.elements)
                    pset.problem_ids.append(problem.id_)

                    # Escrevendo o `.tex` do avaliação.
                    problem.write_tex(self.problems_tmp_path)
                    prog.advance(problem_task)

        # Finalização
        self.points = f"{10/problem_count:.2f}".replace(".", ",")

        if not self.status_ok():
            console.log(
                "[bold red]ERRO!",
                "Falha no processamento:\n",
            )
            self.log_problem_status(console)

        return self.status

    def compile_tex(self, console: Console, tex_path: Path, log_name="documento"):
        """
        Compila um documento.
        """
        resource_paths = [self.path.parent, self.problems_tmp_path]
        # compila o `.tex`
        console.log(
            f"Compilando [bold]{log_name}[/bold] em:",
            f"[magenta]'{tex_path}'",
        )
        self.status, errors = tectonic(console, tex_path, resource_paths)

        for error in errors:
            params = self.problem_params[error.file.stem]
            params.status = Status.ERROR
            params.message = error.message

        return self.status

    def create_exam_pdf(self, console: Console):
        """
        Retorna: status da compilação do `.pdf` da avaliação.
        """
        file_name = self.id_

        tex_exam_path = self.tmp_path.joinpath(file_name).with_suffix(".tex")
        tex_exam_path.write_text(self.latex())

        self.compile_tex(console, tex_exam_path, log_name="avaliação")
        if not self.status_ok():
            self.log_problem_status(console)
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

    def create_solution_pdf(self, console: Console):
        """
        Retorna: status da compilação do `.pdf` do gabarito da avaliação.
        """
        if not self.solutions:
            console.log(
                "[bold yellow]ATENÇÃO!",
                "Nenhum problema possui gabarito.\n",
            )
            return self.status

        file_name = f"{self.id_}_sol"

        tex_solution_path = self.tmp_path.joinpath(file_name).with_suffix(".tex")
        tex_solution_path.write_text(self.latex_solution())

        self.compile_tex(console, tex_solution_path, log_name="gabarito")
        if not self.status_ok():
            self.log_problem_status(console)
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
    def parse_jsonfile(cls, console: Console, json_path: Path):
        """
        Retorna: prova a partir dos dados de um json.
        """
        exam = cls.model_validate_json(json_path.read_text())
        exam.path = json_path

        if not exam.out_path:
            exam.out_path = exam.path.parent

        if not exam.tmp_path:
            exam.tmp_path = json_path.parent.joinpath(f"tmp_{exam.id_}")
            exam.tmp_path.mkdir(exist_ok=True)

        if not exam.problems_tmp_path:
            exam.problems_tmp_path = exam.tmp_path.joinpath("problems")
            exam.problems_tmp_path.mkdir(exist_ok=True)

        console.log(
            f"[bold yellow]{exam.title}",
            "•",
            f"[bold yellow]{exam.affiliation}",
            "•",
            f"[bold yellow]{exam.date}",
            "•",
            f"[bold yellow]Modelo {exam.template}\n",
        )

        return exam
