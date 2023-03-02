Uma amostra de $\pu{71 g}$ de cloro, inicialmente a $\pu{300 K}$ e $\pu{100 atm}$ se expande contra uma pressão externa constante de $\pu{1 atm}$ até o estado de equilíbrio. Como resultado da expansão, $\pu{10}\%$ da massa de gás é condensada.

A temperatura de ebulição do cloro líquido é $\pu{-35 \degree C}$ e sua densidade é $\pu{1,6 g.cm-3}$.

a. **Determine** a variação de energia interna do sistema.
b. **Determine** a variação de entropia do sistema.

| Dados em $\pu{-35 \degree C}$                                           | $\ce{Cl2(l)}$ | $\ce{Cl2(g)}$ |
| :---------------------------------------------------------------------- | ------------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |    $\pu{-20}$ |               |
| Capacidade calorífica isovolumétrica, $C_V/{\pu{J//K.mol}}$             |               |     $\pu{30}$ |

---

#### **(a)** Converta a massa de cloro em quantidade usando a massa molar.

$$
    n = \dfrac{m}{M} = \dfrac{ \pu{71 g} }{ \pu{71 g//mol} } = \pu{1 mol}
$$

#### Calcule a variação de energia interna do resfriamento do cloro gasoso de $\pu{300 K}$ a $\pu{238 K}$ acompanhado da redução da pressão de $\pu{100 atm}$ a $\pu{1 atm}$ (I).

A energia interna do gás é função apenas da temperatura, logo,
$$
    \Delta U_\text{I}
        = n C_{V, \mathrm{m}} \Delta T
        = (\pu{1 mol}) \times (\pu{30 J//K.mol}) \times (\pu{238 K} - \pu{300 K})
        = \pu{-1860 J}
$$

#### Calcule a entalpia padrão de condensação do cloro.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{cond}^\circ 
        = \Delta H^\circ_{\mathrm{f}, \ce{H2O(l)}} 
        = \pu{-20 kJ.mol-1}
$$

#### Calcule a energia interna padrão de condensação do cloro.

De $\Delta H_\mathrm{r} = \Delta U_\mathrm{r} + RT\Delta n_\text{gás}$,
$$
    \Delta U
        = \pu{-20 kJ.mol-1} - (\pu{8,3e-3 kJ//K.mol}) \times (\pu{238 K}) \times (-1)
        = \pu{-18 kJ.mol-1}
$$

#### Calcule a variação de energia interna da condensação de $\pu{10}\%$ da massa de gás em $\pu{238 K}$ (II).

$$
    \Delta U_\text{II}
        = n \Delta U_\mathrm{cond}^\circ  
        =  (\pu{0,1} \times \pu{1 mol}) \times (\pu{-18 kJ.mol-1})
        = \pu{-1800 J}
$$

#### Calcule a variação total de energia interna do sistema.

$$
    \Delta U
        = \Delta U_\text{I} + \Delta U_\text{II}
        = (\pu{-1860 J}) + (\pu{-1800 J})
        = \boxed{ \pu{-3660 J} }
$$

#### **(b)** Calcule a capacidade calorífica molar isobárica do cloro gasoso.

$$
    C_{P, \mathrm{m}} 
        = C_{V, \mathrm{m}} + R
        = \pu{30 J//K.mol} + \pu{8,3 J//K.mol}
        = \pu{38,3 J//K.mol}
$$

#### **(b)** Calcule a variação de entropia do resfriamento do cloro gasoso de $\pu{300 K}$ a $\pu{238 K}$ acompanhado da redução da pressão de $\pu{100 atm}$ a $\pu{1 atm}$.

$$
    \Delta S_\text{I}
        = n C_{P, \mathrm{m}} \ln\left( \dfrac{T_2}{T_1} \right) 
            + n R \ln\left( \dfrac{P_1}{P_2} \right)
        =  \Big\{ (\pu{1}) \times (\pu{8,3}) \times \ln\left( \tfrac{ \pu{238} }{ \pu{300} } \right) 
            + (\pu{1}) \times (\pu{38,3}) \times \ln\left( \tfrac{ \pu{1} }{ \pu{100} } \right) \Big\}\,\pu{J//K}
        = \pu{-178 J.K-1}
$$

#### Calcule a variação de entalpia da condensação de $\pu{10}\%$ da massa de gás em $\pu{238 K}$ (II).

$$
    \Delta H_\text{II}
        = n \Delta H_\mathrm{cond}^\circ  
        =  (\pu{0,1} \times \pu{1 mol}) \times (\pu{-20 kJ.mol-1})
        = \pu{-2000 J}
$$

#### Calcule a variação de entropia da condensação de $\pu{10}\%$ da massa de gás em $\pu{238 K}$ (II).

Nessa temperatura a condensação é reversível, logo,
$$
    \Delta S_\mathrm{II}
        = \dfrac{ \Delta H_\mathrm{II} }{ T_0 }
        = \dfrac{ (\pu{-2000 J}) }{ \pu{238 K} }
        = \pu{-8,4 J.K-1}
$$
A variação de entropia desse processo é negativa, como esperado.

#### Calcule a variação total de entropia do sistema.

$$
    \Delta S
        = \Delta S_\text{I} + \Delta S_\text{II}
        = (\pu{-178 J//K}) + (\pu{-8,4 J//K})
        = \boxed{ \pu{-186,4 J//K} }
$$