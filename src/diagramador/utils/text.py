"""Base de dados para problemas de química, Gabriel Braun, 2022

Esse módulo implementa funções para conversão entre diferentes formatos.
"""
import importlib.resources

import pypandoc
import bs4


MARKDOWN_EXTENSIONS = [
    "fancy_lists",
    "task_lists",
    "pipe_tables",
    "implicit_figures",
    "fenced_divs",
]
"""Extensões de markdown utilizadas"""

PANDOC_MARKDOWN_FORMAT = (
    f"markdown_strict-raw_html+tex_math_dollars+{'+'.join(MARKDOWN_EXTENSIONS)}"
)
"""Formato markdown para o pandoc."""

PANDOC_FILTER_PATH = importlib.resources.files("diagramador.utils.filters")
"""Diretório contendo os filtros"""

PANDOC_FILTERS = [
    "containers.py",
    "pu2qty.py",
]
"""Filtros para o pandoc."""

PANDOC_FILTER_PATHS = [
    str(PANDOC_FILTER_PATH.joinpath(pandoc_filter)) for pandoc_filter in PANDOC_FILTERS
]
"""Lista de endereços para os filtros do pandoc."""


def md2html(md_str: str) -> str:
    """Converte markdown em HTML usando pandoc."""
    return pypandoc.convert_text(
        source=md_str,
        to="html",
        format=PANDOC_MARKDOWN_FORMAT,
        extra_args=["--quiet", "--mathjax"],
    )


def html2tex(html_str: str) -> str:
    """Converte HTML em LaTeX usando pandoc."""
    tex_str = pypandoc.convert_text(
        source=html_str,
        to="latex",
        format="html+tex_math_dollars+tex_math_single_backslash",
        extra_args=["--quiet"],
        filters=PANDOC_FILTER_PATHS,
    )
    tex_str = tex_str.replace("\\toprule()", "\\toprule")
    tex_str = tex_str.replace("\\midrule()", "\\midrule")
    tex_str = tex_str.replace("\\bottomrule()", "\\bottomrule")
    return tex_str


def md2soup(md_str: str) -> bs4.BeautifulSoup:
    """Converte markdown em HTML que é parseado pelo BS."""
    html_str = md2html(md_str)
    return bs4.BeautifulSoup(html_str, "html.parser")


def soup_split(soup: bs4.BeautifulSoup, tag: str) -> list[bs4.BeautifulSoup]:
    """Divide um `BeaultifulSoup` por tag."""
    split_tag = soup.find(tag)
    if not split_tag:
        return [soup, None]

    splited = str(soup).split(str(split_tag), 1)
    return map(lambda s: bs4.BeautifulSoup(s, "html.parser"), splited)
