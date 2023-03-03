O gráfico a seguir apresenta a taxa de liberação de calor para uma reação química. Ao final da reação é formado $\pu{1 mol}$ de produto.

```latex
\begin{tikzpicture}
\begin{axis}
    [
        grid = major,
        xlabel = {Tempo, $t/\si{min}$},
        ylabel = {Taxa de troca de calor, $\dot{Q}/\si{J.min^{-1}}$},
        xmin=0, xmax=12,
        ymin=0, ymax=3,
    ]
\draw [very thick, rounded corners=1em, blue]
    (axis cs: 0,0) --
    (axis cs: 3,0) --
    (axis cs: 6,2.75) --
    (axis cs: 9,0) --
    (axis cs: 12,0);
\end{axis}
\end{tikzpicture}
```

a. **Determine** o calor liberado até 11 minutos de reação.
b. **Determine** a quantidade de produto formada até 4 minutos de reação.


