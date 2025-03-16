"""
Base de dados para problemas de química, Gabriel Braun, 2024

Esse módulo implementa funções do PANDOC.
"""

import hashlib
import json
from importlib import resources
from pathlib import Path

import pypandoc

FILTER_PATH = resources.files("diagr.pandoc").joinpath("filters")
WRITER_PATH = resources.files("diagr.pandoc").joinpath("problem.lua")


def parse_lua_table(obj: dict) -> dict | list:
    """
    Converte uma lua table para objetos em python.
    """
    if all(key.isdigit() for key in obj.keys()):
        array = list(obj.values())
        return array

    return obj


def pandoc_args(meta: dict) -> str:
    """
    Converte um `dict` na lista de argumentos extras para o PANDOC.
    """
    args = ["--quiet"]
    for key, val in meta.items():
        args.append(f"--metadata={key}:{val}")

    return args


def pandoc_filters(filters: list) -> list:
    """
    Converte uma lista na lista de filtros PANDOC.
    """
    return [str(FILTER_PATH.joinpath(ftr)) for ftr in filters]


def custom_hash(input_string: str) -> int:
    """
    Retorna: hash `int` com 10 digitos.
    """
    hash_object = hashlib.sha256(input_string.encode())
    hashed_hex = hash_object.hexdigest()
    hashed_integer = int(hashed_hex, 16) % (10**10)

    return hashed_integer


def md2problem(problem_id: str, md_str: str, src_path: Path, tmp_path: Path) -> str:
    """
    Converte um arquivo usando o PANDOC.
    """
    args = {
        "id": problem_id,
        "seed": custom_hash(problem_id),
        "src_path": src_path,
        "tmp_path": tmp_path,
    }

    json_str = pypandoc.convert_text(
        source=md_str,
        to=str(WRITER_PATH),
        format="markdown",
        filters=pandoc_filters(["choices.lua", "images.lua"]),
        extra_args=pandoc_args(args),
    )

    return json.loads(json_str, object_hook=parse_lua_table)
