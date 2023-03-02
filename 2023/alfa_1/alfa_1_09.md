Uma amostra de $\pu{18 g}$ de água líquida super-resfriada em $\pu{-20 \degree C}$ sob $\pu{1 atm}$ é abruptamente convertida em gelo mantendo a temperatura constante.

a. **Determine** a variação de entropia do sistema.
b. **Determine** a variação de entropia da vizinhança.
c. **Determine** a variação de entropia do universo.

| Dados em $\pu{0 \degree C}$                                             | $\ce{H2O(l)}$ | $\ce{H2O(s)}$ |
| :---------------------------------------------------------------------- | ------------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |   $\pu{-286}$ |   $\pu{-292}$ |
| Capacidade calorífica isobárica, $C_P/{\pu{J//K.mol}}$                  |     $\pu{75}$ |     $\pu{38}$ |

---

#### **(a)** Converta a massa de água em quantidade usando a massa molar.

$$
    n = \dfrac{m}{M} = \dfrac{ \pu{18 g} }{ \pu{18 g//mol} } = \pu{1 mol}
$$

#### Calcule a variação de entropia do aquecimento da água líquida de $\pu{-20 \degree C}$, $T$, a $\pu{0 \degree C}$, $T_0$ (I).

$$
    \Delta S_\mathrm{I}
        = n C_{P, \mathrm{m}, \ce{H2O(l)}} \ln\left( \dfrac{ T_0 }{ T } \right)
        = (\pu{1 mol}) \times (\pu{75 J//K.mol}) \times \ln\left( \dfrac{ \pu{273 K} }{ \pu{253 K} } \right)
        = \pu{+5,71 J.K-1}
$$

#### Calcule a entalpia padrão de congelamento da água em $\pu{0 \degree C}$. 

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_{\mathrm{cong}, \pu{0 \degree C}}^\circ 
        = \Delta H^\circ_{\mathrm{f}, \ce{H2O(s)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{H2O(l)}} 
$$
logo,
$$
   \Delta H_{\mathrm{cong}, \pu{0 \degree C}}^\circ
        = \Big\{ (\pu{-292}) - (\pu{-286}) \Big\}\,\pu{kJ//mol}
        = \pu{-6000 J.mol-1}
$$

#### Calcule a variação de entalpia de congelamento da água em $\pu{0 \degree C}$ (II).

$$
    \Delta H_\mathrm{II} = (\pu{1 mol}) \times (\pu{-6000 J//mol}) = \pu{-6000 J}
$$

#### Calcule a variação de entropia de congelamento da água em $\pu{0 \degree C}$ (II).

Nessa temperatura o processo é reversível, logo,
$$
    \Delta S_\mathrm{II}
        = \dfrac{ \Delta H_\mathrm{II} }{ T_0 }
        = \dfrac{ (\pu{-6000 J}) }{ \pu{273 K} }
        = \pu{-22,0 J.K-1}
$$
A variação de entropia desse processo é negativa, como esperado.

#### Calcule a variação de entropia do resfriamento da água sólida de $\pu{0 \degree C}$ a $\pu{-20 \degree C}$ (III).

$$
    \Delta S_\mathrm{III}
        = n C_{P, \mathrm{m}, \ce{H2O(s)}} \ln\left( \dfrac{ T }{ T_0 } \right)
        = (\pu{1 mol}) \times (\pu{38 J//K.mol}) \times \ln\left( \dfrac{ \pu{253 K} }{ \pu{273 K} } \right)
        = \pu{-2,89 J.K-1}
$$

#### Calcule a variação de total entropia do sistema.

$$
    \Delta S 
        = \Delta S_\mathrm{I} + \Delta S_\mathrm{II} + \Delta S_\mathrm{III}
        = \Big\{ (\pu{+5,71}) + (\pu{-22,0}) + (\pu{-2,89}) \Big\}\,\pu{J//K}
        = \boxed{ \pu{-19,2 J.K-1} }
$$

#### **(b)** Para calcular a variação de entropia da vizinhança é necessário calcular a variação de entalpia do processo. Calcule a variação de entalpia do aquecimento da água líquida de $\pu{-20 \degree C}$ a $\pu{0 \degree C}$ (I).

$$
    \Delta H_\mathrm{I}
        = n C_{P, \mathrm{m}, \ce{H2O(l)}} (T_0 - T)
        = (\pu{1 mol}) \times (\pu{75 J//K.mol}) \times (\pu{273 K} - \pu{253 K})
        = \pu{+1500 J}
$$

#### Calcule a variação de entropia do resfriamento da água sólida de $\pu{0 \degree C}$ a $\pu{-20 \degree C}$ (III).

$$
    \Delta H_\mathrm{III}
        = n C_{P, \mathrm{m}, \ce{H2O(s)}} (T - T_0)
        = (\pu{1 mol}) \times (\pu{38 J//K.mol}) \times (\pu{253 K} - \pu{273 K})
        = \pu{-760 J}
$$

#### Calcule a variação de total entalpia

$$
    \Delta H 
        = \Delta H_\mathrm{I} + \Delta H_\mathrm{II} + \Delta H_\mathrm{III}
        = \Big\{ (+1500) + (-6000) + (-760) \Big\}\,\pu{J}
        = \pu{−5260 J}
$$

#### Calcule a variação de entropia da vizinhança.

$$
    \Delta S_\mathrm{viz} 
        = -\dfrac{\Delta H}{T} 
        = -\dfrac{ (\pu{−5260 J}) }{ \pu{253 K} }
        = \boxed{ \pu{+20,8 J.K-1} }
$$

#### **(c)** Calcule a variação de entropia do universo.

$$
    \Delta S_\mathrm{uni}
        = \Delta S + \Delta S_\mathrm{viz}
        = \pu{-19,2 J.K-1} + \pu{+20,8 J.K-1}
        = \boxed{  \pu{+1,6 J.K-1} }
$$
A variação de entropia do universo é positiva, como esperado, já que o congelamento da água é espontâneo em $\pu{-20 \degree C}$.
