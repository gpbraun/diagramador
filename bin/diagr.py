from diagramador.exam import Exam

from pathlib import Path
import sys

import psycopg2


def main(hedgedoc_paths):
    conn = psycopg2.connect(
        host="192.168.0.54",
        port=5432,
        database="hedgedoc",
        user="hedgedoc",
        password="password",
    )
    cursor = conn.cursor()

    if isinstance(hedgedoc_paths, str):
        hedgedoc_paths = [hedgedoc_paths]

    exam = Exam.parse_hedgedoc(
        cursor,
        id_="teste1",
        hedgedoc_paths=hedgedoc_paths,
        title="sampini",
        template="IME",
    )
    exam.write_pdf(Path("tmp/test"), Path("./test"))


if __name__ == "__main__":
    main(sys.argv[1:])
