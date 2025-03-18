from pathlib import Path

from pydantic import BaseModel


class Error(BaseModel):
    """
    Mensagem de erro.
    """

    file: Path
    line: int
    message: str
    snippet: str

    def __eq__(self, other) -> bool:
        """
        Retorna: True se os erros são iguais.
        """
        if all(
            [
                self.line == other.line,
                self.file.stem == other.file.stem,
                self.message == other.message,
            ]
        ):
            return True

        return False
