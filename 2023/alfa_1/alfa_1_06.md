Uma mistura de metano e ar na proporção $1:15$, em $\pu{25 \degree C}$ e $\pu{1 atm}$, entra em combustão em um reservatório adiabático, consumindo completamente o metano. O processo ocorre sob pressão constante e os produtos formados permanecem em fase gasosa.

Considere que a capacidade calorífica é constante entre $\pu{1700 K}$ e $\pu{2000 K}$.

a. **Determine** a fração molar de vapor d'água no reservatório ao final da reação.
b. **Determine** a temperatura final do sistema.


| Dados em $\pu{25 \degree C}$                                                                   | $\ce{CH4(l)}$ | $\ce{O2(g)}$ | $\ce{N2(g)}$ | $\ce{H2O(g)}$ | $\ce{CO2(g)}$ |
| :--------------------------------------------------------------------------------------------- | ------------: | -----------: | -----------: | ------------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kcal//mol}}$                      |    $\pu{-18}$ |              |              |    $\pu{-58}$ |    $\pu{-94}$ |
| Variação de entalpia padrão, $(H_{\pu{1700 K}}^\circ - H_{\pu{298 K}}^\circ)/{\pu{kcal//mol}}$ |               |  $\pu{11,5}$ |  $\pu{10,9}$ |   $\pu{13,7}$ |   $\pu{17,6}$ |
| Variação de entalpia padrão, $(H_{\pu{2000 K}}^\circ - H_{\pu{298 K}}^\circ)/{\pu{kcal//mol}}$ |               |  $\pu{14,1}$ |  $\pu{13,4}$ |   $\pu{17,3}$ |   $\pu{21,9}$ |

---

#### **(a)** Escreva a reação balanceada de combustão do metano formando água gasosa.

$$
    \ce{ CH4(g) + 2 O2(g) -> CO2(g) + 2 H2O(g) }
$$

#### Base de cálculo: $\pu{1 mol}$ de $\ce{CH4}$. Calcule a quantidade de ar na mistura inicial.

$$
    n_\text{ar}
        = 15 n_{\ce{CH4}}
        = 15 \times (\pu{1 mol})
        = \pu{15 mol}
$$

#### Calcule a quantidade de nitrogênio e oxigênio na mistura inicial.

$$
\begin{aligned}
    n_{\ce{N2}} 
        &= x_{\ce{N2}} n_\text{ar} 
        = (\pu{0,79}) \times (\pu{15 mol})
        = \pu{12 mol} \\
    n_{\ce{O2}} 
        &= x_{\ce{O2}} n_\text{ar} 
        = (\pu{0,21}) \times (\pu{15 mol})
        = \pu{3 mol}
\end{aligned}
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{CH4}$ na quantidade de $\ce{CO2}$ e $\ce{H2O}$ formados na reação.

$$
\begin{aligned}
    n_{\ce{CO2}} 
        &= \dfrac{1}{1} \times (\pu{1 mol})
        = \pu{1 mol}
    &\qquad
    n_{\ce{H2O}} 
        &= \dfrac{2}{1} \times (\pu{1 mol})
        = \pu{2 mol} \\
\end{aligned}
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{C8H18}$ na quantidade de $\ce{O2}$ consumido na reação.

$$
    n_{\ce{O2}, \text{consumido} } 
        = \dfrac{2}{1} \times (\pu{1 mol})
        = \pu{2 mol}
$$

#### Calcule a quantidade de $\ce{O2}$ remanescente ao final da reação.

$$
    n_{\ce{O2}, \mathrm{xs}} 
        = n_{\ce{O2}} -  n_{\ce{O2}, \text{consumido} } 
        = \pu{3 mol} - \pu{2 mol} 
        = \pu{1 mol} 
$$

#### Calcule a quantidade total de gás ao final da reação.

$$
    n_\text{produtos} 
        = n_{\ce{O2}, \mathrm{xs}} + n_{\ce{N2}} + n_{\ce{CO2}} + n_{\ce{H2O}}
        = \Big\{ 1 + 12 + 1 + 2 \Big\}\,\pu{mol}
        = \pu{16 mol}
$$

#### Calcule a a fração molar de vapor d'água ao final da reação.

$$
    x_{\ce{H2O}}
        = \dfrac{ n_{\ce{N2O}} }{ n_\text{produtos} }
        = \dfrac{ \pu{2 mol} }{ \pu{16 mol} }
        = \boxed{ \pu{0,125} }
$$

#### **(b)** Calcule a entalpia padrão de combustão em $\ce{25 \degree C}$.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{c}^\circ 
        = 8 \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        + 9 \Delta H^\circ_{\mathrm{f}, \ce{H2O(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{C8H18(l)}}
$$
logo,
$$
   \Delta H_\mathrm{c}^\circ
        = \Big\{ (\pu{-94}) + 2 (\pu{-58}) - (\pu{-18}) \Big\}\,\pu{kcal//mol}
        = \pu{-192 kcal.mol-1}
$$
A reação de combustão completa é exotérmica, como esperado.

#### Calcule a variação de entalpia da combustão de $\pu{1 mol}$ de $\ce{CH4}$ (I).

$$
    \Delta H_\mathrm{I} 
        = (\pu{1 mol}) \times (\pu{-192 kcal.mol-1})
        = \pu{192 kcal}
$$

#### Calcule a variação de entalpia para aquecer os produtos da reação até $T_2 = \pu{1700 K}$ (II).

$$
    \Delta H_\mathrm{II} 
        = \Big\{ (\pu{1} \times \pu{11,5}) + (\pu{12} \times \pu{10,9}) + (\pu{2} \times \pu{13,7}) + (\pu{1} \times \pu{17,6}) \Big\}\,\pu{kcal}
        = \pu{187 kcal}
$$

#### Calcule a variação de entalpia para aquecer os produtos da reação até $T_3 = \pu{1800 K}$ (III).

$$
    \Delta H_\mathrm{III} 
        = \Big\{ (\pu{1} \times \pu{14,1}) + (\pu{12} \times \pu{13,4}) + (\pu{2} \times \pu{17,3}) + (\pu{1} \times \pu{21,9}) \Big\}\,\pu{kcal}
        = \pu{231 kcal}
$$

#### Calcule a capacidade calorífica entre $\pu{1700 K}$ e $\pu{2000 K}$.

$$
    C_{P, \mathrm{produtos}} = \dfrac{ \Delta H }{ \Delta T }
        = \dfrac{ \Delta H_\mathrm{III} - \Delta H_\mathrm{II} }{ T_3 - T_2 }
        = \dfrac{ \pu{231 kcal} - \pu{187 kcal} }{ \pu{2000 K} - \pu{1700 K} }
        = \pu{147 cal//K}
$$

#### O calor liberado pela reação é aquece os produtos até a temperatura final. Calcule a variação de entalpia para aquecer os produtos de $\pu{1700 K}$ até a temperatura final (IV).

$$
    \Delta H_\mathrm{IV} 
        = \Delta H_\mathrm{I} - \Delta H_\mathrm{II}
        = \pu{192 kcal} - \pu{187 kcal}
        = \pu{5 kcal}
$$

#### Calcule a temperatura dos produtos a partir da capacidade calorífica e da variação de entalpia para aquecer os produtos de $\pu{1700 K}$ até a temperatura final.

De $Q_P = C_P \Delta T$,
$$
    \Delta T 
        = \dfrac{ (-\Delta H_\mathrm{IV}) }{ C_{P, \mathrm{produtos}} } 
        = \dfrac{ \pu{5000 cal} }{ \pu{147 cal//K} }
        = \pu{34 K}
$$
logo,
$$
    T_\text{final} = \pu{1700 K} + \pu{34 K} = \boxed{ \pu{1734 K} }
$$
