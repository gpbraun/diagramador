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
\draw [very thick, rounded corners=1em, blue]
    (axis cs: 20,60) -- 
    (axis cs: 40,60) -- 
    (axis cs: 60, 70.4) -- 
    (axis cs: 80, 62) -- 
    (axis cs: 100, 62);
\end{axis}
\end{tikzpicture}
```

a. **Classifique** a desnaturação como endotérmica ou exotérmica.
b. **Compare** a capacidade calorífica da proteína antes e após a desnaturação.
c. **Estime** a variação de entalpia da desnaturação.

---

#### **(a)** Compare a taxa de aquecimento do aparelho ao longo da reação química.

Após o início da reação o equipamento fornece energia adicional ao sistema para garantir o aumento constante de temperatura de $\pu{1 K.s-1}$. Assim, o reação de desnaturação é endotérmica.


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
\draw [name path=A, very thick, dashed, blue]
    (axis cs: 20,60) -- 
    (axis cs: 37,60) -- 
    (axis cs: 83, 62) -- 
    (axis cs: 100, 62);

\draw [name path=B, very thick, rounded corners=1em, blue]
    (axis cs: 20,60) -- 
    (axis cs: 40,60) -- 
    (axis cs: 60, 70.4) -- 
    (axis cs: 80, 62) -- 
    (axis cs: 100, 62);

\tikzfillbetween[of=A and B]{blue, semitransparent};
\end{axis}
\end{tikzpicture}
```

A área em azul mostra o calor adicional que foi fornecido pelo equipamento durante o aquecimento para compensar o efeito de absorção de energia da reação química.

#### **(c)** Compare a taxa de aquecimento antes e após a desnaturação.

#### **(c)** Calcule a área 

$$
    \text{Área}
    =
    \dfrac{1}{2}
    \begin{vmatrix}
        x_1 & y_1 \\
        x_2 & y_2 \\
        x_3 & y_3
    \end{vmatrix}
    =
    \dfrac{1}{2}
    \begin{vmatrix}
        40 & 60 \\
        60 & 70 \\
        80 & 62
    \end{vmatrix}
    \,\pu{J.K//min}
    =
    \pu{360  J.K-1.min-1}
$$