from diagramador.latex.commands import cmd
from diagramador.latex.commands import section
from diagramador.problem import Problem

from pydantic import BaseModel

QUIM_DEFAULT_ELEMENTS = [
    "H",
    "He",
    "Li",
    "Be",
    "B",
    "C",
    "N",
    "O",
    "F",
    "Ne",
    "Na",
    "Mg",
    "Al",
    "Si",
    "P",
    "S",
    "Cl",
    "Ar",
    "K",
    "Ca",
]


class ProblemSet(BaseModel):
    """Conjunto de problemas em uma prova."""

    title: str
    subject: str
    problems: list[Problem]

    def __len__(self):
        return len(self.problems)

    def elements(self):
        """Retorna a união dos elementos de todos os problemas no conjunto."""
        all_elements = QUIM_DEFAULT_ELEMENTS if self.subject == "qui" else []

        for problem in self.problems:
            if not problem.elements:
                continue
            for element in problem.elements:
                all_elements.append(element)
        return all_elements

    def tex_elements(self):
        elements_header = section("Elementos", level=1)
        return elements_header + cmd(
            "MolTable", ",".join(str(element) for element in self.elements())
        )

    def tex_header(self):
        section_header = section(self.title, level=0)
        return "\n".join(
            [section_header, cmd(f"pre{self.subject}"), self.tex_elements()]
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

        header = section(self.title, level=0)
        return header + "\n".join(
            problem.tex_solution(points=points) for problem in self.problems
        )

    @classmethod
    def parse_mdfiles(cls, title: str, subject: str, paths: list[str]):
        """Retorna a prova a partir dos arquivos."""
        problems = [Problem.parse_mdfile(path) for path in paths]
        return cls(title=title, subject=subject, problems=problems)

    @classmethod
    def parse_hedgedoc(cls, cursor, title: str, hedgedoc_paths: list[str]):
        """Retorna a prova a partir dos dados do AdminBro."""
        problems = [Problem.parse_hedgedoc(cursor, path) for path in hedgedoc_paths]
        return cls(title=title, problems=problems)
