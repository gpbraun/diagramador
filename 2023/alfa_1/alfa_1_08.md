Um carro comum possui quatro cilindros, que totalizam um volume de $\pu{1,6 L}$ e um consumo de combustível de $\pu{9,5 L}$ por $\pu{100 km}$ quando viaja a $\pu{80 km.h-1}$. Cada cilindro sofre 20 ciclos de queima por segundo. O combustível é o octano, $\ce{C8H18}$, com densidade $\pu{0,75 g.cm-3}$. O combustível gaseificado e ar são introduzidos a $\pu{390 K}$ no cilindro quando seu volume é máximo, até que a pressão atinja $\pu{1 atm}$. A densidade do  Na combustão, $\pu{10}\%$ do carbono é convertido em monóxido de carbono e o restante em dióxido de carbono. Ao final do ciclo, o cilindro se expande novamente até o volume máximo, sob pressão final de $\pu{2 atm}$.

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

#### **(b)** Calcule a quantidade de ar que entra no motor.

De $PV = nRT$,
$$
    n_\text{ar} 
        = \dfrac{ P_\text{entrada} V_\text{ar} }{ RT_\text{entrada} }
        = \dfrac{ (\pu{1 atm}) \times (\pu{459200 L}) }{ ( \pu{0,082 atm.L//mol.K} ) \times (\pu{390 K}) }
        = \boxed{ \pu{14360 mol} }
$$

#### Calcule a quantidade de nitrogênio e oxigênio que entra no motor.

$$
\begin{aligned}
    n_{\ce{N2}} 
        &= x_{\ce{N2}} n_\text{ar} 
        = (\pu{0,8}) \times (\pu{14360 mol})
        = \pu{11488 mol} \\
    n_{\ce{O2}} 
        &= x_{\ce{O2}} n_\text{ar} 
        = (\pu{0,2}) \times (\pu{14360 mol})
        = \pu{2872 mol}
\end{aligned}
$$

#### Escreva as reações balanceadas de combustão.

$$
\begin{aligned}
    \ce{ C8H18(g) + 25/2 O2(g) &-> 8 CO2(g) + 9 H2O(g) }\\
    \ce{ C8H18(g) + 17/2 O2(g) &-> 8 CO(g)  + 9 H2O(g) }
\end{aligned}
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{C8H18}$ na quantidade de $\ce{CO2}$, $\ce{CO}$ e $\ce{H2O}$ formados na reação.

$$
\begin{aligned}
    n_{\ce{CO2}} 
        &= \dfrac{8}{1} \times (\pu{0,9} \times \pu{50 mol})
        = \pu{360 mol}
    &\qquad
    n_{\ce{H2O}} 
        &= \dfrac{9}{1} \times (\pu{50 mol})
        = \pu{450 mol} \\
    n_{\ce{CO}} 
        &= \dfrac{8}{1} \times (\pu{0,1} \times \pu{50 mol})
        = \pu{40 mol}
\end{aligned}
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{C8H18}$ na quantidade de $\ce{O2}$ consumido na reação.

$$
    n_{\ce{O2}, \text{consumido} } 
        = \dfrac{25}{2} \times (\pu{0,9} \times \pu{50 mol})
            + \dfrac{17}{2} \times (\pu{0,1} \times \pu{50 mol})
        = \pu{605 mol}
$$

#### Calcule a quantidade de $\ce{O2}$ remanescente ao final da reação.

$$
    n_{\ce{O2}, \mathrm{xs}} 
        = n_{\ce{O2}} -  n_{\ce{O2}, \text{consumido} } 
        = \pu{2872 mol} - \pu{605 mol} 
        = \pu{2267 mol} 
$$

#### Calcule a quantidade total de gás que sai do motor ao final da reação.

$$
    n_\text{saída}
        = n_{\ce{O2}, \mathrm{xs}} + n_{\ce{N2}} + n_{\ce{CO2}} + n_{\ce{CO}} + n_{\ce{H2O}} 
        = \Big\{ \pu{2267} + \pu{11488} + \pu{360} + \pu{40} + \pu{450} \Big\}\,\pu{mol}
        = \pu{14605 mol}
$$

#### Calcule a composição molar do gás que sai do motor ao final da reação.

$$
\begin{aligned}
    x_{\ce{CO2}} 
        &= \dfrac{ n_{\ce{CO2}} }{ n_\text{saída} }
        = \dfrac{ \pu{360 mol} }{ \pu{14605 mol} }
        = \pu{2,47}\%
    &\qquad
    x_{\ce{O2}} 
        &= \dfrac{ n_{\ce{O2}, \mathrm{xs}} }{ n_\text{saída} }
        = \dfrac{ \pu{2267 mol} }{ \pu{14605 mol} }
        = \pu{15,52}\% \\
    x_{\ce{CO}} 
        &= \dfrac{ n_{\ce{CO}} }{ n_\text{saída} }
        = \dfrac{ \pu{40 mol} }{ \pu{14605 mol} }
        = \pu{0,27}\%
    &\qquad
    x_{\ce{N2}} 
        &= \dfrac{ n_{\ce{N2}} }{ n_\text{saída} }
        = \dfrac{ \pu{11488 mol} }{ \pu{14605 mol} }
        = \pu{78,66}\% \\
    x_{\ce{H2O}} 
        &= \dfrac{ n_{\ce{H2O}} }{ n_\text{saída} }
        = \dfrac{ \pu{450 mol} }{ \pu{14605 mol} }
        = \pu{3,08}\%
\end{aligned}
$$

#### **(c)** Calcule a entalpia padrão de combustão completa formando $\ce{CO2}$ em $\ce{25 \degree C}$.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{cc}^\circ 
        = 8 \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        + 9 \Delta H^\circ_{\mathrm{f}, \ce{H2O(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{C8H18(l)}}
$$
logo,
$$
   \Delta H_\mathrm{cc}^\circ
        = \Big\{ 8 (\pu{-394}) + 9 (\pu{-242}) - (\pu{-250}) \Big\}\,\pu{kJ//mol}
        = \pu{-6718 kJ.mol-1}
$$
A reação de combustão completa é exotérmica, como esperado.

#### Calcule a entalpia padrão de combustão incompleta formando $\ce{CO}$ em $\ce{25 \degree C}$.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{ci}^\circ 
        = 8 \Delta H^\circ_{\mathrm{f}, \ce{CO(g)}} 
        + 9 \Delta H^\circ_{\mathrm{f}, \ce{H2O(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{C8H18(l)}}
$$
logo,
$$
   \Delta H_\mathrm{ci}^\circ
        = \Big\{ 8 (\pu{-112}) + 9 (\pu{-242}) - (-250) \Big\}\,\pu{kJ//mol}
        = \pu{-2824 kJ.mol-1}
$$
A reação de combustão incompleta é exotérmica, como esperado.

#### Calcule a variação de entalpia total.

$$
    \Delta H 
        = (\pu{-6718 kJ//mol-1}) \times (\pu{0,9} \times \pu{50 mol}) 
        + (\pu{-2824 kJ//mol-1}) \times (\pu{0,1} \times \pu{50 mol}) 
        = \pu{-316430 kJ}
$$

#### Imediatamente após o final da reação não há troca de calor com a vizinhança nem expansão do pistão: todo calor liberado pela reação aquece os gases de saída (temperatura adiabática de chama). Calcule a capacidade calorífica dos gases de saída.

De $C_P = \sum n C_{P,m}$,
$$
    C_{P, \text{saída}} 
        = n_{\ce{O2}, \mathrm{xs}} C_{P,\mathrm{m},\ce{O2}}
        + n_{\ce{N2}} C_{P,\mathrm{m},\ce{N2}}
        + n_{\ce{CO2}} C_{P,\mathrm{m},\ce{CO2}}
        + n_{\ce{CO}} C_{P,\mathrm{m},\ce{CO}}
        + n_{\ce{H2O}} C_{P,\mathrm{m},\ce{H2O}}
$$
logo,
$$
    C_{P, \text{saída}}  
        = \Big\{ (\pu{2267} \times \pu{30})
        + (\pu{11488} \times \pu{30})
        + (\pu{360} \times \pu{40})
        + (\pu{40} \times \pu{30})
        + (\pu{450} \times \pu{40}) \Big\}\,\pu{J//K}
        = \pu{446,25 kJ.K-1}
$$

#### Calcule a temperatura dos gases de saída após absorverem o calor liberado pela reação.

De $Q_P = C_P \Delta T$,
$$
    \Delta T 
        = \dfrac{ (-\Delta H) }{ C_{P, \text{saída}} }
        = \dfrac{ \pu{316430 kJ} }{ \pu{446,25 kJ//mol.K} }
        = \pu{710 K}
$$
logo,
$$
    T_\text{chama} 
        = \pu{390 K} + \pu{710 K}
        = \boxed{ \pu{1100 K} }
$$

#### **(d)** Ao final do ciclo de combustão os gases se expandem de volta ao volume total sob a pressão de $\pu{20 atm}$. Use a lei dos gases para calcular a temperatura.

De $PV = nRT$,
$$
    T_\text{saída}
        = \dfrac{ P_\text{saída} V_\text{total} }{ n_\text{saída} R }
        = \dfrac{ (\pu{2 atm}) \times (\pu{460800 L}) }{ (\pu{14605 mol}) \times (\pu{0,082 atm.L//mol.K}) }
        = \boxed{ \pu{770 K} }
$$

