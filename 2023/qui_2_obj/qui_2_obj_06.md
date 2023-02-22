O trinitrotolueno, TNT, é um explosivo. Em princípio ele poderia ser usado como combustível de foguetes, com os gases formados na decomposição saindo para dar o impulso necessário. Na prática, é claro, ele seria *extremamente* perigoso como combustível, porque é sensível ao choque.

```latex
\chemnameinit{}
\chemname{
\chemfig{*6(-(-NO_2)=-(-NO_2)=(-CH_3)-(-O_2N)=-)}
}{TNT}
```

A densidade do TNT é $\pu{1,65 g.cm-3}$.

| Dados em $\pu{25 \degree C}$                                            | $\ce{H2O(l)}$ | $\ce{CO2(g)}$ | $\ce{TNT(s)}$ |
| :---------------------------------------------------------------------- | :-----------: | :-----------: | :-----------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |  $\pu{-286}$  |  $\pu{-394}$  |  $\pu{-67}$   |

**Assinale** a alternativa que mais se aproxima da densidade de entalpia (entalpia liberada por litro de combustível na reação de combustão) do TNT.

- [ ] $\pu{12 MJ.L-1}$
- [x] $\pu{24 MJ.L-1}$
- [ ] $\pu{36 MJ.L-1}$
- [ ] $\pu{48 MJ.L-1}$
- [ ] $\pu{60 MJ.L-1}$

---

#### Na reação de combustão, o carbono é convertido em $\ce{CO2}$, o hidrogênio é convertido em $\ce{H2O}$ e o nitrogênio é convertido em $\ce{N2}$.

$$
    \ce{ C7H5N3O6(s) + 21/4 O2(g) -> 7 CO2(g) + 5/2 H2O(l) + 3/2 N2(g) }
$$

#### Calcule a entalpia molar de combustão do TNT.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{c}^\circ 
        = 7 \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        + \dfrac{5}{2} \Delta H^\circ_{\mathrm{f}, \ce{H2O(l)}}
        - \Delta H^\circ_{\mathrm{f}, \ce{TNT(s)}}
$$
logo,
$$
   \Delta H_\mathrm{c}^\circ
        = \left\{ 7 (\pu{-394}) + \dfrac{5}{2} (\pu{-286}) - (\pu{-67}) \right\}\,\pu{kJ//mol}
        = \pu{-3400 kJ.mol-1}
$$

#### Calcule o volume molar de TNT usando a massa molar e a densidade.

$$
    V_{\ce{TNT}} 
        = \dfrac{ \pu{227 g//mol} }{ \pu{1650 g//L} } 
        = \pu{0,14 L.mol-1}
$$

#### Calcule a densidade de entalpia do TNT.

$$
    h_{\ce{TNT}}
        = \dfrac{ \pu{3,4 MJ//mol} }{ \pu{0,14 L//mol} } 
        = \boxed{ \pu{24 MJ.L-1} }
$$
