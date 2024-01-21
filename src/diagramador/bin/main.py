import argparse
from pathlib import Path

import psycopg2
from pydantic import ValidationError
from rich.console import Console

from diagramador import Exam


def connect():
    """
    Retorna: cursor.
    """
    conn = psycopg2.connect(
        host="localhost",
        port=5432,
        database="hedgedoc",
        user="hedgedoc",
        password="password",
    )
    return conn.cursor()


def get_json_path(arg_path: Path):
    """
    Retorna: endereço do arquivo `.json`.
    """
    path = Path(arg_path)

    if path.suffix == ".json":
        if not path.exists():
            return

    if path.is_dir():
        json_files = list(arg_path.glob("*.json"))
        if not json_files:
            return
        path = json_files[0]

    return path


def main():
    """
    Diagr.
    """
    parser = argparse.ArgumentParser()

    parser.add_argument("path", type=Path)
    parser.add_argument("-l", "--local", action="store_true", default=False)
    parser.add_argument("-e", "--exam", action="store_true", default=False)
    parser.add_argument("-s", "--solution", action="store_true", default=False)

    args = parser.parse_args()

    console = Console(log_path=False)
    console.rule("[bold blue]Diagramador")

    # procura o arquivo de configurações `.json`
    path = get_json_path(args.path)
    if not path:
        console.log(
            "[bold red]ERRO!",
            "Arquivo '.json' não encontrado em:",
            f"[magenta]'{args.path}'",
        )
        console.rule()
        return

    # valida o `.json`
    try:
        exam = Exam.parse_jsonfile(console, path)
    except ValidationError as exc:
        console.log(exc)
        console.rule()
        return

    # modo hedgedoc/local
    if not exam.local:
        exam.local = args.local

    # modo local/hedgedoc
    if not args.local:
        try:
            cursor = connect()
            console.log(
                "[bold cyan]CONECTADO!",
                "Carregando problemas da base de dados:\n",
            )
            console.log("Carregando problemas da base de dados:")
        except:
            console.log(
                "[bold red]ERRO!",
                "Falha na conexão com a base de dados!\n",
            )
            exam.status = 1
    else:
        cursor = None
        console.log(
            "Carregando problemas no diretório local:",
            f"[magenta]'{exam.path.parent}'\n",
        )

    # carrega os problemas.
    if exam.status_ok():
        exam.process_problems(console, cursor=cursor)

    # executa os comandos para criação do `.pdf`
    if args.exam and exam.status_ok():
        exam.create_exam_pdf(console)
    if args.solution and exam.status_ok():
        exam.create_solution_pdf(console)

    exam.write_json()

    console.log(
        "Diagramação [bold]finalizada[/bold]. Status:",
        "[bold cyan]OK!" if exam.status_ok() else "[bold red]ERRO!",
    )
    console.rule()


if __name__ == "__main__":
    main()
