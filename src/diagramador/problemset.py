from diagramador.latex.commands import cmd, itemize
from diagramador.latex.commands import section
from diagramador.problem import Problem
from diagramador.utils.text import Text

from pydantic import BaseModel

QUIM_DEFAULT_ELEMENTS = [
    "H",
    "C",
    "N",
    "O",
    "Na",
    "Mg",
    "S",
    "Cl",
]


class ProblemSet(BaseModel):
    """Conjunto de problemas em uma prova."""

    title: str
    subject: str
    problems: list[Problem]

    def __len__(self):
        return len(self.problems)

    def tex_elements(self):
        all_elements = QUIM_DEFAULT_ELEMENTS if self.subject == "qui" else []
        for problem in self.problems:
            if not problem.elements:
                continue
            for element in problem.elements:
                all_elements.append(element)

        elements_cmd = cmd(
            "DisplayElements", ",".join(str(element) for element in all_elements)
        )

        if not all_elements:
            return ""

        elements_header = section("Tabela Periódica", level=2) + cmd("small")

        return elements_header + elements_cmd

    def tex_data(self):
        """Retorna a união dos dados de todos os problemas no conjunto."""
        all_data = []

        for problem in self.problems:
            if not problem.data:
                continue
            for data in problem.data:
                all_data.append(data)

        if not all_data:
            return ""

        data_header = section("Dados Adicionais", level=2) + cmd("small")
        all_tex_data = [Text.parse_md(data).tex for data in all_data]

        return data_header + itemize("itemize", all_tex_data)

    def tex_header(self):
        section_header = section(self.title, level=0)
        return "\n".join(
            [
                section_header,
                cmd("Preamble", self.subject),
                self.tex_data(),
                self.tex_elements(),
                cmd(f"EndPreamble"),
                "\n",
            ]
        )

    def tex(self, points: str):
        """Retorna o conjunto de problemas em LaTeX."""
        return self.tex_header() + "\n".join(
            problem.tex(points=points) for problem in self.problems
        )

    def tex_solutions(self, points: str):
        """Retorna o conjunto de problemas em LaTeX."""
        if not self.problems:
            return ""

        header = section(f"Gabarito {self.title}", level=0)
        return header + "\n".join(
            problem.tex_solution(points=points) for problem in self.problems
        )

    @classmethod
    def parse_mdfiles(cls, title: str, subject: str, paths: list[str]):
        """Retorna a prova a partir dos arquivos."""
        problems = [Problem.parse_mdfile(path) for path in paths]
        return cls(title=title, subject=subject, problems=problems)

    @classmethod
    def parse_hedgedoc(
        cls, cursor, title: str, subject: str, hedgedoc_paths: list[str]
    ):
        """Retorna a prova a partir dos dados do AdminBro."""
        problems = [Problem.parse_hedgedoc(cursor, path) for path in hedgedoc_paths]
        return cls(title=title, subject=subject, problems=problems)
