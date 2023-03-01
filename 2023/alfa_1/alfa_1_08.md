Um carro comum possui quatro cilindros, que totalizam um volume de $\pu{1,6 L}$ e um consumo de combustível de $\pu{9,5 L}$ por $\pu{100 km}$ quando viaja a $\pu{80 km.h-1}$. Cada cilindro sofre 20 ciclos de queima por segundo. O combustível é o octano, $\ce{C8H18}$, com densidade $\pu{0,75 g.cm-3}$. O combustível gaseificado e ar são introduzidos a $\pu{390 K}$ no cilindro quando seu volume é máximo, até que a pressão atinja $\pu{1 atm}$. A densidade do  Na combustão, $\pu{10}\%$ do carbono é convertido em monóxido de carbono e o restante em dióxido de carbono. Ao final do ciclo, o cilindro se expande novamente até o volume máximo, sob pressão final de $\pu{20 atm}$.

a. **Determine** a vazão de entrada de ar no motor.
b. **Determine** a composição dos produtos de combustão.
c. **Determine** a temperatura dos produtos de combustão imediatamente após o final da reação.
d. **Determine** a temperatura de saída dos gases de exaustão.

| Dados em $\pu{25 \degree C}$                                            | $\ce{C8H18(g)}$ | $\ce{O2(g)}$ | $\ce{N2(g)}$ | $\ce{H2O(g)}$ | $\ce{CO2(g)}$ | $\ce{CO(g)}$ |
| :---------------------------------------------------------------------- | --------------: | -----------: | -----------: | ------------: | ------------: | -----------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |     $\pu{-250}$ |              |              |   $\pu{-242}$ |   $\pu{-394}$ |  $\pu{-112}$ |
| Capacidade calorífica isobárica, $C_P/{\pu{J//K.mol}}$                  |                 |    $\pu{30}$ |    $\pu{30}$ |     $\pu{40}$ |     $\pu{40}$ |    $\pu{30}$ |

---

#### **(a)** Base de cálculo: $\pu{1 h} = \pu{3600 s}$. Calcule o volume de combustível líquido que entra no motor

$$
    V_{\ce{C8H18(l)}}
        = \dfrac{ \pu{9,5 L} }{ \pu{100 km} } \times \pu{80 km}
        = \pu{7,6 L}
$$

#### Converta o volume de combustível líquido em massa usando a densidade.

$$
    m_{\ce{C8H18}}
        = d_{\ce{C8H18}} V_{\ce{C8H18(l)}}
        = (\pu{750 g//L}) \times (\pu{7,6 L})
        = \pu{5700 g}
$$

#### Converta a massa de combustível líquido em quantidade usando a massa molar.

$$
    n_{\ce{C8H18}}
        = \dfrac{ m_{\ce{C8H18}} }{ M_{\ce{C8H18}} }
        = \dfrac{ \pu{5700 g} }{ \pu{114 g//mol} }
        = \pu{50 mol}
$$

#### Calcule o volume de combustível gaseificado usando a lei dos gases ideais.

$$
    V_{\ce{C8H18(g)}}
        = \dfrac{ n_{\ce{C8H18}} RT_\text{entrada} }{ P_\text{entrada} }
        = \dfrac{ (\pu{50 mol}) \times (\pu{0,082 atm.L//mol.K}) \times (\pu{390 K}) }{ \pu{1 atm} }
        = \pu{1600 L}
$$

#### Calcule o volume total de gás que entra no motor a partir do número de ciclos de queima e do volume total dos cilindros.

$$
    V_\text{total} 
        = (\pu{20} \times \pu{3600}) \times (4 \times \pu{1,6 L})
        = \pu{460800 L}
$$

#### Calcule o volume de ar que entra no motor.

$$
    V_\text{ar} 
        =  V_\text{total} - V_{\ce{C8H18(g)}}
        = \pu{460800 L} - \pu{1600 L}
        = \pu{459200 L}
$$

#### Calcule a vazão de ar que entra no motor.

$$
    v_\text{ar} 
        = \dfrac{ V_\text{ar}  }{ \Delta t }
        = \dfrac{ \pu{459200 L} }{ \pu{3600 s} }
        = \boxed{ \pu{127,5 L.s-1} }
$$

#### **(b)** Cálculo da quantidade de ar que entra no motor.

$$
    n_\text{ar} 
        = \dfrac{ P_\text{entrada} V_\text{ar} }{ RT_\text{entrada} }
        = \dfrac{ (\pu{1 atm}) \times (\pu{459200 L}) }{ (0,082 atm.L//mol.K) \times (\pu{390 K}) }
        = \boxed{ \pu{14360 mol} }
$$


