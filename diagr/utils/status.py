"""
Base de dados para problemas de química, Gabriel Braun, 2024

Esse módulo implementa funções do TECTONIC.
"""

from enum import Enum


class Status(Enum):
    """
    Estado do parsing.
    """

    DATABASE_ERROR = -3
    PANDOC_ERROR = -2
    LATEX_ERROR = -1
    EMPTY = 0
    PANDOC_OK = 1
    LATEX_OK = 2

    @classmethod
    def is_ok(cls, status):
        """
        Retorna: verdadeiro se não há erro.
        """
        if status in {
            cls.DATABASE_ERROR,
            cls.PANDOC_ERROR,
            cls.LATEX_ERROR,
        }:
            return False

        return True
