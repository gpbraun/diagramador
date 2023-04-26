"""Base de dados para problemas de química, Gabriel Braun, 2022

Esse módulo implementa funções para conversão entre diferentes formatos.
"""
import importlib.resources
import logging
import json

import pypandoc

logger = logging.getLogger(__name__)


MARKDOWN_EXTENSIONS = [
    "smart",
    "fancy_lists",
    "task_lists",
    "pipe_tables",
    "implicit_figures",
    "fenced_divs",
    "yaml_metadata_block",
    "backtick_code_blocks",
]
"""Extensões de markdown utilizadas"""

PANDOC_MARKDOWN_FORMAT = (
    f"markdown_strict-raw_html+tex_math_dollars+{'+'.join(MARKDOWN_EXTENSIONS)}"
)
"""Formato markdown para o pandoc."""

PANDOC_WRITER_PATH = str(
    importlib.resources.files("diagramador.utils.writers").joinpath("problem.lua")
)
"""Diretório contendo os filtros"""

PANDOC_FILTER_PATH = importlib.resources.files("diagramador.utils.filters")
"""Diretório contendo os filtros"""

PANDOC_FILTERS = [
    "pu2qty.py",
    "lists.lua",
    "containers.lua",
    "texblock.lua",
]
"""Filtros para o pandoc."""

PANDOC_FILTER_PATHS = [
    str(PANDOC_FILTER_PATH.joinpath(pandoc_filter)) for pandoc_filter in PANDOC_FILTERS
]
"""Lista de endereços para os filtros do pandoc."""

PANDOC_COLUMN_NUM = 150
"""Número de colunas consideradas pelo pandoc"""


def md2problem(md_str: str) -> str:
    """Converte HTML em LaTeX usando pandoc."""
    problem = pypandoc.convert_text(
        source=md_str,
        to=PANDOC_WRITER_PATH,
        format=PANDOC_MARKDOWN_FORMAT,
        extra_args=["--quiet", f"--columns={PANDOC_COLUMN_NUM}"],
        filters=PANDOC_FILTER_PATHS,
    )
    return json.loads(problem)
