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
    affiliation: str | None = None
    date: str | None = None
    start: int = 1
    path: Path | None = None
    problem_set: list[ProblemSet]

    def __len__(self):
        return sum(len(p_set) for p_set in self.problem_set)

    def problem_points(self):
        """Retorna a pontuação de cada problema."""
        return f"{10/len(self):.2f}"

    def tex(self):
        """Retorna os problemas em LaTeX."""
        header = cmd("TestInstructions") if self.template == "prova" else ""
        return header + cmd("newpage").join(
            problem_set.tex(points=self.problem_points())
            for problem_set in self.problem_set
        )

    def tex_solutions(self):
        """Retorna os problemas em LaTeX."""
        return cmd("newpage").join(
            problem_set.tex_solutions(points=self.problem_points())
            for problem_set in self.problem_set
        )

    def tex_document(self):
        """Cria o arquivo `pdf` do tópico."""
        return Document(
            id_=self.id_,
            path=self.path,
            title=self.title,
            affiliation=self.affiliation,
            date=self.date,
            template=self.template,
            contents=self.tex(),
            start=self.start,
        )

    def tex_solutions_document(self):
        """Cria o arquivo `pdf` do tópico."""
        return Document(
            id_=self.id_ + "_gabarito",
            path=self.path,
            title=self.title,
            affiliation=self.affiliation,
            date=self.date,
            template="gabarito",
            contents=self.tex_solutions(),
            start=self.start,
        )

    def write_pdf(self, tmp_dir: Path, out_dir: Path | None = None):
        """Cria o arquivo `pdf` do tópico."""
        self.tex_document().write_pdf(
            tmp_dir=tmp_dir.joinpath(self.id_),
            out_dir=out_dir,
        )

    def write_solutions_pdf(self, tmp_dir: Path, out_dir: Path | None = None):
        """Cria o arquivo `pdf` do tópico."""
        self.tex_solutions_document().write_pdf(
            tmp_dir=tmp_dir.joinpath(self.id_ + "_gabarito"),
            out_dir=out_dir,
        )

    @classmethod
    def parse_json(cls, json_path: Path):
        """Retorna a prova a partir dos dados do AdminBro."""
        metadata = json.loads(json_path.read_text())

        if problem_set := metadata["problem_set"]:
            metadata["problem_set"] = [
                ProblemSet.parse_mdfiles(
                    problem_set["title"],
                    problem_set["subject"],
                    problem_set["problems"],
                )
                for problem_set in problem_set
            ]

        metadata["path"] = json_path.parent.joinpath("graphics").resolve()

        return cls.parse_obj(metadata)

    @classmethod
    def parse_bro(cls, cursor, json_path: Path):
        """Retorna a prova a partir dos dados do AdminBro."""
        metadata = json.loads(json_path.read_text())

        if problem_set := metadata["problem_set"]:
            metadata["problem_set"] = [
                ProblemSet.parse_hedgedoc(
                    cursor,
                    problem_set["title"],
                    problem_set["subject"],
                    problem_set["problems"],
                )
                for problem_set in problem_set
            ]

        metadata["path"] = Path("../../../hedgedoc/uploads")

        return cls.parse_obj(metadata)
