Considere os dados em $\pu{25 \degree C}$.

|                                                                                    |    $\ce{C3H8(g)}$    |    $\ce{H2O(l)}$     |    $\ce{CO2(g)}$     |
| :--------------------------------------------------------------------------------- | :------------------: | :------------------: | :------------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/\tfrac{\pu{kJ}}{\pu{mol}}$ | $\pu{-104 kJ.mol-1}$ | $\pu{-286 kJ.mol-1}$ | $\pu{-394 kJ.mol-1}$ |

**Assinale** a alternativa que mais se aproxima do volume de propano que deve ser queimado a $\pu{0 \degree C}$ e $\pu{1 atm}$ para fornecer $\pu{350 kJ}$ de calor.

- [ ] $\pu{3,1 L}$
- [x] $\pu{3,5 L}$
- [ ] $\pu{4,1 L}$
- [ ] $\pu{4,5 L}$
- [ ] $\pu{5,1 L}$

---

A reação de combustão do propano:
$$
    \ce{ C2H6O(l) + 3 O2(g) -> 2 CO2(g) + 3 H2O(l) }
$$
A entalpia dessa reação é dada por:
$$
    \Delta H_\mathrm{r}^\circ 
        = 2 \Delta H_{\mathrm{f}, \ce{CO2(g)}}^\circ
        + 3 \Delta H_{\mathrm{f}, \ce{H2O(g)}}^\circ
        - \Delta H_{\mathrm{f}, \ce{C3H8(g)}}^\circ
$$
logo,
$$
    \Delta H_\mathrm{r}^\circ 
        = \Big\{ 2 (\pu{-394}) + 3 (\pu{-286}) - (\pu{-104}) \Big\} \pu{kJ//mol}
        = \pu{-1542 kJ.mol-1}
$$

A quantidade de propano para fornecer $\pu{350 kJ}$ é:
$$
    n_{\ce{C3H8}} = \dfrac{ \pu{350 kJ} }{ \pu{1542 kJ//mol} } = \pu{0,23 mol}
$$
Da lei dos gases ideais, $PV = nRT$,
$$
    V_{\ce{C3H8}} = \dfrac{ n_{\ce{C3H8}} R T }{ P }
        = \dfrac{ (\pu{0,23 mol}) (\pu{0,082 atm.L//mol.K}) \times (\pu{273 K}) }{ (\pu{1 atm}) } = \boxed{ \pu{3,5 L} }
$$