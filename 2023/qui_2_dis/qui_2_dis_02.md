Em uma planta de produção de ácido sulfúrico é conduzida a reação:
$$
    \ce{ 2 SO2(g) + O2(g) -> 2 SO3(g) }
    \quad
    \Delta H_\mathrm{r}^\circ = \pu{-198 kJ.mol-1}
$$
em um reator dotado de um pistão que se move sem atrito. O reator é carregado com $\pu{2 m3}$ de dióxido de enxofre, $\ce{SO2}$, e $\pu{10 m^3}$ de ar, ambos em $\pu{25 \degree C}$ e $\pu{1 atm}$. A reação se completa com a temperatura e pressão mantidas constantes. 

a. **Determine** o volume do reator ao final da reação.
b. **Determine** o trabalho executado.
c. **Determine** a variação de entalpia do sistema.
d. **Determine** a variação de energia interna do sistema.

---

#### **(a)** Calcule o volume inicial de $\ce{O2}$ e $\ce{N2}$.

$$
\begin{aligned}
    V_{\ce{O2}} 
        &= x_{\ce{O2}} V_\mathrm{ar} 
        = (\pu{0,21}) \times (\pu{10 m3})
        = \pu{2,1 m3} \\
    V_{\ce{N2}} 
        &= x_{\ce{N2}} V_\mathrm{ar} 
        = (\pu{0,79}) \times (\pu{10 m3})
        = \pu{7,9 m3}
\end{aligned}
$$

#### Elabore uma tabela de reação.

|        | $\ce{2 SO2}$ | $\ce{O2}$  | $\ce{->}$ | $\ce{2 SO3}$ |
| :----- | :----------: | :--------: | --------- | :----------: |
| início |   $\pu{2}$   | $\pu{2,1}$ |           |     $0$      |
| reação |  $-\pu{2}$   | $-\pu{1}$  |           |  $+\pu{2}$   |
| final  |     $0$      | $\pu{1,1}$ |           |   $\pu{2}$   |

#### Insira os valores da tabela na expressão do volume total.

$$
    V_\mathrm{total} 
        = V_{\ce{SO2}} + V_{\ce{O2}} + V_{\ce{SO3}} + V_{\ce{N2}}
        = \Big\{ (\pu{1,1}) + (\pu{2}) + (\pu{7,9}) \Big\}\,\pu{m3}
        = \boxed{ \pu{11 m3} }
$$

#### **(b)** Calcule o trabalho de expansão dos gases.

$$
    W 
        = P \Delta V 
        = (\pu{101 kPa}) \times ( \pu{11 m3} - \pu{12 m3} ) 
        = \boxed{ \pu{-101 kJ} }
$$

#### **(c)** Calcule a quantidade de $\ce{SO2}$ que reagiu.

De $PV = nRT$,
$$
    n_{\ce{SO2}} 
        = \dfrac{ (\pu{1 atm}) \times (\pu{2e3 L}) }{ (\pu{0,082 atm.L//mol.K}) \times (\pu{298 K}) }
        = \pu{82 mol}
$$

#### Calcule a variação de entalpia do sistema.

$$
    \Delta H 
        = n \Delta H_\mathrm{r} 
        = \dfrac{1}{2} n_{\ce{SO2}} \Delta H_\mathrm{r} 
        = \dfrac{1}{2} \times (\pu{82 mol}) \times (\pu{-198 kJ//mol})
        = \boxed{ \pu{-8118 kJ} }
$$

#### **(d)** Use a primeira lei da termodinâmica.

Em pressão constante, o calor é $Q_P = \Delta H$, logo,
$$
    \Delta U 
        = Q - W 
        = (\pu{-8118 kJ}) - (\pu{-101 kJ})
        = \boxed{ \pu{-8017 kJ} }
$$

