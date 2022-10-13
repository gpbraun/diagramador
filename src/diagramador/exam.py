from diagramador.latex.document import Document
from diagramador.problem import Problem

from pathlib import Path

from pydantic import BaseModel


class Exam(BaseModel):
    """Prova."""

    id_: str
    title: str
    problems: list[Problem]

    def tex_problems(self):
        """Retorna os problemas em LaTeX."""
        return "\n".join(problem.tex() for problem in self.problems)

    def tex_document(self):
        """Cria o arquivo `pdf` do tópico."""
        return Document(
            id_=self.id_,
            title=self.title,
            template="IMEdis",
            contents=self.tex_problems(),
        )

    def write_pdf(self, tmp_dir: Path, out_dir: Path | None = None):
        """Cria o arquivo `pdf` do tópico."""
        self.tex_document().write_pdf(tmp_dir.joinpath(self.id_), out_dir)
