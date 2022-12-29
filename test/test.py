from diagramador.problem import Problem
from diagramador.exam import Exam, ProblemSet

from pathlib import Path


def main():
    p1_path = Path("test/problema_1.md")
    p2_path = Path("test/problema_2.md")
    p3_path = Path("test/problema_3.md")

    p1 = Problem.parse_mdstr("p1", p1_path.read_text())
    p2 = Problem.parse_mdstr("p2", p2_path.read_text())
    p3 = Problem.parse_mdstr("p3", p3_path.read_text())

    p_set1 = ProblemSet(title="Matemática", problems=[p1])
    p_set2 = ProblemSet(title="Química", problems=[p2, p3])

    exam = Exam(
        id_="teste",
        title="Um teste",
        template="IME",
        problem_sets=[p_set1, p_set2],
    )

    exam.write_pdf(Path("tmp/test"), Path("./test"))
    exam.write_solutions_pdf(Path("tmp/test"), Path("./test"))


if __name__ == "__main__":
    main()
