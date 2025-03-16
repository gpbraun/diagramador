"""
Base de dados para problemas de química, Gabriel Braun, 2024

Esse módulo implementa funções do TECTONIC.
"""

import importlib.resources as resources
import re
import subprocess
import time
from collections import namedtuple
from pathlib import Path

from pydantic import BaseModel

from diagr.console import console

from .status import Status

TEXINPUTS_PATH = resources.files("diagr").joinpath("latex")
HEDGEDOC_GRAPHICS_PATH = Path("/var/lib/docker/volumes/hedgedoc_uploads/_data/")

TECTONIC_ERROR_PATTERN = re.compile(
    r"(?P<type>warning|error): (?P<file>[^:]+):(?P<line>\d+): (?P<message>.+)"
)


class TexError(BaseModel):
    """
    Erro de compilação no LaTeX.
    """

    file: Path
    line: int
    message: str
    snippet: str


def parse_log(tex_path: Path, log_str: str) -> list[TexError] | None:
    """
    Retorna: retorna erros no `.log` do TECTONIC.
    """
    if not log_str:
        return

    errors = []
    for match in TECTONIC_ERROR_PATTERN.finditer(log_str):
        error_type = match.group("type")
        file_path = tex_path.parent.joinpath("problems", match.group("file"))
        line_num = int(match.group("line"))
        message = match.group("message")

        if error_type != "error" or not file_path.exists():
            # ignora os warnings/erros de arquivos inexistentes (não deveriam acontecer)
            continue

        snippet = "\n".join(
            file_path.read_text().splitlines()[line_num - 3 : line_num + 2]
        )
        error = TexError(
            file=file_path, line=line_num, message=message, snippet=snippet
        )
        errors.append(error)

    return errors


def tectonic_search_paths(resource_paths: list[Path]) -> list[str]:
    """
    Retorna: diretórios para busca pelo TECTONIC.
    """
    search_paths = [
        TEXINPUTS_PATH.joinpath("classes"),
        TEXINPUTS_PATH.joinpath("graphics"),
        TEXINPUTS_PATH.joinpath("packages"),
        TEXINPUTS_PATH.joinpath("fonts"),
        HEDGEDOC_GRAPHICS_PATH,
    ]
    if resource_paths:
        search_paths.extend(resource_paths)
    return [f"-Zsearch-path={str(search_path)}" for search_path in search_paths]


TectonicOutput = namedtuple("TectonicOutpt", ["status", "errors"])


def tectonic(tex_path: Path, resource_paths: list[Path] = None):
    """
    Retorna: lista de erros de compilação TECTONIC.
    """
    start_time = time.time()
    tectonic = subprocess.run(
        [
            "tectonic",
            "-X",
            "compile",
            "--keep-intermediates",
            "--keep-logs",
            "-Zcontinue-on-errors",
            *tectonic_search_paths(resource_paths),
            str(tex_path),
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    runtime = time.time() - start_time
    if tectonic.stderr:
        err_path = tex_path.with_suffix(".tectonic.log")
        err_path.write_text(tectonic.stderr)
    pdf_path = tex_path.with_suffix(".pdf")

    errors = parse_log(tex_path, tectonic.stderr)
    status = Status.ERROR if errors or not pdf_path.exists() else Status.OK

    console.print(
        "Compilado em",
        f"[bold yellow]{runtime:.0f}s[/bold yellow].",
        "Status:",
        "[bold cyan]OK!" if status == Status.OK else "[bold red]ERRO!",
        "\n",
    )

    return TectonicOutput(status, errors)
