from diagramador.latex.document import Document
from diagramador.latex.commands import cmd
from diagramador.problemset import ProblemSet

import json
from pathlib import Path

from pydantic import BaseModel


class Exam(BaseModel):
    """Prova."""

    id_: str
    title: str
    template: str
    problem_sets: list[ProblemSet]

    def __len__(self):
        return sum(len(p_set) for p_set in self.problem_sets)

    def problem_points(self):
        """Retorna a pontuação de cada problema."""
        return f"{10/len(self):.2f}"

    def tex(self):
        """Retorna os problemas em LaTeX."""
        return cmd("newpage").join(
            problem_set.tex(points=self.problem_points())
            for problem_set in self.problem_sets
        )

    def tex_solutions(self):
        """Retorna os problemas em LaTeX."""
        return cmd("newpage").join(
            problem_set.tex_solutions(points=self.problem_points())
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
            title=self.title,
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
    def parse_json(cls, json_path: Path):
        """Retorna a prova a partir dos dados do AdminBro."""
        metadata = json.loads(json_path.read_text())

        if problem_sets := metadata["problem_sets"]:
            metadata["problem_sets"] = [
                ProblemSet.parse_mdfiles(
                    problem_set["title"],
                    problem_set["subject"],
                    problem_set["problems"],
                )
                for problem_set in problem_sets
            ]

        return cls.parse_obj(metadata)

    @classmethod
    def parse_bro(cls, cursor, json_path: Path):
        """Retorna a prova a partir dos dados do AdminBro."""
        metadata = json.loads(json_path.read_text())

        if problem_sets := metadata["problem_sets"]:
            metadata["problem_sets"] = [
                ProblemSet.parse_hedgedoc(
                    cursor,
                    problem_set["title"],
                    problem_set["subject"],
                    problem_set["problems"],
                )
                for problem_set in problem_sets
            ]

        return cls.parse_obj(metadata)
