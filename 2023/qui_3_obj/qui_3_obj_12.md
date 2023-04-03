---
elementos: Al, Br
---


As três primeiras energias de ionização do átomo de alumínio são $\pu{6,0 eV}$, $\pu{19 eV}$ e $\pu{28 eV}$ e a afinidade eletrônica do átomo de bromo é $\pu{3,4 eV}$.

| Dados em $\pu{298 K}$                                                   | $\ce{Al(g)}$ | $\ce{Br(g)}$ | $\ce{AlBr3(s)}$ |
| :---------------------------------------------------------------------- | -----------: | -----------: | --------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |  $\pu{+326}$ |  $\pu{+112}$ |     $\pu{-530}$ |

**Assinale** a alternativa que mais se aproxima da entalpia de rede do brometo de alumínio em $\pu{298 K}$.

- [ ] $\pu{1,2 MJ.mol-1}$
- [ ] $\pu{2,7 MJ.mol-1}$
- [ ] $\pu{4,1 MJ.mol-1}$
- [x] $\pu{5,3 MJ.mol-1}$
- [ ] $\pu{8,4 MJ.mol-1}$

---

#### Calcule a energia de ionização do $\ce{Al}$ a $\ce{Al^{3+}}$.

$$
    I = I_1 + I_2 + I_3 = (\pu{6,0 eV}) + (\pu{19 eV}) + (\pu{28 eV}) = \pu{53 eV}
$$

#### Converta os dados de elétrons-volt pra $\pu{kJ.mol-1}$.

$$
    \pu{1 eV} = (\pu{1,6e-19 J}) \times (\pu{6e21 mol-1}) = \pu{96,5 kJ.mol-1}
$$
logo,
$$
\begin{aligned}
    \ce{ Al(g) &-> Al^{3+}(g) + 3 e^-(g) }
        && \Delta H^\circ_{I, \ce{Al}} = (\pu{+53}) \times (\pu{96,5 kJ//mol}) = \pu{+5114 kJ//mol} \\
    \ce{ Br(g) + e^-(g) &-> Br^-(g) }
        && \Delta H^\circ_{AE, \ce{Br}} = (\pu{-3,4}) \times (\pu{96,5 kJ//mol}) = \pu{-328 kJ//mol}
\end{aligned}
$$

#### Escreva a reação desejada como uma combinação das reações fornecidas.

$$
\begin{aligned}
    \ce{ \cancel{\ce{Al(s)}} &-> \cancel{\ce{Al(g)}} } 
        && \Delta H^\circ_{\mathrm{f}, \ce{Al(g)}} \\
    \ce{ \cancel{\ce{Al(g)}} &-> Al^{3+}(g) + \cancel{\ce{3 e^-(g)}} }
        && \Delta H^\circ_{I, \ce{Al}} \\
    \ce{ \cancel{\ce{3/2 Br2(l)}} &-> \cancel{\ce{3 Br(g)}} } 
        && 3 \Delta H^\circ_{\mathrm{f}, \ce{Br(g)}} \\
    \ce{ \cancel{\ce{3 Br(g)}} + \cancel{\ce{3 e^-(g)}} &-> 3 Br^-(g) }
        && 3 \Delta H^\circ_{AE, \ce{Br}} \\
    \ce{ AlBr3(s) &-> \cancel{\ce{Al(s)}} + \cancel{\ce{3/2 Br2(l)}} } 
            && -\Delta H^\circ_{\mathrm{f}, \ce{AlBr3(s)}} \\[1ex]
    \hline
    \\[-2ex]
    \ce{ AlBr3(s) &-> Al^{3+}(g) + Br^-(g) }
        && \Delta H_\text{rede}^\circ
\end{aligned}
$$

A entalpia da reação desejada é dada por:
$$
    \Delta H_\text{rede}^\circ 
        = \Delta H^\circ_{\mathrm{f}, \ce{Al(g)}}
            + \Delta H^\circ_{I, \ce{Al}}
            + 3 \Delta H^\circ_{\mathrm{f}, \ce{Br(g)}}
            + 3 \Delta H^\circ_{AE, \ce{Br}}
            -\Delta H^\circ_{\mathrm{f}, \ce{AlBr3(s)}} 
$$
logo,
$$
    \Delta H_\mathrm{r}^\circ 
        = \Big\{ (\pu{+326}) + (\pu{+5114}) + 3(\pu{+112}) + 3(\pu{-328}) - (\pu{-530})\Big\} \pu{kJ//mol}
        = \boxed{ \pu{5322 kJ.mol-1} }
$$

