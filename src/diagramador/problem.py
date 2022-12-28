"""Base de dados para problemas de química, Gabriel Braun, 2022

Esse módulo implementa uma classe para os problemas.
"""
from diagramador.latex.commands import env, itemize
from diagramador.utils.text import md2soup, soup_split, html2tex
from diagramador.utils.autoprops import autoprops

import base64
from pathlib import Path

import frontmatter
from pydantic import BaseModel


class Problem(BaseModel):
    """Problema."""

    id_: str
    statement: str
    solution: str = None
    choices: list[str] = None
    correct_choice: int = None

    @property
    def is_objective(self):
        """Verifica se o problema é objetivo."""
        return True if self.choices else False

    def tex_choices(self):
        """Retorna as alternativas do problema formatadas em latex."""
        if not self.is_objective:
            return ""

        return itemize("choices", self.choices, sep_cmd="item")

    def tex_correct_choice(self):
        """Retorna as respostas do problema formatados em latex."""
        if not self.is_objective:
            return ""

        return chr(65 + self.correct_choice)

    def tex(self, points):
        """Retorna o enunciado completo do problema em LaTeX."""

        parameters = {
            "points": str(points),
        }

        return env("problem", self.statement + self.tex_choices(), keys=parameters)

    @classmethod
    def parse_mdstr(cls, id_: str, md_str: str):
        """Cria um `Problem` a partir de um arquivo `.md`."""

        metadata, content = frontmatter.parse(md_str)

        # informações básicas
        problem = {"id_": id_}

        # conteúdo
        soup = md2soup(content)

        # resolução
        soup, solution = soup_split(soup, "hr")

        # problema objetivo: normal
        choice_list = soup.find("ul", {"class": "task-list"})
        if choice_list:
            choices = []
            for index, li in enumerate(choice_list.find_all("li")):
                choice = html2tex(li)
                choices.append(choice)
                check_box = li.find("input").extract()
                if check_box.has_attr("checked"):
                    problem["correct_choice"] = index
            problem["choices"] = choices
            choice_list.decompose()
            if solution:
                problem["solution"] = html2tex(solution.extract())
            problem["statement"] = html2tex(soup)

            return cls.parse_obj(problem)

        # problema objetivo: V ou F
        proposition_input = soup.find("input", {"type": "checkbox"})
        if proposition_input:
            proposition_list = proposition_input.parent.parent
            true_props = []
            for index, li in enumerate(proposition_list.find_all("li")):
                check_box = li.find("input").extract()
                if check_box.has_attr("checked"):
                    true_props.append(index)
            choices, correct_choice = autoprops(true_props)
            problem["choices"] = choices
            problem["correct_choice"] = correct_choice
            if solution:
                problem["solution"] = html2tex(solution.extract())
            problem["statement"] = html2tex(soup)

            return cls.parse_obj(problem)

        # problema discursivo
        if solution:
            problem["solution"] = html2tex(solution.extract())
        problem["statement"] = html2tex(soup)

        return cls.parse_obj(problem)

    @classmethod
    def parse_hedgedoc(cls, cursor, hedgedoc_path: str):
        """Retorna o problema em um link do hedgedoc."""
        link = str(Path(hedgedoc_path).stem)
        print(f"Extraindo problema no link: {link}")

        bytes_id = bytes.hex(base64.urlsafe_b64decode(link + "=="))
        p_id = "-".join(
            [bytes_id[x:y] for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]]
        )
        cursor.execute(f"""SELECT * FROM "Notes" WHERE id = {"'"+p_id+"'"}""")
        query_results = cursor.fetchall()

        print(query_results)
        # get YAML data and contents
        return cls.parse_mdstr(link, query_results[0][2])
