import argparse
from datetime import datetime
from pathlib import Path

from rich.console import Console
from rich.prompt import Prompt

from diagr import ExamParams, ProblemSetParams
from diagr.console import console

TITLES = {
    "MAT": "Matemática",
    "FIS": "Física",
    "QUI": "Química",
}


def create():
    """
    Cria uma avaliação.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("path", type=Path)
    args = parser.parse_args()

    exam_id = args.path.stem

    console.rule("[bold blue]Diagramador")

    console.print(
        "Criando avaliação",
        f"[magenta]'{exam_id}'",
        "no diretório",
        f"[magenta]'{args.path.absolute()}'\n",
    )

    if args.path.exists():
        console.print(
            "[bold red]ERRO!",
            f"O diretório [magenta]'{args.path.absolute()}'[/magenta] já existe!",
        )
        console.rule()
        return

    # PARÂMETROS BÁSICOS DA AVALIAÇÃO
    template = Prompt.ask(
        "• Modelo",
        choices=["IME", "ITA"],
        default="ITA",
    )
    title = Prompt.ask(
        "• Título",
        default="Simulado",
    )
    affiliation = Prompt.ask(
        "• Turma",
        default="Turma IME-ITA",
    )
    date = Prompt.ask(
        "• Data",
        default=str(datetime.now().year),
    )
    problem_set_num = Prompt.ask(
        "• Número de matérias",
        default="1",
    )

    problem_sets = []
    problem_count = 0
    # CONJUNTOS DE PROBLEMAS
    for problem_set_index in range(int(problem_set_num)):
        subject = Prompt.ask(
            f"\n     Matéria [bold blue]{problem_set_index + 1}",
            choices=["MAT", "FIS", "QUI"],
            default="QUI",
        )
        pset_title = TITLES[subject]

        problem_num = Prompt.ask(
            "     Número de problemas",
            default="10",
        )
        problems = [
            f"{exam_id}_{(problem_count + index + 1):02d}"
            for index in range(int(problem_num))
        ]

        problem_set = ProblemSetParams(
            title=pset_title,
            subject=subject,
            start=problem_count + 1,
            problems=problems,
        )
        problem_sets.append(problem_set)
        problem_count += int(problem_num)

    exam = ExamParams(
        id=exam_id,
        title=title,
        template=template,
        affiliation=affiliation,
        date=date,
        problem_set=problem_sets,
    )

    # CRIA OS ARQUIVOS NECESSÁRIOS
    args.path.mkdir(parents=True, exist_ok=True)
    json_path = args.path.joinpath(exam_id).with_suffix(".json")
    json_path.write_text(exam.model_dump_json(indent=4, by_alias=True))

    problem_count = 0
    for pset in exam.problem_set:
        for problem_id in pset.problem_ids:
            problem_count += 1
            problem_path = args.path.joinpath(problem_id).with_suffix(".md")
            problem_path.write_text(
                f"# {exam.title} - Problema {problem_count}\n\nEnunciado.\n"
            )

    console.rule()


if __name__ == "__main__":
    create()
