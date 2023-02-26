A técnica de calorimetria exploratória diferencial pode ser aplicada para determinar a entalpia de desnaturação uma proteína. Uma amostra contendo $\pu{1 g}$ da proteína e uma amostra de alumínio são colocadas no equipamento. O alumínio recebe uma taxa constante de calor de forma que sua temperatura varia $\pu{1 K.s-1}$. A taxa de calor fornecida à proteína varia de forma que a temperatura da proteína e do alumínio permanecem iguais em todo o processo. O termograma a seguir apresenta a taxa de calor fornecida à proteína em função de sua temperatura.

```latex
\begin{tikzpicture}
    \begin{axis}
        [
            grid = major,
            xlabel = {Temperatura, $T/\si{\celsius}$},
            ylabel = {Taxa de troca de calor, $\dot{Q}/\si{J.min^{-1}}$},
            xmin=20, xmax=100,
            ymin=59, ymax=71,
        ]
    \draw [very thick, rounded corners=2em, blue]
        (axis cs: 20,60) -- 
        (axis cs: 40,60) -- 
        (axis cs: 60, 70.75) -- 
        (axis cs: 80, 62) -- 
        (axis cs: 100, 62);
    \end{axis}
\end{tikzpicture}
```

a. **Classifique** a desnaturação como endotérmica ou exotérmica.
b. **Compare** a capacidade calorífica da proteína antes e após a desnaturação.
c. **Estime** a variação de entalpia da desnaturação.
