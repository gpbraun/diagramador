"""Base de dados para problemas de química, Gabriel Braun, 2022

Esse módulo implementa comandos de LaTeX.
"""
from pathlib import Path


def cmd(cmd_name: str, args: str = "", end: str = ""):
    # latex command
    if not args:
        return f"\\{cmd_name} " + end

    if isinstance(args, list):
        tex_args = "".join(f"{{{arg}}}" for arg in args)
        return f"\\{cmd_name}{tex_args}" + end

    return f"\\{cmd_name}{{{args}}}" + end


def section(content, level=0, newpage=False, numbered=False):
    # latex section
    if not content:
        return ""

    newpage_cmd = cmd("newpage") if newpage else ""
    section_cmd = level * "sub" + ("section" if numbered else "section*")
    return newpage_cmd + cmd(section_cmd, [content], end="\n")


def key(args: dict):
    key_list = ",\n\t".join([f"{k}={{{v}}}" for k, v in args.items()])
    return f"[\n\t{key_list}\n]"


def env(env_name: str, content: str, keys=None, opt=None):
    """Cria um ambiente em LaTeX.

    Atributos:
        end_name (str): Nome do ambiente.
        content (str): Conteúdo do ambiente.
        keys (dict): Parâmetros opcionais
    """
    if keys:
        begin = f'{cmd("begin", env_name)}{key(keys)}'
    else:
        begin = cmd("begin", env_name)

    end = cmd("end", env_name)

    return f"\n{begin}{'['+ opt +']' if opt else ''}\n{content}\n{end}\n"


def itemize(name: str, items: list[str], sep_cmd: str = "item"):
    # latex enumerate
    content = "\n".join([cmd(sep_cmd) + i for i in items])
    return env(name, content)


def graphicspath(paths: list[str | Path]):
    # latex enumerate
    return cmd("graphicspath", "\n".join([f"{{{str(path)}}}" for path in paths]))
