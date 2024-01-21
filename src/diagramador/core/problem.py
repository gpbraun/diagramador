"""
Diagramador, Gabriel Braun, 2024

Esse módulo implementa uma classe para os problemas.
"""

from base64 import urlsafe_b64decode
from datetime import datetime
from pathlib import Path

from pydantic import BaseModel, Field

from diagramador.templates import render_problem, render_solution
from diagramador.utils import md2problem


class Problem(BaseModel):
    """
    Problema.
    """

    id_: str = Field(alias="id")
    # parâmetros do problema
    title: str = "Problema"
    statement: str
    solution: str
    answer: str | None = None
    choices: list[dict] | None = None
    data: list[str] = Field(default=[])
    # parâmetros para o documento
    elements: set[str]
    packages: set[str]
    tikzlibraries: set[str]
    pgfplotslibraries: set[str]

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
    def parse_mdstr(cls, problem_id: str, md_str: str):
        """
        Retorna: problema de uma string md.
        """
        problem_obj = md2problem(problem_id, md_str)
        problem = cls.model_validate(problem_obj)
        return problem

    @classmethod
    def parse_mdfile(cls, problem_id: str, md_path: Path):
        """
        Retorna: problema de um arquivo md.
        """
        return cls.parse_mdstr(problem_id, md_path.read_text())

    @classmethod
    def parse_hedgedoc(cls, cursor, problem_id: str, hedgedoc_path: str):
        """
        Retorna: problema de link do hedgedoc.
        """
        link = str(Path(hedgedoc_path).stem)
        print(f"Extraindo problema no link: {link}")

        bytes_id = bytes.hex(urlsafe_b64decode(link + "=="))
        p_id = "-".join(
            [bytes_id[x:y] for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]]
        )
        cursor.execute(f"""SELECT * FROM "Notes" WHERE id = {"'"+p_id+"'"}""")
        query_results = cursor.fetchall()

        print(query_results)
        # get YAML data and contents
        return cls.parse_mdstr(problem_id, query_results[0][2])
