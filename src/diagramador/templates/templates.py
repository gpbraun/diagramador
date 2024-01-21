import jinja2

JINJA_LATEX_ENV = jinja2.Environment(
    block_start_string="((*",
    block_end_string="*))",
    variable_start_string="(((",
    variable_end_string=")))",
    comment_start_string="((#",
    comment_end_string="#))",
    trim_blocks=True,
    lstrip_blocks=True,
    loader=jinja2.PackageLoader("diagramador"),
)

TEMPLATES = {
    "IME": "ime",
    "ITA": "ita",
    "EN": "mil",
    "AFA": "mil",
    "EFOMM": "mil",
    "ESPCEX": "mil",
    "FLEX": "mil",
    "PROVA": "prova",
    "GABARITO": "gabarito",
}


def render_doc(problem_dict: dict, template_name: str):
    """
    Retorna: arquivo em LaTeX da avaliação.
    """
    try:
        name = TEMPLATES[template_name.upper()]
        template = JINJA_LATEX_ENV.get_template(f"exam/{name}.tex.j2")
    except (KeyError, jinja2.exceptions.TemplateNotFound):
        template = JINJA_LATEX_ENV.get_template(f"exam/base.tex.j2")
    tex_str = template.render(problem_dict)
    return tex_str


def render_problem(problem_dict: dict):
    """
    Retorna: arquivo em LaTeX do problema.
    """
    template = JINJA_LATEX_ENV.get_template("problem/problem.tex.j2")
    tex_str = template.render(problem_dict)
    return tex_str


def render_solution(problem_dict: dict):
    """
    Retorna: arquivo em LaTeX da solução para o problema.
    """
    template = JINJA_LATEX_ENV.get_template("problem/solution.tex.j2")
    tex_str = template.render(problem_dict)
    return tex_str
