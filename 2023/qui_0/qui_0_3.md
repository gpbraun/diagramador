Uma planta produz etanol pela hidratação do eteno em altas temperaturas.
$$
    \ce{ C2H4(g) + H2O(g) <=> C2H5OH(g) }
        \quad 
        K_{\pu{300 \degree C}} = \pu{26}
$$
Um reator é carregado com $\pu{60 bar}$ de eteno e $\pu{40 bar}$ de água em $\pu{300 \degree C}$. A mistura atinge o equilíbrio no reator. A mistura no equilíbrio é resfriada a $\pu{25 \degree C}$ e transferida para um tambor, permitindo que todo o excesso de eteno escape.

a. (Valor: $\pu{0,5}$) **Determine** a entalpia de síntese do etanol.
b. (Valor: $\pu{0,5}$) **Determine** a composição do equilíbrio no reator a $\pu{300 \degree C}$.
c. (Valor: $\pu{0,2}$) **Explique** qual seria o efeito da adição de etanol à composição do equilíbrio a $\pu{300 \degree C}$.
d. (Valor: $\pu{0,3}$) **Compare** a constante de equilíbrio de síntese do etanol a $\pu{300 \degree C}$ e a $\pu{25 \degree C}$.
e. (Valor: $\pu{0,5}$) **Determine** a pressão de vapor no tambor a $\pu{25 \degree C}$.

**Dados**

- Entalpia de formação do eteno, $\Delta H_\mathrm{f}^\circ(\ce{C2H4}) = \pu{53 kJ.mol-1}$
- Entalpia de formação da água, $\Delta H_\mathrm{f}^\circ(\ce{H2O}) = \pu{-242 kJ.mol-1}$
- Entalpia de formação do etanol, $\Delta H_\mathrm{f}^\circ(\ce{C2H5OH}) = \pu{-253 kJ.mol-1}$
- Pressão de vapor da água, $P^\star(\ce{H2O}) = \pu{24 Torr}$
- Pressão de vapor do etanol, $P^\star(\ce{C2H5OH}) = \pu{60 Torr}$

---

**a.** Cálculo da entalpia de reação:
$$
\begin{aligned}
    \Delta H_\mathrm{r} 
        &= \Delta H^\circ_{\mathrm{f}, \ce{C2H5OH(g)}}
        - \Delta H^\circ_{\mathrm{f}, \ce{C2H4(g)}}
        - \Delta H^\circ_{\mathrm{f}, \ce{H2O(g)}} \\
        &= \Big\{ (\pu{-253}) - (\pu{-53}) - (\pu{-242}) \Big\}\,\pu{kJ//mol} \\
        &= \boxed{ \pu{-42 kJ.mol-1} }
\end{aligned}
$$

**b.** Elaboração de uma tabela de reação em bar:

|            |  $\ce{C2H4}$  |  $\ce{H2O}$   | $\ce{C2H5OH}$ |
| :--------- | :-----------: | :-----------: | :-----------: |
| início     |   $\pu{60}$   |   $\pu{40}$   |      $0$      |
| reação     |     $-x$      |     $-x$      |     $+x$      |
| equilíbrio | $\pu{60} - x$ | $\pu{40} - x$ |      $x$      |

Substituindo os dados da tabela na expressão da constante de equilíbrio:
$$
    K = \dfrac{ P_{\ce{C2H5OH}} }{ P_{\ce{C2H4}} P_{\ce{H2O}} } = \dfrac{ x }{ (\pu{60} - x)(\pu{40} - x) } = \pu{26}
$$
logo, $x = \pu{39,9}$ ou $x = \pu{60,1}$. Como as pressões parciais devem ser positivas, 
$$
    x = \pu{39,9}
$$
Assim, a composição no equilíbrio é:

|            |   $\ce{C2H4}$   |   $\ce{H2O}$   |  $\ce{C2H5OH}$  |
| :--------- | :-------------: | :------------: | :-------------: |
| equilíbrio | $\pu{20,1 bar}$ | $\pu{0,1 bar}$ | $\pu{39,9 bar}$ |

**c.** A adição de etanol desloca o equilíbrio no sentido inverso.

**d.** A reação é exotérmica ($\Delta H < 0$). O aumento da temperatura acarreta na diminuição da constante de equilíbrio, desfavorecendo a formação dos produtos.

**e.** Ao final da reação, a quantidade de água no reator é desprezível, assim, a pressão do vapor no tambor é a pressão de vapor do etanol, $P = P^\star_{\ce{C2H5OH}} = \pu{60 Torr}$.
