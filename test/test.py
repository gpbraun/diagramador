from diagramador.problem import Problem
from diagramador.exam import Exam

from pathlib import Path


def main():
    p1_path = Path("test/problema_1.md")
    p2_path = Path("test/problema_2.md")

    p1 = Problem.parse_mdstr("p1", p1_path.read_text())
    p2 = Problem.parse_mdstr("p2", p2_path.read_text())

    exam_1 = Exam(id_="e1", title="Teste", problems=[p1, p2])

    exam_1.write_pdf(Path("tmp/test"), Path("test"))


if __name__ == "__main__":
    main()
