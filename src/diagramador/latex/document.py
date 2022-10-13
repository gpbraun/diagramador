from genericpath import exists
import braunchem.utils.latex as latex

import subprocess
import shutil
from pathlib import Path
import importlib.resources

TEX_TEMPLATES_PATH = importlib.resources.files("diagramador.latex.templates")
"""Diretório da base de dados."""

TEX_TEMPLATE_FILES = [
    "braun.cls",
    "ime-logo.pdf",
    "ita-logo.pdf",
    "ita-logo-alt.pdf",
]


def run_latexmk(tex_path: Path):
    """Executa o comando `latexmk`."""
    subprocess.run(
        [
            "latexmk",
            "-shell-escape",
            "-interaction=nonstopmode",
            "-file-line-error",
            "-pdf",
            "-cd",
            tex_path,
        ],
        stdout=subprocess.DEVNULL,
    )


class Document:
    """Documento em LaTeX."""

    def __init__(
        self,
        id_: str,
        title: str | None = None,
        author: str | None = None,
        affiliation: str | None = None,
        template: str = "",
        contents: str = None,
    ):
        self.id_ = id_
        self.title = title
        self.author = author
        self.affiliation = affiliation
        self.template = template
        self.contents = contents

    @property
    def preamble(self) -> str:
        """Preâmbulo do documento"""
        return "\n".join(
            [
                latex.cmd("title", self.title) if self.title else "",
                latex.cmd("author", self.author) if self.author else "",
                latex.cmd("affiliation", self.affiliation) if self.affiliation else "",
            ]
        )

    @property
    def documentclass(self) -> str:
        """Comando que especifica a classe do documento."""
        return f"\\documentclass[{self.template}]{{braun}}\n"

    @property
    def body(self) -> str:
        """Corpo do documento em LaTeX."""
        return latex.env("document", f"\\maketitle\n\n{self.contents}")

    def document(self) -> str:
        return "\n".join(
            [
                self.documentclass,
                self.preamble,
                self.body,
            ]
        )

    def write_pdf(self, tmp_dir: Path, out_dir: Path | None = None) -> Path:
        """Gera o `pdf` e copia para um diretório de saída.

        Args:
            tmp_dir (Path): Diretório para arquivos temporários.
            out_dir (Path): Diretório de saída.
        """
        tmp_dir.mkdir(parents=True, exist_ok=True)

        # copia os arquivos do template para o diretório temporário
        for file in TEX_TEMPLATE_FILES:
            shutil.copy(TEX_TEMPLATES_PATH.joinpath(file), tmp_dir)

        tex_path = tmp_dir.joinpath(self.id_).with_suffix(".tex")
        tex_path.write_text(self.document())
        run_latexmk(tex_path)
        pdf_path = tex_path.with_suffix(".pdf")

        if out_dir:
            out_dir.mkdir(parents=True, exist_ok=True)
            shutil.copy(src=tex_path.with_suffix(".pdf"), dst=out_dir)

        return pdf_path
