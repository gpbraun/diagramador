from diagramador.exam import Exam

import argparse
from pathlib import Path

import psycopg2


def main(exam_folder_path, solution=False):
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
    if solution:
        exam.write_solutions_pdf(exam_folder_path)
    else:
        exam.write_pdf(exam_folder_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--solution", action="store_true")
    parser.add_argument("exampath")
    args = parser.parse_args()
    main(args.exampath, args.solution)
