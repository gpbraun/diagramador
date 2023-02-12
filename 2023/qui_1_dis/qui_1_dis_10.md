O grafeno é constituído de uma folha bidimensional de átomos de carbono, com apenas um átomo de espessura. Nesse material, os átomos de carbono estão em um arranjo hexagonal, em que a área de cada hexágono é $\pu{5e-20 m2}$. O grafeno possui excelentes propriedades de adsorção, podendo adsorver moléculas de ambos os lados da folha quando suspenso.

Pesquisadores da Universidade de Manchester conduziram um experimento em que gás nitrogênio a $\pu{0 \degree C}$ e $\pu{1 atm}$ foi adsorvido sobre uma folha de grafeno colocada sobre um suporte sólido. O arranjo das moléculas de nitrogênio sobre o grafeno é mostrado a seguir:

```latex
\begin{tikzpicture}
\begin{axis}
    [
        grid = major,
        xlabel = {Temperatura, $T$},
        ylabel = {Entalpia, $H$},
        ytick=\empty,  
        xtick={1.5,3.5},
        xticklabels={$T_1$,$T_2$},
    ]
\addplot [blue] coordinates
    {
        (1,2)
        (4,8)
    };
\addplot [blue] coordinates
    {
        (1,1)
        (4,3)
    };
\draw [ draw=black, thick, -stealth ]
    (axis cs: 1.5, 3) -- node [right] {$\Delta H_{T_1}^\circ$}
    (axis cs: 1.5, 1.35);
\draw [ draw=black, thick, -stealth ]
    (axis cs: 3.5, 7) -- node [right] {$\Delta H_{T_2}^\circ$}
    (axis cs: 3.5, 2.7);

\node [anchor = south west] at (axis cs:2,6) 
    {Reagentes};
\node [anchor = south west] at (axis cs:2,0.8) 
    {Produtos};

\end{axis}
\end{tikzpicture}
```

a. **Determine** área da superfície de adsorção de uma folha de $\pu{1 g}$ de grafeno suspensa.
b. **Determine** o volume ocupado pelas moléculas de nitrogênio adsorvidas no experimento.
c. **Determine** a espessura da camada de nitrogênio adsorvida sobre o filme de grafeno.

---

#### **(a)** Converta a massa de grafeno em quantidade de carbono.

De $n = m/M$,
$$
    n = \dfrac{ \pu{1 g} }{ \pu{12 g//mol} } = \pu{0,083 mol}
$$
#### Calcule o número de átomos de carbono em $\pu{0,083 mol}$ de carbono.

De $N = N_\mathrm{A} n$,
$$
    N_{\mathrm{C}} = (\pu{6e23 mol-1}) \times (\pu{0,083 mol}) = \pu{5e22}
$$

#### Calcule o número de hexágonos em $\pu{5e22}$ de carbono.

Cada hexágono é formado por 6 átomos de carbono, e cada átomo de carbono está em 3 hexágono.
$$
    N_\mathrm{hex} = \dfrac{3}{6} \times (\pu{5e22}) = \pu{2,5e22}
$$

#### Calcule a área total dos hexágonos $\pu{1 g}$ de grafeno.

A adsorção pode ocorrer de ambos os lados da folha de grafeno quando esse material é suspenso. A área total deve ser multiplicada por 2.
$$
    S = 2 \times (\pu{2,5e22}) \times (\pu{5e-20 m2}) 
        = \boxed{ \pu{2500 m2} }
$$

#### **(b)** Determine o número de átomos de carbono necessários para adsorver cada átomo de hidrogênio no grafite.

#### **(c)** Calcule a área em que o nitrogênio 

No experimento, o grafeno foi colocado sobre uma superfície sólida. Assim, a adsorção 
$$
    S = 2 \times (\pu{2,5e22}) \times (\pu{5e-20 m2}) 
        = \boxed{ \pu{2500 m2} }
$$