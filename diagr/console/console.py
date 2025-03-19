from pathlib import Path

from rich.console import Console
from rich.panel import Panel
from rich.syntax import Syntax


class DiagrConsole(Console):
    """
    Console do CLI do DIAGR.
    """

    def print_warning(self, *messages) -> None:
        """
        Log de warning no console
        """
        console.print("• [bold yellow]ATENÇÃO!", *messages)

    def print_error(self, *messages) -> None:
        """
        Log de erro no console
        """
        console.print("• [bold red]ERRO!", *messages)

    def print_error_file(
        self, file: Path, line: int, message: str | None = None
    ) -> None:
        """
        Log de erro em arquivo no console.
        """
        console.print(
            Panel(
                Syntax.from_path(
                    str(file),
                    line_numbers=True,
                    theme="monokai",
                    background_color="default",
                    highlight_lines={line},
                    line_range=(line - 2, line + 2),
                ),
                padding=(1, 1),
                width=100,
                title=f"[magenta]'{file}'[bold]:{line}[/bold][/magenta]",
                subtitle=f"[bold]{message}[/bold]" if message else None,
                border_style="red",
            ),
        )


console = DiagrConsole()
"""
Instância do console DIAGR.
"""
