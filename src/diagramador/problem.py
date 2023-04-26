"""Base de dados para problemas de química, Gabriel Braun, 2022

Esse módulo implementa uma classe para os problemas.
"""
from diagramador.latex.commands import cmd, env, section
from diagramador.utils.converter import md2problem

from pathlib import Path
from base64 import urlsafe_b64decode

from pydantic import BaseModel


class Problem(BaseModel):
    """Problema."""

    statement: str
    solution: str = None
    choices: list[str] = None
    correct_choice: int = None
    data: list[str] = None
    elements: list[str] = None

    @property
    def is_objective(self):
        """Verifica se o problema é objetivo."""
        return True if self.choices else False

    def tex_choices(self):
        """Retorna as alternativas do problema formatadas em LaTeX."""
        if not self.is_objective:
            return ""

        return cmd("autochoices", self.choices)

    def tex_correct_choice(self):
        """Retorna as respostas do problema formatados em LaTeX."""
        if not self.is_objective:
            return ""

        return chr(65 + self.correct_choice)

    def tex(self, points):
        """Retorna o enunciado completo do problema em LaTeX."""

        parameters = {
            "points": str(points),
        }

        return env("problem", self.statement + self.tex_choices(), keys=parameters)

    def tex_solution(self, points):
        """Retorna o enunciado completo do problema em LaTeX."""
        parameters = {
            "points": str(points),
        }

        problem = env("problem", self.statement + self.tex_choices(), keys=parameters)

        if self.solution:
            solution = env("solution", self.solution, opt=self.tex_correct_choice())
        else:
            solution = (
                section(f"Gabarito: {self.tex_correct_choice()}", level=2)
                if self.tex_correct_choice()
                else ""
            )

        return "\n".join([problem, solution])

    @classmethod
    def parse_mdstr(cls, md_str: str):
        problem = md2problem(md_str)
        return cls.parse_obj(problem)

    @classmethod
    def parse_mdfile(cls, file_path: str):
        path = Path(file_path)
        return cls.parse_mdstr(path.read_text())

    @classmethod
    def parse_hedgedoc(cls, cursor, hedgedoc_path: str):
        """Retorna o problema em um link do hedgedoc."""
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
        return cls.parse_mdstr(link, query_results[0][2])
