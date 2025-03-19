from rich.console import Console


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


console = DiagrConsole()
