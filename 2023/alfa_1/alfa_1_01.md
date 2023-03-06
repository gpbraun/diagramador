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

---

#### **(a)** O calor liberado pela reação pode ser calculado como a área sob a curva. Calcule a área sob a curva até 11 minutos de reação (I).

$$
    \Delta H_\text{I}
        = -\dfrac{1}{2} (\pu{6 min}) \times (\pu{2,5 J//min}) 
        = \boxed{ \pu{-7,5 J} }
$$

#### **(b)** Calcule a entalpia de reação.

$$
    \Delta H_\mathrm{r} 
        = \dfrac{ \Delta H_\text{I} }{ n_\text{I} }
        = \dfrac{ \pu{-7,5 J} }{ \pu{1 mol} }
        = \pu{7,5 kJ.mol-1}
$$

#### Calcule a área sob a curva até 4 minutos de reação (II).

$$
    \Delta H_\text{II}
        = -\dfrac{1}{2} (\pu{1 min}) \times (\pu{1 J//min}) 
        = \boxed{ \pu{-0,5 J} }
$$

#### Calcule a quantidade de produto formada até 4 minutos de reação (II).

$$
    n_\text{II} 
        = \dfrac{ \Delta H_\text{II} }{ \Delta H_\mathrm{r}  }
        = \dfrac{ (\pu{-0,5 J}) }{ (\pu{7,5 kJ.mol-1}) }
        = \boxed{ \pu{67 mmol} }
$$

