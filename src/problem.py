#
# DOME - Gabriel Braun, 2021
#

# TODO:
# - Gerar o "elements"

from attr import frozen, Factory
from frontmatter import load, loads
from pathlib import Path
import base64

import convert
import latex
from data import read_datasets, DataSet, CONSTANTS

from multiprocessing import Pool

import sys


DATA = read_datasets('database/data')


@frozen
class Problem:
    id_: str
    path: Path
    statement: str
    solution: str = ''
    answer: list = Factory(list)
    constants: DataSet = Factory(DataSet)
    data: DataSet = Factory(DataSet)
    elements: list = Factory(list)
    obj: int = -1
    choices: list = Factory(list)

    def is_obj(self):
        if self.obj == -1:
            return False

        return True

    def tex_statement(self):
        return convert.md2tex(self.statement) + self.tex_choices()

    def tex_solution(self):
        contents = convert.md2tex(self.solution)
        if self.is_obj():
            return latex.env('solution', f'[{chr(65 + self.obj)}]\n{contents}')
    
        return latex.env(f'solution', contents)

    def tex_data(self, print_data=True):
        # return data as tex list with header
        if not self.data or not print_data:
            return ''

        header = latex.section('Dados', level=2, numbered=False)
        data = self.data.tex_display() if print_data else ''

        return header + latex.cmd('small') + data

    def tex_choices(self):
        # return choices as tex list
        if not self.is_obj():
            return ''

        tex_choices = [
            latex.cmd('everymath', latex.cmd('displaystyle')) +
            convert.md2tex(c)
            for c in self.choices
        ]
        return latex.enum(
            'choices', tex_choices, auto_cols=True, sep_cmd='task'
        )

    def tex_answer(self):
        if not self.answer:
            return '-'

        if self.is_obj():
            return chr(65 + self.obj)

        if len(self.answer) == 1:
            return self.answer[0]

        return latex.enum('answers', self.answer)

    def astex(self, points=1.0, print_solution=False, print_data=True):
        # return problem as tex
        contents = self.tex_statement() + self.tex_data()

        parameters = {
            'id': self.id_,
            'path': self.path.parent,
            'points': points,
        }

        if not print_solution:
            args = f'[{latex.key(parameters)}]\n{contents}'
            return latex.env('problem', args)

        parameters['breakable'] = 'true'
        args = f'[{latex.key(parameters)}]\n{contents+self.tex_solution()}'

        return latex.env('problem', args)


def link2problem(cur, link):
    # get problem contents from link
    try:
        bytes_id = bytes.hex(base64.urlsafe_b64decode(link+"=="))
        p_id = '-'.join(
            [bytes_id[x:y]
                for x, y in [(0, 8), (8, 12), (12, 16), (16, 20), (20, 32)]]
        )
        cur.execute(f'''SELECT * FROM "Notes" WHERE id = {"'"+p_id+"'"}''')
        query_results = cur.fetchall()

        # get YAML data and contents
        pfile = loads(query_results[0][2])
        return problem_contents(link, Path(), pfile)
    except:
        print(f'editor.painelcupula.com/{link}')
        sys.exit(1)
    


def file2problem(path):
    # get YAML data and contents
    pfile = load(path)
    return problem_contents(path.stem, path.resolve(), pfile)


def problem_contents(id_, path, pfile):
    kwargs = {}
    kwargs['id_'] = id_
    kwargs['path'] = path

    soup = convert.md2soup(pfile.content)

    # remove problem title
    if soup.h1:
        soup.h1.decompose()

    # get problem constants
    if 'constants' in pfile:
        kwargs['constants'] = CONSTANTS.filter('id_', pfile['constants'], )
    elif 'constantes' in pfile:
        kwargs['constants'] = CONSTANTS.filter('id_', pfile['constantes'])

    # get problem data
    if 'data' in pfile:
        kwargs['data'] = DATA.filter('id_', pfile['data'])
    elif 'dados' in pfile:
        kwargs['data'] = DATA.filter('id_', pfile['dados'])

    # get problem elements
    if 'elements' in pfile:
        kwargs['elements'] = pfile['elements']
    elif 'elementos' in pfile:
        kwargs['elements'] = pfile['elementos']

    soup, solution = convert.soup_split(soup, 'hr')

    # problema objetivo: normal
    choice_list = soup.find('ul', class_='task-list')
    if choice_list:
        # get problem choices, obj and answer
        choices = []
        # Problem.is_obj() returns trus even if there is no correct choice
        kwargs['obj'] = 0
        for index, item in enumerate(choice_list.find_all('li')):
            choice = convert.html2md(item)
            choices.append(choice)
            check_box = item.find('input').extract()
            if check_box.has_attr('checked'):
                kwargs['obj'] = index
                kwargs['answer'] = [choice]
        kwargs['choices'] = choices
        choice_list.decompose()

        if solution:
            kwargs['solution'] = convert.html2md(solution.extract())

        kwargs['statement'] = convert.html2md(soup)

        return Problem(**kwargs)

    # problema objetivo: V ou F
    prop_list = soup.find('ol', class_='task-list')
    if prop_list:
        true_props = []
        for index, item in enumerate(prop_list.find_all('li')):
            check_box = item.find('input').extract()
            if check_box.has_attr('checked'):
                true_props.append(index)
        kwargs['choices'], kwargs['answer'], kwargs['obj'] = \
            autoprops(true_props)

        if solution:
            kwargs['solution'] = convert.html2md(solution.extract())

        kwargs['statement'] = convert.html2md(soup)

        return Problem(**kwargs)

    # problema discursivo
    if solution:
        kwargs['solution'] = convert.html2md(solution.extract())

    kwargs['statement'] = convert.html2md(soup)

    return Problem(**kwargs)


@frozen
class ProblemSet:
    problems: list[Problem] = Factory(list)
    id_: str = 'P'
    title: str = 'Problemas'

    def __len__(self):
        return len(self.problems)

    def asdict(self, attr):
        return {getattr(p, attr): p for p in self.problems}

    def filter(self, attr, problem_attrs, id_="", title=""):
        if not id_:
            id_ = f'{self.id_}1'
        if not title:
            title = f'{self.title} 1'
        # get ProblemSet from list of ids
        p_dict = self.asdict(attr)
        return ProblemSet([p_dict[a] for a in problem_attrs], id_, title)

    def elements(self):
        elements = []
        for p in self.problems:
            if p.elements:
                elements += p.elements
        return elements

    def tex_constants(self):
        return sum([p.constants for p in self.problems])

    def tex_data(self, header_level):
        constants = self.tex_constants()
        elements = self.elements()

        if self.title == "Química":
            elements += [
                'H', 'He', 'C', 'N', 'O', 'F', 'Ne', 
                'Na', 'Mg', 'S', 'Cl', 'Ar', 'K', 'Ca', 
                'Cr', 'Fe', 'Cu', 'Zn', 'Br', 'I',
            ]
    
        if not constants.data and not elements:
            return ''

        header = latex.section('Dados', level=header_level, numbered=False)

        el_header = latex.section('Elementos', level=2, numbered=False)
        elements_table = el_header + latex.cmd(
            'MolTable', ','.join(elements)) if elements else ''

        const_header = latex.section('Constantes', level=2, numbered=False)
        constants_list = const_header \
            + constants.tex_display() if constants else ''

        return header + latex.pu2qty(constants_list + elements_table) + latex.cmd('EndData')

    def tex_statements(self, title='', points=1.0, print_solutions=False,
                       print_data=True, newpage=False, data_header_level=1):
        # get statements in latex format
        if not self.problems:
            return ''

        statements = '\n'.join(
            [p.astex(points, print_solutions, print_data)
             for p in self.problems]
        )

        if print_data:
            statements = self.tex_data(header_level=data_header_level) + statements

        return latex.section(title, newpage=newpage) + statements

    def tex_answers(self, title=''):
        # get answers in latex format
        if not self.problems:
            return ''

        header = latex.section(title, level=1, numbered=False)
        answers = [p.tex_answer() for p in self.problems]

        if all([p.is_obj() for p in self.problems]):
            return header + latex.enum('checks', answers, cols=15)

        return header + latex.enum('answers', answers)


def files2problemset(path):
    # get problemset from list of paths
    pool = Pool()
    return ProblemSet(pool.map(file2problem, path))


def links2problemset(cur, links, **kwargs):
    # get YAML data and contents
    return ProblemSet([link2problem(cur, link) for link in links], **kwargs)


def autoprops(true_props):
    # generate choices for T/F problems
    if not true_props:
        choices = [
            '**N**'
            '**1**',
            '**2**',
            '**3**',
            '**4**',
        ]
        obj = 0
    # Uma correta
    if true_props == [0]:
        choices = [
            '**1**',
            '**2**',
            '**1** e **2**',
            '**1** e **3**',
            '**1** e **4**',
        ]
        obj = 0
    if true_props == [1]:
        choices = [
            '**1**',
            '**2**',
            '**1** e **2**',
            '**2** e **3**',
            '**2** e **4**'
        ]
        obj = 1
    if true_props == [2]:
        choices = [
            '**2**',
            '**3**',
            '**1** e **3**',
            '**2** e **3**',
            '**3** e **4**'
        ]
        obj = 1
    if true_props == [3]:
        choices = [
            '**3**',
            '**4**',
            '**1** e **4**',
            '**2** e **4**',
            '**3** e **4**'
        ]
        obj = 1
    # Duas corretas
    if true_props == [0, 1]:
        choices = [
            '**1**',
            '**2**',
            '**1** e **2**',
            '**1**, **2** e **3**',
            '**1**, **2** e **4**'
        ]
        obj = 2
    if true_props == [0, 2]:
        choices = [
            '**1**',
            '**3**',
            '**1** e **3**',
            '**1**, **2** e **3**',
            '**1**, **3** e **4**'
        ]
        obj = 2
    if true_props == [0, 3]:
        choices = [
            '**1**',
            '**4**',
            '**1** e **4**',
            '**1**, **2** e **4**',
            '**1**, **3** e **4**'
        ]
        obj = 2
    if true_props == [1, 2]:
        choices = [
            '**2**',
            '**3**',
            '**2** e **3**',
            '**1**, **2** e **3**',
            '**2**, **3** e **4**'
        ]
        obj = 2
    if true_props == [1, 3]:
        choices = [
            '**2**',
            '**4**',
            '**2** e **4**',
            '**1**, **2** e **4**',
            '**2**, **3** e **4**'
        ]
        obj = 2
    if true_props == [2, 3]:
        choices = [
            '**3**',
            '**4**',
            '**3** e **4**',
            '**1**, **3** e **4**',
            '**2**, **3** e **4**'
        ]
        obj = 2
    # Três corretas
    if true_props == [0, 1, 2]:
        choices = [
            '**1** e **2**',
            '**1** e **3**',
            '**2** e **3**',
            '**1**, **2** e **3**',
            '**1**, **2**, **3** e **4**'
        ]
        obj = 3
    if true_props == [0, 1, 3]:
        choices = [
            '**1** e **2**',
            '**1** e **4**',
            '**2** e **4**',
            '**1**, **2** e **4**',
            '**1**, **2**, **3** e **4**'
        ]
        obj = 3
    if true_props == [0, 2, 3]:
        choices = [
            '**1** e **3**',
            '**1** e **4**',
            '**3** e **4**',
            '**1**, **3** e **4**',
            '**1**, **2**, **3** e **4**'
        ]
        obj = 3
    if true_props == [1, 2, 3]:
        choices = [
            '**2** e **3**',
            '**2** e **4**',
            '**3** e **4**',
            '**2**, **3** e **4**',
            '**1**, **2**, **3** e **4**'
        ]
        obj = 3
    if true_props == [0, 1, 2, 3]:
        choices = [
            '**1**, **2** e **3**',
            '**1**, **2** e **4**',
            '**1**, **3** e **4**',
            '**2**, **3** e **4**',
            '**1**, **2**, **3** e **4**'
        ]
        obj = 4
    answer = [choices[obj]]
    return choices, answer, obj


def main():
    print(0)


if __name__ == "__main__":
    main()
