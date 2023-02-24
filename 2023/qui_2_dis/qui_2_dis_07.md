---
elementos: Ba, Ca
---

Um químico pesou $\pu{5,14 g}$ de uma amostra contendo quantidades desconhecidas de óxido de bário, $\ce{BaO}$, e óxido de cálcio, $\ce{CaO}$. A amostra pesada foi colocada em um balão de $\pu{1,5 L}$ contendo dióxido de carbono em $\pu{30 \degree C}$ e $\pu{750 Torr}$. Toda a amostra sólida reagiu formando carbonato de bário, $\ce{BaCO3}$ e carbonato de cálcio, $\ce{CaCO3}$. Ao final da reação, a pressão no balão caiu para $\pu{230 Torr}$.

**Determine** a fração mássica de óxido de cálcio na amostra original.

---

#### A massa total da mistura é a soma das massas de óxido de bário e óxido de cálcio.

$$
    m = m_{\ce{BaO}} + m_{\ce{CaO}}
        = (\pu{153,3 g//mol}) n_{\ce{BaO}} + (\pu{56 g//mol}) n_{\ce{CaO}}
        = \pu{5,14 g}
$$
logo, 
$$
    \pu{153,3} n_{\ce{BaO}} + \pu{56} n_{\ce{CaO}}
        = \pu{5,14 mol}
\tag{I}
$$

#### Escreva as equações química balanceadas para as reações.

$$
\begin{aligned}
    \ce{ BaO(s) + CO2(g) &-> BaCO3(s) } \\
    \ce{ CaO(s) + CO2(g) &-> CaCO3(s) }
\end{aligned}
$$

#### Calcule a quantidade de $\ce{CO2}$ que reagiu.

De $PV = nRT$,
$$
    n_{\ce{CO2}} 
        = \dfrac{ (\pu{750 Torr} - \pu{230 Torr}) \times (\pu{1,5 L}) }{ (\pu{62,4 Torr.L//mol.K}) \times (\pu{303 K}) }
        = \pu{0,04 mol}
$$

Todo o $\ce{CO2}$ reage com todo $\ce{BaO}$ e $\ce{CaO}$, logo,
$$
    n_{\ce{BaO}} + n_{\ce{CaO}} = \pu{0,04 mol}
\tag{II}
$$

#### Resolva o sistema de Equações I e II.

$$
\begin{cases}
    \pu{153,3} n_{\ce{BaO}} + \pu{56} n_{\ce{CaO}} = \pu{5,14 mol} \\
    n_{\ce{BaO}} + n_{\ce{CaO}} = \pu{0,04 mol}
\end{cases}
$$
resolvendo, $n_{\ce{BaO}} = \pu{0,03 mol}$ e $n_{\ce{CaO}} = \pu{0,01 mol}$

#### Calcule a fração mássica de $\ce{CaO}$.

$$
    f_{\ce{CaO}} 
        = \dfrac{ m_{\ce{CaO}} }{m}
        = \dfrac{ n_{\ce{CaO}} M_{\ce{CaO}} }{m}
        = \dfrac{ (\pu{0,01 mol}) \times (\pu{56 g//mol}) }{ \pu{5,14 g} }
        = \boxed{ \pu{11}\% }
$$
