O ácido benzoico, $\ce{C6H5COOH}$, é muito usado para calibrar calorímetros. O calor liberado na combustão em volume constante dessa substância é $\pu{3,2 MJ.mol-1}$. Quando uma pastilha de $\pu{2,44 g}$ de ácido benzoico é queimada em um calorímetro fechado com $\pu{100 mL}$ de volume útil, a temperatura aumentou $\pu{4 \degree C}$. 

O mesmo calorímetro foi usado para determinar a entalpia de combustão do explosivo RDX, $\ce{C3H6N6O6}$. Quando uma amostra de $\pu{7,4 g}$ de RDX foi queimada nesse calorímetro em $\pu{25 \degree C}$ a temperatura aumentou $\pu{4,4 \degree C}$.

a. **Apresente** a reação balanceada de combustão do RDX.
b. **Determine** a entalpia de combustão do RDX.

---

#### **(a)** Na reação de combustão, o carbono é convertido em $\ce{CO2}$, o hidrogênio é convertido em $\ce{H2O}$ e o nitrogênio é convertido em $\ce{N2}$.

$$
    \ce{ C3H6N6O6(s) + 3/2 O2(g) -> 3 CO2(g) + 3 H2O(l) + 3 N2(g) }
$$

#### **(b)** Converta a massa de ácido benzoico, $\ce{AB}$, em quantidade usando a massa molar.

$$
    n_{\ce{AB}} 
        = \dfrac{ m_{\ce{AB}}  }{ M_{\ce{AB}} }
        = \dfrac{ \pu{2,44 g} }{ \pu{122 g//mol} } = \pu{0,02 mol}
$$

#### Cálculo do calor liberado pela pastilha de ácido benzoico.

Em volume constante,
$$
    Q_V = \Delta U
$$
logo,
$$
    Q_{V, 1} 
        = \Delta U_1 
        = n_{\ce{AB}}  \Delta U_{\mathrm{c}, \ce{AB}}
        = (\pu{0,02 mol}) \times (\pu{-3,2 MJ//mol}) 
        = \pu{-64 kJ}
$$

#### Calibração. Calcule a capacidade calorífica do calorímetro a partir dos dados do primeiro experimento.

$$
    C_\mathrm{cal} 
        = \dfrac{ Q_{\mathrm{cal}, 1} }{ \Delta T_1 }
        = \dfrac{ -Q_{V, 1} }{ \Delta T_1 }
        = \dfrac{ \pu{64 kJ} }{ \pu{4 K} } 
        = \pu{16 kJ.K-1}
$$

#### Converta a massa de RDX em quantidade usando a massa molar.

$$
    n_{\ce{RDX}} 
        = \dfrac{ m_{\ce{RDX}}  }{ M_{\ce{RDX}} }
        = \dfrac{ \pu{7,4 g} }{ \pu{222 g//mol} } = \pu{0,033 mol}
$$

#### Calcule o calor liberado na combustão do RDX a partir dos dados do segundo experimento.

$$
    Q_{\mathrm{cal}, 2}
        = C_\mathrm{cal} \Delta T_2
        = (\pu{16 kJ//K}) \times (\pu{4,4 K}) = \pu{ \pu{70,4 kJ} }
$$
Como a combustão ocorreu em volume constante, 
$$
    \Delta U = Q_V = -Q_\mathrm{cal} = \pu{-70,4 kJ}
$$

#### Calcule a energia interna molar de combustão do RDX.

$$
    \Delta U_{\mathrm{c}, \ce{RDX}}
        =  \dfrac{\Delta U}{n_{\ce{RDX}}}
        = \dfrac{ (\pu{-70,4 kJ}) }{ \pu{0,033 mol} } 
        = \pu{-2112 kJ.mol-1}
$$

#### Calcule a entalpia molar de combustão do RDX.

$$
    \Delta H_{\mathrm{c}, \ce{RDX}}
        = \Delta U_{\mathrm{c}, \ce{RDX}} + \Delta n_\text{gás} RT 
        = (\pu{-2112 kJ//mol}) + \left(3 + 3 - \tfrac{3}{2}\right) \times (\pu{8,3e-3 kJ//K.mol}) \times (\pu{298 K})
        = \boxed{ \pu{-2100 kJ.mol-1} }
$$

