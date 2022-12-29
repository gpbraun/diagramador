from diagramador.latex.commands import section
from diagramador.latex.document import Document
from diagramador.problem import Problem

import json
from pathlib import Path

from pydantic import BaseModel


class ProblemSet(BaseModel):
    """Conjunto de problemas em uma prova."""

    title: str
    problems: list[Problem]

    def __len__(self):
        return len(self.problems)

    def tex(
        self,
        points: str,
        header: bool = True,
    ):
        """Retorna o conjunto de problemas em LaTeX."""
        if not self.problems:
            return ""

        header = section(self.title, level=0) if header else ""
        return header + "\n".join(
            problem.tex(points=points) for problem in self.problems
        )

    def tex_solutions(
        self,
        points: str,
        header: bool = True,
    ):
        """Retorna o conjunto de problemas em LaTeX."""
        if not self.problems:
            return ""

        header = section(self.title, level=0) if header else ""
        return header + "\n".join(
            problem.tex_solution(points=points) for problem in self.problems
        )

    @classmethod
    def parse_hedgedoc(cls, cursor, title: str, hedgedoc_paths: list[str]):
        """Retorna a prova a partir dos dados do AdminBro."""
        problems = [Problem.parse_hedgedoc(cursor, path) for path in hedgedoc_paths]
        return cls(title=title, problems=problems)


class Exam(BaseModel):
    """Prova."""

    id_: str
    title: str
    template: str
    problem_sets: list[ProblemSet]

    def tex(self):
        """Retorna os problemas em LaTeX."""
        points = f"{10/len(self.problem_sets):.2f}"

        if len(self.problem_sets) == 1:
            return self.problem_sets[0].tex(header=True, poits=points)

        return "\n".join(
            problem_set.tex(header=True, points=points)
            for problem_set in self.problem_sets
        )

    def tex_solutions(self):
        """Retorna os problemas em LaTeX."""
        points = f"{10/len(self.problem_sets):.2f}"

        if len(self.problem_sets) == 1:
            return self.problem_sets[0].tex_solutions(header=True, poits=points)

        return "\n".join(
            problem_set.tex_solutions(header=True, points=points)
            for problem_set in self.problem_sets
        )

    def tex_document(self):
        """Cria o arquivo `pdf` do tópico."""
        return Document(
            id_=self.id_,
            title=self.title,
            template=self.template,
            contents=self.tex(),
        )

    def tex_solutions_document(self):
        """Cria o arquivo `pdf` do tópico."""
        return Document(
            id_=self.id_ + "_gabarito",
            title="Gabarito " + self.title,
            template="gabarito",
            contents=self.tex_solutions(),
        )

    def write_pdf(self, tmp_dir: Path, out_dir: Path | None = None):
        """Cria o arquivo `pdf` do tópico."""
        self.tex_document().write_pdf(tmp_dir.joinpath(self.id_), out_dir)

    def write_solutions_pdf(self, tmp_dir: Path, out_dir: Path | None = None):
        """Cria o arquivo `pdf` do tópico."""
        self.tex_solutions_document().write_pdf(
            tmp_dir.joinpath(self.id_ + "_gabarito"), out_dir
        )

    @classmethod
    def parse_bro(cls, cursor, json_path: Path):
        """Retorna a prova a partir dos dados do AdminBro."""
        metadata = json.loads(json_path.read_text())

        if problem_sets := metadata["problem_sets"]:
            metadata["problem_sets"] = [
                ProblemSet.parse_hedgedoc(
                    cursor, problem_set["title"], problem_set["problems"]
                )
                for problem_set in problem_sets
            ]

        return cls.parse_obj(metadata)
