Uma mistura de metano e ar na proporção $1:15$, em $\pu{25 \degree C}$ e $\pu{1 atm}$, entra em combustão em um reservatório adiabático, consumindo completamente o metano. O processo ocorre sob pressão constante e os produtos formados permanecem em fase gasosa.

a. **Determine** a fração molar de vapor d'água no reservatório ao final da reação.
b. **Determine** a temperatura final do sistema.


| Dados em $\pu{25 \degree C}$                                                       | $\ce{CH4(l)}$ | $\ce{O2(g)}$ | $\ce{N2(g)}$ | $\ce{H2O(g)}$ | $\ce{CO2(g)}$ |
| :--------------------------------------------------------------------------------- | ------------: | -----------: | -----------: | ------------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kcal//mol}}$          |    $\pu{-18}$ |              |              |    $\pu{-58}$ |    $\pu{-94}$ |
| Entalpia padrão, $(H_{\pu{1700 K}}^\circ - H_{\pu{298 K}}^\circ)/{\pu{kcal//mol}}$ |               |  $\pu{11,5}$ |  $\pu{10,9}$ |   $\pu{13,7}$ |   $\pu{17,6}$ |
| Entalpia padrão, $(H_{\pu{2000 K}}^\circ - H_{\pu{298 K}}^\circ)/{\pu{kcal//mol}}$ |               |  $\pu{14,1}$ |  $\pu{13,4}$ |   $\pu{17,3}$ |   $\pu{21,9}$ |

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
        = (\pu{0,79}) \times (\pu{14360 mol})
        = \pu{11488 mol} \\
    n_{\ce{O2}} 
        &= x_{\ce{O2}} n_\text{ar} 
        = (\pu{0,21}) \times (\pu{14360 mol})
        = \pu{2872 mol}
\end{aligned}
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

