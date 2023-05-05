from diagramador.latex.commands import cmd, env, graphicspath

import subprocess
import shutil
from pathlib import Path
import importlib.resources

TEX_TEMPLATES_PATH = importlib.resources.files("diagramador.latex.templates")
"""Diretório da base de dados."""

TEX_TEMPLATE_GRAPHICS_PATH = TEX_TEMPLATES_PATH.joinpath("graphics")
"""Diretório da base de dados."""

HEDGEDOC_GRAPHICS_PATH = Path("/var/lib/docker/volumes/hedgedoc_uploads/_data/")

TEX_TEMPLATE_FILES = [
    "braun.cls",
    "braunchem.sty",
]


def run_tectonic(tex_path: Path):
    """Executa o comando `latexmk`."""
    tectonic = subprocess.run(
        [
            shutil.which("tectonic"),
            "-X",
            "compile",
            "--keep-intermediates",
            "--keep-logs",
            str(tex_path),
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    print(f"Comando executado: '{' '.join(tectonic.args)}'")
    log_path = tex_path.with_suffix(".log")
    if tectonic.stdout:
        log_path.write_bytes(tectonic.stdout)
    if tectonic.stderr:
        log_path.write_bytes(tectonic.stderr)
    print(f"Arquivo '{tex_path}' compilado com tectonic!")


class Document:
    """Documento em LaTeX."""

    def __init__(
        self,
        id_: str,
        path: Path | None = None,
        title: str | None = None,
        affiliation: str | None = None,
        date: str | None = None,
        template: str = "",
        contents: str = None,
        start: int = 1,
    ):
        self.id_ = id_
        self.path = path
        self.title = title
        self.affiliation = affiliation
        self.date = date
        self.template = template
        self.contents = contents
        self.start = start

    @property
    def preamble(self) -> str:
        """Preâmbulo do documento"""
        return "\n".join(
            [
                cmd("title", self.title) if self.title else "",
                cmd("affiliation", self.affiliation) if self.affiliation else "",
                cmd("date", self.date) if self.date else "",
                graphicspath(
                    [self.path, TEX_TEMPLATE_GRAPHICS_PATH, HEDGEDOC_GRAPHICS_PATH]
                ),
                cmd("setcounter", ["problem", self.start - 1]),
            ]
        )

    @property
    def documentclass(self) -> str:
        """Comando que especifica a classe do documento."""
        return f"\\documentclass[{self.template}]{{braun}}\n"

    @property
    def body(self) -> str:
        """Corpo do documento em LaTeX."""
        return env("document", f"\\maketitle\n\n{self.contents}")

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
        run_tectonic(tex_path)
        pdf_path = tex_path.with_suffix(".pdf")

        if out_dir:
            out_dir.mkdir(parents=True, exist_ok=True)
            shutil.copy(src=tex_path.with_suffix(".pdf"), dst=out_dir)

        return pdf_path
