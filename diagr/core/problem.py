"""
Diagramador, Gabriel Braun, 2024

Esse módulo implementa uma classe para os problemas.
"""

from base64 import urlsafe_b64decode
from datetime import datetime
from pathlib import Path
from typing import Optional

from pydantic import BaseModel, Field

from diagr.console import console
from diagr.pandoc import md2problem
from diagr.templates import render_problem, render_solution
from diagr.utils import Error, Status

HEDGEDOC_GRAPHICS_PATH = Path("/var/lib/docker/volumes/hedgedoc_uploads/_data/")


class Choice(BaseModel):
    """
    Alternativa.
    """

    content: str
    correct: bool


class Problem(BaseModel):
    """
    Parâmetros do problema.
    """

    id_: str = Field(alias="id")
    # parâmetros de estado
    date: Optional[datetime] = None
    status: Status = Status.EMPTY
    local: bool = False
    index: int = 0
    message: str = "Não processado."
    errors: list[Error] = Field(default_factory=list)
    # parâmetros do problema
    title: str = "Problema"
    statement: str = ""
    solution: str = ""
    answer: str = ""
    choices: Optional[list[Choice]] = None
    data: list[str] = Field(default_factory=list)
    # parâmetros para o documento
    elements: set[str] = Field(default_factory=set)
    packages: set[str] = Field(default_factory=set)

    def status_ok(self):
        """
        Retorna: verdadeiro se não há erro.
        """
        return Status.is_ok(self.status)

    def log(self) -> None:
        """
        Log do problema no console.
        """
        if self.status_ok():
            return

        # Questão com PDF
        console.print_error(
            f"Problema [bold blue]{self.index:02d}",
            "•",
            self.message,
        )

        for error in self.errors:
            console.print()
            error.log()

        console.print()

    def latex(self):
        """
        Retorna: arquivo em LaTeX do problema.
        """
        return render_problem(self.model_dump())

    def latex_solution(self):
        """
        Retorna: arquivo em LaTeX da solução do problema.
        """
        return render_solution(self.model_dump())

    def write_tex(self, path: Path):
        """
        Retorna: endereço dos arquivos `.tex` criados.
        """
        problem_tex_file = path.joinpath(self.id_).with_suffix(".tex")
        problem_tex_file.write_text(self.latex())

        solution_tex_file = path.joinpath(self.id_ + "_sol.tex")
        solution_tex_file.write_text(self.latex_solution())

        return problem_tex_file, solution_tex_file

    @classmethod
    def parse_mdstr(cls, problem_id: str, md_str: str, path: Path, tmp_path: Path):
        """
        Retorna: problema de uma string md.
        """
        try:
            problem_obj = md2problem(problem_id, md_str, path, tmp_path)
            problem = cls.model_validate(problem_obj)

        except Exception as exp:
            return Problem(
                id=problem_id,
                status=Status.PANDOC_ERROR,
                message=str(exp),
                date=None,
            )

        problem.status = Status.PANDOC_OK
        problem.message = "Processado com sucesso."

        return problem

    @classmethod
    def parse_mdfile(cls, problem_id: str, md_path: Path, tmp_path: Path):
        """
        Retorna: problema de um arquivo md.
        """
        md_str = md_path.read_text()
        problem = cls.parse_mdstr(problem_id, md_str, md_path.parent, tmp_path)

        problem.local = True
        return problem

    @classmethod
    def parse_hedgedoc(cls, cursor, hedgedoc_link: str, tmp_path: Path):
        """
        Retorna: problema de link do hedgedoc.
        """
        try:
            hedgedoc_id = Path(hedgedoc_link).stem
            bytes_id = bytes.hex(urlsafe_b64decode(f"{hedgedoc_id}=="))
            p_id = "-".join(
                [
                    bytes_id[x:y]
                    for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]
                ]
            )
            cursor.execute(f'SELECT * FROM "Notes" WHERE id = {repr(p_id)}')
            query_results = cursor.fetchall()

        except Exception as exp:
            return Problem(
                id=hedgedoc_id,
                status=Status.DATABASE_ERROR,
                message=str(exp),
            )

        return cls.parse_mdstr(
            hedgedoc_id, query_results[0][2], HEDGEDOC_GRAPHICS_PATH, tmp_path
        )
