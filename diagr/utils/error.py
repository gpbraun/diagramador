from pathlib import Path

from pydantic import BaseModel

from diagr.console import console


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
        Função usada para remover os erros duplicados no log do tectonic.

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

    def log(self) -> None:
        """
        Log do erro no console.
        """
        console.print_error_file(self.file, self.line, self.message)
