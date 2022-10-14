from diagramador.problem import Problem
from diagramador.exam import Exam

from pathlib import Path
import base64

import psycopg2


def link2problem(cur, link: str):
    # get problem contents from link
    bytes_id = bytes.hex(base64.urlsafe_b64decode(link + "=="))
    p_id = "-".join(
        [bytes_id[x:y] for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]]
    )
    cur.execute(f"""SELECT * FROM "Notes" WHERE id = {"'"+p_id+"'"}""")
    query_results = cur.fetchall()

    # get YAML data and contents
    return Problem.parse_mdstr(link, query_results[0][2])


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

    p = link2problem(cursor, "OXGO0otySbahbWtJTS-wtQ")

    exam = Exam(id_="teste1", title="sampini", template="prova", problems=[p])
    exam.write_pdf(Path("tmp/test"), Path("./test"))


if __name__ == "__main__":
    main()
