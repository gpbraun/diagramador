from diagramador.exam import Exam
from pathlib import Path

# TODO: no JSON, colocar o texto das questões convertido pelo PANDOC. Ele só roda dnv se a versão estiver desatualizada, se não puxa do JSON.


def generate_exam(path: str | Path):
    if not isinstance(path, Path):
        path = Path(path)

    exam = Exam.parse_json(json_path=path.joinpath(f"{path.stem}.json"))
    exam.write_pdf(Path("tmp").joinpath(path), path)
    # exam.write_solutions_pdf(Path("tmp").joinpath(path), path)


def main():
    generate_exam("2023/em/em_2_p2a")
    generate_exam("2023/em/em_2_p2b")


if __name__ == "__main__":
    main()
