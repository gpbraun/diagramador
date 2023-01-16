from diagramador.exam import Exam
from pathlib import Path

path = Path("2023/qui_0")


def main():
    exam = Exam.parse_json(json_path=path.joinpath(f"{path.stem}.json"))
    exam.write_pdf(Path("tmp").joinpath(path), path)
    exam.write_solutions_pdf(Path("tmp").joinpath(path), path)


if __name__ == "__main__":
    main()
