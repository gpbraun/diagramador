from diagramador.exam import Exam
from pathlib import Path


def generate_exam(path: str | Path):
    if not isinstance(path, Path):
        path = Path(path)

    exam = Exam.parse_json(json_path=path.joinpath(f"{path.stem}.json"))
    exam.write_pdf(Path("tmp").joinpath(path), path)
    exam.write_solutions_pdf(Path("tmp").joinpath(path), path)


def main():
    generate_exam("2023/qui_1_dis")


if __name__ == "__main__":
    main()
