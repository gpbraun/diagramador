from diagramador.exam import Exam
from pathlib import Path


def main():
    exam = Exam.parse_json(json_path=Path("test/input.json"))
    exam.write_pdf(Path("tmp/test"), Path("./test"))
    exam.write_solutions_pdf(Path("tmp/test"), Path("./test"))


if __name__ == "__main__":
    main()
