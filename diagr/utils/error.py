from pathlib import Path

from pydantic import BaseModel
from rich.panel import Panel
from rich.syntax import Syntax

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
        console.print(
            Panel(
                Syntax.from_path(
                    str(self.file),
                    line_numbers=True,
                    theme="monokai",
                    background_color="default",
                    highlight_lines={self.line},
                    line_range=(self.line - 2, self.line + 2),
                ),
                padding=(1, 1),
                width=100,
                title=f"[magenta]'{self.file}'[bold]:{self.line}[/bold][/magenta]",
                subtitle=f"[bold]{self.message}[/bold]",
                border_style="red",
            ),
        )

        return self.status
