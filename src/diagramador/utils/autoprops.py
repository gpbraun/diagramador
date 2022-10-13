"""Gabriel Braun, 2022

Esse módulo implementa funções para geração automática de alternativas.
"""


def autoprops(true_props):
    """Cria as alternativas para problemas de V ou F."""
    if not true_props:
        choices = [
            "NDA",
            "\\textbf{1}",
            "\\textbf{2}",
            "\\textbf{3}",
            "\\textbf{4}",
        ]
        correct_choice = 0
    # Uma correta
    if true_props == [0]:
        choices = [
            "\\textbf{1}",
            "\\textbf{2}",
            "\\textbf{1} e \\textbf{2}",
            "\\textbf{1} e \\textbf{3}",
            "\\textbf{1} e \\textbf{4}",
        ]
        correct_choice = 0
    if true_props == [1]:
        choices = [
            "\\textbf{1}",
            "\\textbf{2}",
            "\\textbf{1} e \\textbf{2}",
            "\\textbf{2} e \\textbf{3}",
            "\\textbf{2} e \\textbf{4}",
        ]
        correct_choice = 1
    if true_props == [2]:
        choices = [
            "\\textbf{2}",
            "\\textbf{3}",
            "\\textbf{1} e \\textbf{3}",
            "\\textbf{2} e \\textbf{3}",
            "\\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 1
    if true_props == [3]:
        choices = [
            "\\textbf{3}",
            "\\textbf{4}",
            "\\textbf{1} e \\textbf{4}",
            "\\textbf{2} e \\textbf{4}",
            "\\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 1
    # Duas corretas
    if true_props == [0, 1]:
        choices = [
            "\\textbf{1}",
            "\\textbf{2}",
            "\\textbf{1} e \\textbf{2}",
            "\\textbf{1}, \\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2} e \\textbf{4}",
        ]
        correct_choice = 2
    if true_props == [0, 2]:
        choices = [
            "\\textbf{1}",
            "\\textbf{3}",
            "\\textbf{1} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 2
    if true_props == [0, 3]:
        choices = [
            "\\textbf{1}",
            "\\textbf{4}",
            "\\textbf{1} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2} e \\textbf{4}",
            "\\textbf{1}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 2
    if true_props == [1, 2]:
        choices = [
            "\\textbf{2}",
            "\\textbf{3}",
            "\\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2} e \\textbf{3}",
            "\\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 2
    if true_props == [1, 3]:
        choices = [
            "\\textbf{2}",
            "\\textbf{4}",
            "\\textbf{2} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2} e \\textbf{4}",
            "\\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 2
    if true_props == [2, 3]:
        choices = [
            "\\textbf{3}",
            "\\textbf{4}",
            "\\textbf{3} e \\textbf{4}",
            "\\textbf{1}, \\textbf{3} e \\textbf{4}",
            "\\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 2
    # Três corretas
    if true_props == [0, 1, 2]:
        choices = [
            "\\textbf{1} e \\textbf{2}",
            "\\textbf{1} e \\textbf{3}",
            "\\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 3
    if true_props == [0, 1, 3]:
        choices = [
            "\\textbf{1} e \\textbf{2}",
            "\\textbf{1} e \\textbf{4}",
            "\\textbf{2} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 3
    if true_props == [0, 2, 3]:
        choices = [
            "\\textbf{1} e \\textbf{3}",
            "\\textbf{1} e \\textbf{4}",
            "\\textbf{3} e \\textbf{4}",
            "\\textbf{1}, \\textbf{3} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 3
    if true_props == [1, 2, 3]:
        choices = [
            "\\textbf{2} e \\textbf{3}",
            "\\textbf{2} e \\textbf{4}",
            "\\textbf{3} e \\textbf{4}",
            "\\textbf{2}, \\textbf{3} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 3
    # Todas corretas
    if true_props == [0, 1, 2, 3]:
        choices = [
            "\\textbf{1}, \\textbf{2} e \\textbf{3}",
            "\\textbf{1}, \\textbf{2} e \\textbf{4}",
            "\\textbf{1}, \\textbf{3} e \\textbf{4}",
            "\\textbf{2}, \\textbf{3} e \\textbf{4}",
            "\\textbf{1}, \\textbf{2}, \\textbf{3} e \\textbf{4}",
        ]
        correct_choice = 4

    return choices, correct_choice
