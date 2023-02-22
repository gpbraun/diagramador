---
elementos: Ti
---

O titânio é produzido industrialmente pela redução do óxido de titânio com carbono. Esse processo pode ser descrito por duas reações:
$$
\begin{aligned}
    \ce{ TiO2(s) + 2 C(s) &-> Ti(s) + 2 CO(g) } \\
    \ce{ TiO2(s) + C(s) &-> Ti(s) + CO2(g) }
\end{aligned}
$$
Suponha que $\Delta H_\mathrm{r}^\circ$ e $\Delta S_\mathrm{r}^\circ$ são independentes da temperatura.

a. **Determine** a entalpia padrão das reações de redução do óxido de titânio em $\pu{1000 K}$.
b. **Determine** a entropia padrão das reações de redução do óxido de titânio em $\pu{1000 K}$.
c. **Determine** a temperatura mínima na qual o óxido de titânio pode ser reduzido pelo carbono.

| Dados em $\pu{1000 K}$                                                  | $\ce{Ti(s)}$ | $\ce{C(s)}$ | $\ce{TiO2(s)}$ | $\ce{CO(g)}$ | $\ce{CO2(g)}$ |
| :---------------------------------------------------------------------- | -----------: | ----------: | -------------: | -----------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |              |             |    $\pu{-940}$ |  $\pu{-137}$ |   $\pu{-394}$ |
| Entropia padrão molar, $S_\mathrm{m}^\circ/{\pu{J//K.mol}}$             |    $\pu{30}$ |    $\pu{6}$ |      $\pu{50}$ |   $\pu{198}$ |    $\pu{214}$ |


---

#### **(a)** Calcule a entalpia padrão de redução do $\ce{TiO2}$ formando $\ce{CO}$, reação 1.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_{\mathrm{r}, 1}^\circ 
        = 2 \Delta H^\circ_{\mathrm{f}, \ce{CO(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{TiO2(s)}}
$$
logo,
$$
   \Delta H_{\mathrm{r}, 1}^\circ
        = \left\{ 2 (\pu{-137}) - (\pu{-940}) \right\}\,\pu{kJ//mol}
        = \boxed{ \pu{+666 kJ.mol-1} }
$$

#### Calcule a entalpia padrão de redução do $\ce{TiO2}$ formando $\ce{CO2}$, reação 2.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_{\mathrm{r}, 2}^\circ 
        = \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{TiO2(s)}}
$$
logo,
$$
   \Delta H_{\mathrm{r}, 2}^\circ
        = \left\{ (\pu{-394}) - (\pu{-940}) \right\}\,\pu{kJ//mol}
        = \pu{+546 kJ.mol-1}
$$

#### **(b)** Calcule a entropia padrão de redução do $\ce{TiO2}$ formando $\ce{CO}$, reação 1.

De $\Delta S_\mathrm{r}^\circ = \sum_\text{produtos} n S^\circ_\mathrm{m} - \sum_\text{reagentes} n S^\circ_\mathrm{m}$,
$$
   \Delta S_{\mathrm{r}, 1}^\circ 
        = S^\circ_{\mathrm{m}, \ce{Ti(s)}}
        + 2 S^\circ_{\mathrm{m}, \ce{CO(g)}} 
        - S^\circ_{\mathrm{m}, \ce{TiO2(s)}}
        - 2 S^\circ_{\mathrm{m}, \ce{C(s)}} 
$$
logo,
$$
   \Delta S_{\mathrm{r}, 1}^\circ
        = \left\{ (\pu{30}) + 2 (\pu{198}) - (\pu{50}) - 2 (\pu{6}) \right\}\,\pu{J//K.mol}
        = \boxed{ \pu{+364 J.K-1.mol-1} }
$$

#### Calcule a entropia padrão de redução do $\ce{TiO2}$ formando $\ce{CO}$, reação 2.

De $\Delta S_\mathrm{r}^\circ = \sum_\text{produtos} n S^\circ_\mathrm{m} - \sum_\text{reagentes} n S^\circ_\mathrm{m}$,
$$
   \Delta S_{\mathrm{r}, 1}^\circ 
        = S^\circ_{\mathrm{m}, \ce{Ti(s)}}
        + S^\circ_{\mathrm{m}, \ce{CO2(g)}} 
        - S^\circ_{\mathrm{m}, \ce{TiO2(s)}}
        - S^\circ_{\mathrm{m}, \ce{C(s)}} 
$$
logo,
$$
   \Delta S_{\mathrm{r}, 1}^\circ
        = \left\{ (\pu{30}) + (\pu{214}) - (\pu{50}) - (\pu{6}) \right\}\,\pu{J//K.mol}
        = \boxed{ \pu{+188 J.K-1.mol-1} }
$$

#### **(c)** Calcule a temperatura mínima na qual a reação 1 é espontânea.

De $\Delta G = \Delta H - T \Delta S = 0$,
$$
    T_1 = \dfrac{ \Delta H_{\mathrm{r}, 1}^\circ  }{ \Delta S_{\mathrm{r}, 1} }
        = \dfrac{ \pu{+666 kJ.mol-1} }{ \pu{+364 J.K-1.mol-1} }
        = \pu{1830 K}
$$

#### Calcule a temperatura mínima na qual a reação 2 é espontânea.

De $\Delta G = \Delta H - T \Delta S = 0$,
$$
    T_2 = \dfrac{ \Delta H_{\mathrm{r}, 2}^\circ  }{ \Delta S_{\mathrm{r}, 2} }
        = \dfrac{ \pu{+546 kJ.mol-1} }{ \pu{+188 J.K-1.mol-1} }
        = \pu{2900 K}
$$


#### A temperatura mínima na qual a redução é espontânea é a menor das temperaturas $T_1$ e $T_2$.

$$
    T = \boxed{ \pu{1830 K} }
$$
