Um reator de $\pu{24,6 L}$ foi carregado com $\pu{1 mol}$ de $\ce{N2O4}$ em $\pu{300 K}$ e o equilíbrio foi estabelecido:
$$
    \ce{ N2O4(g) <=> 2 NO2(g) }
$$
A pressão total registrada no reator foi $\pu{1,2 atm}$. 

Quando o reator é aquecido até $\pu{360 K}$, a pressão total sobe para $\pu{1,8 atm}$

a. **Determine** a constante de equilíbrio da reação em $\pu{300 K}$.
b. **Determine** a constante de equilíbrio da reação em $\pu{360 K}$.
c. **Determine** a entalpia padrão de reação.
d. **Determine** a entropia padrão de reação

---

#### **(a e b)** Calcule a pressão inicial de $\ce{N2O4}$.

$$
    P_0 
        = \dfrac{ n_0 RT }{ V } 
        = \dfrac{ (\pu{1 mol})\times (\pu{0,082 atm.L//mol.K})\times (\pu{300 K}) }{ \pu{24,6 L} }
        = \pu{1 atm}
$$

#### Elabore uma tabela de equilíbrio.

|            | $\ce{N2O4}$ | $\ce{NO2}$ |
| :--------- | :---------: | :--------: |
| início     |  $\pu{1}$   |  $\pu{0}$  |
| reação     |    $-x$     |   $+2x$    |
| equilíbrio | $\pu{1}-x$  |    $2x$    |

#### Insira os valores da tabela na expressão da pressão total.

$$
    P_\text{total} = P_{\ce{N2O4}} + P_{\ce{NO2}} = (\pu{1 atm}-x) + 2x =  \pu{1 atm} + x
$$
logo,
$$
    x = P_\text{total} - \pu{1 atm}
$$

#### Calcule a pressão de $\ce{N2O4}$ que reagiu em $\pu{300 K}$ e $\pu{360 K}$, $x$, igualando a pressão total a $\pu{1,2 atm}$.

$$
\begin{aligned}
    x_{\pu{300 K}} &= \pu{1,2 atm} - \pu{1 atm} = \pu{0,2 atm} \\
    x_{\pu{360 K}} &= \pu{1,8 atm} - \pu{1 atm} = \pu{0,8 atm}
\end{aligned}
$$

#### Insira os valores da tabela na expressão da constante de equilíbrio.

$$
    K = \dfrac{ P_{\ce{NO2}}^2 }{ P_{\ce{N2O4}} }
        = \dfrac{ (2x)^2 }{ \pu{1}-x }
        = \dfrac{ 4x^2 }{ \pu{1}-x }
$$
logo,
$$
\begin{aligned}
    K_{\pu{300 K}} 
        &= \dfrac{ 4x_{\pu{300 K}}^2 }{ \pu{1}-x_{\pu{300 K}} }
        =\dfrac{ 4 (\pu{0,2})^2 }{ \pu{1}-\pu{0,2} } = \boxed{ \pu{0,20} } \\
    K_{\pu{360 K}} 
        &= \dfrac{ 4x_{\pu{360 K}}^2 }{ \pu{1}-x_{\pu{360 K}} }
        = \dfrac{ 4 (\pu{0,8})^2 }{ \pu{1}-\pu{0,8} } = \boxed{ \pu{12,8} }  
\end{aligned}
$$

#### **(c)** Use a equação de Van't Hoff.

$$
    \ln\dfrac{K_2}{K_1} = -\dfrac{\Delta H_\mathrm{r}^\circ}{R} \left( \dfrac{1}{T_2} - \dfrac{1}{T_1} \right)
$$
logo,
$$
    \Delta H_\mathrm{r}^\circ 
        = \dfrac{ R\ln\dfrac{K_2}{K_1} }{ \left( \dfrac{1}{T_1} - \dfrac{1}{T_2} \right) }
        = \dfrac{ (\pu{8,3 J//K.mol}) \times \ln\dfrac{\pu{12,8}}{\pu{0,20}} }{ \left( \dfrac{1}{\pu{300 K}} - \dfrac{1}{\pu{360 K}} \right) }
        = \boxed{ \pu{62,7 kJ.mol-1} }
$$

#### **(d)** Calcule a energia livre padrão de reação em $\pu{300 K}$.

$$
    \Delta G_{\mathrm{r}, \pu{300 K}}^\circ 
        = -RT \ln K 
        = -(\pu{8,3 J//K.mol}) \times (\pu{300 K}) \times \ln \pu{0,2}
        = \pu{1,7 kJ.mol-1}
$$

#### Calcule a entropia padrão de reação a partir da energia livre padrão de reação em $\pu{300 K}$.

$$
    \Delta G_\mathrm{r}^\circ 
        = \Delta H_\mathrm{r}^\circ - T \Delta S_\mathrm{r}^\circ
$$
logo,
$$
    \Delta S_\mathrm{r}^\circ 
        = \dfrac{ \Delta H_\mathrm{r}^\circ - \Delta G_\mathrm{r}^\circ }{ T }
        = \dfrac{ \pu{62,7 kJ//mol} - \pu{1,7 kJ//mol} }{ \pu{300 K} }
        = \boxed{ \pu{203 J.K-1.mol-1} }
$$