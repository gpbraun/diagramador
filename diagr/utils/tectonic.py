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

from diagr.console import console

from .status import Status

TEXINPUTS_PATH = resources.files("diagr").joinpath("latex")
HEDGEDOC_GRAPHICS_PATH = Path("/var/lib/docker/volumes/hedgedoc_uploads/_data/")

TECTONIC_ERROR_PATTERN = re.compile(
    r"(?P<type>warning|error): (?P<file>[^:]+):(?P<line>\d+): (?P<message>.+)"
)

TexError = namedtuple("TexError", ["file", "line", "message"])


def parse_log(log_str: str) -> list[TexError] | None:
    """
    Retorna: retorna erros no `.log` do TECTONIC.
    """
    if not log_str:
        return

    errors = []
    for match in TECTONIC_ERROR_PATTERN.finditer(log_str):
        error_type = match.group("type")
        file_name = match.group("file")
        line_num = match.group("line")
        message = match.group("message")

        if error_type == "error":
            error = TexError(file=Path(file_name), line=line_num, message=message)
            errors.append(error)

    return errors


TectonicOutput = namedtuple("TectonicOutpt", ["status", "errors"])


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

    errors = parse_log(tectonic.stderr)
    status = Status.ERROR if errors or not pdf_path.exists() else Status.OK

    console.print(
        "Compilado em",
        f"[bold yellow]{runtime:.0f}s[/bold yellow].",
        "Status:",
        "[bold cyan]OK!" if status == Status.OK else "[bold red]ERRO!",
        "\n",
    )

    return TectonicOutput(status, errors)
