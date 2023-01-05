from diagramador.exam import Exam

from pathlib import Path
import sys

import psycopg2


def main(exam_folder_path):
    conn = psycopg2.connect(
        host="localhost",
        port=5432,
        database="hedgedoc",
        user="hedgedoc",
        password="password",
    )
    cursor = conn.cursor()

    exam_folder_path = Path(exam_folder_path)

    exam = Exam.parse_bro(cursor, json_path=exam_folder_path.joinpath("input.json"))
    exam.write_pdf(exam_folder_path)


if __name__ == "__main__":
    main(sys.argv[1])
