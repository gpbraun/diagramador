"""
Diagramador, Gabriel Braun, 2024

Esse módulo implementa uma classe para os problemas.
"""

from base64 import urlsafe_b64decode
from datetime import datetime
from pathlib import Path
from typing import Optional

from pydantic import BaseModel, Field

from diagramador.templates import render_problem, render_solution
from diagramador.utils import HEDGEDOC_GRAPHICS_PATH, Status, md2problem


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
    date: datetime
    status: Status = Status.OK
    local: bool = False
    index: int = 0
    processed: bool = False
    message: str = "não processado"
    # parâmetros do problema
    title: str = "Problema"
    statement: str = ""
    solution: str = ""
    answer: str = ""
    choices: Optional[list[Choice]] = None
    data: list[str] = Field(default=[])
    # parâmetros para o documento
    elements: set[str] = Field(default=set())
    packages: set[str] = Field(default=set())

    def status_ok(self):
        """
        Retorna: verdadeiro se o Status é OK.
        """
        return self.status == Status.OK

    def set_status(self, index: int, message: str):
        """
        Muda o estado do problema.
        """
        self.status = Status.OK
        self.index = index
        self.message = message

        return self.status

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
        problem_obj = md2problem(problem_id, md_str, path, tmp_path)
        problem = cls.model_validate(problem_obj)

        problem.message = "processado com sucesso"
        problem.processed = True

        return problem

    @classmethod
    def parse_mdfile(cls, problem_id: str, md_path: Path, tmp_path: Path):
        """
        Retorna: problema de um arquivo md.
        """
        try:
            md_str = md_path.read_text()
            problem = cls.parse_mdstr(problem_id, md_str, md_path.parent, tmp_path)

        except Exception as exp:
            problem = Problem(
                id=problem_id,
                status=Status.ERROR,
                message=str(exp),
            )

        problem.local = True
        return problem

    @classmethod
    def parse_hedgedoc(cls, cursor, hedgedoc_link: str, tmp_path: Path):
        """
        Retorna: problema de link do hedgedoc.
        """
        try:
            hedgedoc_id = Path(hedgedoc_link).stem
            bytes_id = bytes.hex(urlsafe_b64decode(hedgedoc_id + "=="))
            p_id = "-".join(
                [
                    bytes_id[x:y]
                    for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]
                ]
            )
            cursor.execute(f"""SELECT * FROM "Notes" WHERE id = {"'"+p_id+"'"}""")
            query_results = cursor.fetchall()

            problem = cls.parse_mdstr(
                hedgedoc_id, query_results[0][2], HEDGEDOC_GRAPHICS_PATH, tmp_path
            )

        except Exception as exp:
            problem = Problem(
                id=hedgedoc_id,
                status=Status.ERROR,
                message=str(exp),
            )

        return problem
