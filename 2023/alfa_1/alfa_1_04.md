---
elementos: Zn, S, Si
---

A ustulação da blenda de zinco é conduzida em $\pu{1350 K}$ em um reator do tipo leito fluidizado. Sulfeto de zinco, $\ce{ZnS}$, e quantidade estequiométrica de ar são adicionados em fluxo contínuo a $\pu{77 \degree C}$. Nessa temperatura, a reação libera $\pu{460 kJ}$ de calor por mol de sulfeto reduzido, formando óxido de zinco e dióxido de enxofre.

a. **Verifique** se a reação é autossustentável em $\pu{1350 K}$.
b. **Determine** maior a fração mássica possível da impureza sílica, $\ce{SiO2}$, na blenda para que a reação seja autossustentável em $\pu{1350 K}$.

| Dados em $\pu{1350 K}$                                 | $\ce{SiO(s)}$ | $\ce{ZnS(s)}$ | $\ce{O2(g)}$ | $\ce{N2(g)}$ |
| :----------------------------------------------------- | ------------: | ------------: | -----------: | -----------: |
| Capacidade calorífica isobárica, $C_P/{\pu{J//K.mol}}$ |     $\pu{80}$ |     $\pu{60}$ |    $\pu{40}$ |    $\pu{30}$ |

---

#### **(a)** Escreva a reação balanceada para a ustulação da blenda de zinco.

$$
    \ce{ ZnS(s) + 3/2 O2(g) -> ZnO(s) + SO2(g) }
$$

#### Base de cálculo: $\pu{1 mol}$ de $\ce{ZnS}$. Calcule o calor liberado pela reação.

$$
    Q_{\text{liberado}} = (\pu{460 kJ//mol}) \times (\pu{1 mol}) = \pu{460 kJ}
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{ZnS}$ na quantidade de $\ce{O2}$ necessária para a reação.

$$
    n_{\ce{O2}} = \dfrac{3}{2} n_{\ce{ZnS}} = \dfrac{3}{2} \times (\pu{1 mol}) = \pu{1,5 mol}
$$

#### Use a composição molar do ar para calcular a quantidade de $\ce{N2}$.

$$
    n_{\ce{N2}} = 4 n_{\ce{O2}} = 4 \times (\pu{1,5 mol}) = \pu{6 mol}
$$

#### Calcule a capacidade calorífica dos reagentes.

De $C_P = \sum n C_{P,m}$,
$$
    C_{P, \text{reagentes}}
        = n_{\ce{ZnS}} C_{P,\mathrm{m},\ce{ZnS}}
        + n_{\ce{O2}} C_{P,\mathrm{m},\ce{O2}}
        + n_{\ce{N2}} C_{P,\mathrm{m},\ce{N2}}
$$
logo,
$$
    C_{P, \text{reagentes}}
        = \Big\{ (\pu{1} \times \pu{60}) + (\pu{1,5} \times \pu{40}) + (\pu{6} \times \pu{40}) \Big\}\,\pu{J//K}
        = \pu{300 J.K-1}
$$

#### Calcule o calor necessário para aquecer os reagentes da temperatura inicial, $\pu{350 K}$, até a temperatura de reação, $\ce{1350 K}$.

$$
    Q = C_{P, \text{reagentes}} \Delta T 
        = (\pu{300 J//K}) \times (\pu{1350 K} - \pu{350 K}) 
        = \pu{300 kJ}
$$
Como o calor necessário para aquecer os reagentes é menor do que o calor liberado pela reação, o processo é autossustentável em $\pu{1350 K}$.

#### **(b)** Quando o $\ce{ZnS}$ está contaminado com $\ce{SiO2}$, esse também precisará ser aquecido até a temperatura de reação. Para que o processo seja autossustentável, o calor total necessário para aquecer os reagentes e a impureza deve ser menor que o calor liberado pela reação.

$$
    Q^\prime = C_{P, \text{reagentes}} \Delta T + n_{\ce{SiO2}} C_{P,\mathrm{m},\ce{SiO2}} \Delta T \leq Q_{\text{liberado}}
$$
logo,
$$
    n_{\ce{SiO2}}
        \leq \dfrac{ Q_{\text{liberado}} - C_{P, \text{reagentes}} \Delta T }{ C_{P,\mathrm{m},\ce{SiO2}} }
        = \dfrac{ \pu{460 kJ} - \pu{300 kJ} }{ \pu{80 kJ//mol} }
        = \pu{2 mol}
$$
A quantidade máxima de $\ce{SiO2}$ é $n_{\ce{SiO2}} = \pu{2 mol}$.

#### Converta a massa de $\ce{ZnS}$ e de $\ce{SiO2}$ em quantidade usando as massas molares.

$$
\begin{aligned}
    m_{\ce{ZnS}}  &= n_{\ce{ZnS}} \times M_{\ce{ZnS}} = (\pu{1 mol}) \times (\pu{97,5 g//mol}) = \pu{97,5 g} \\
    m_{\ce{SiO2}} &= n_{\ce{SiO2}} \times M_{\ce{SiO2}} = (\pu{2 mol}) \times (\pu{60 g//mol}) = \pu{120 g}
\end{aligned}
$$

#### Calcule a fração mássica de $\ce{SiO2}$.

$$
    f_{\ce{SiO2}} 
        = \dfrac{ m_{\ce{SiO2}} }{ m_{\ce{ZnS}} + m_{\ce{SiO2}} }
        = \dfrac{ \pu{120 g} }{ \pu{97,5 g} + \pu{120 g} }
        = \boxed{ \pu{55}\% }
$$