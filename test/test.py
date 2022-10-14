from diagramador.problem import Problem
from diagramador.exam import Exam

from pathlib import Path

import psycopg2


def main():
    conn = psycopg2.connect(
        host="192.168.0.54",
        port=5432,
        database="hedgedoc",
        user="hedgedoc",
        password="password",
    )
    cursor = conn.cursor()
    print("Conectado")

    links = [
        "OXGO0otySbahbWtJTS-wtQ",
    ]

    exam = Exam.parse_hedgedoc(
        cursor,
        id_="teste1",
        hedgedoc_paths=links,
        title="sampini",
        template="IME",
    )
    exam.write_pdf(Path("tmp/test"), Path("./test"))


if __name__ == "__main__":
    main()
