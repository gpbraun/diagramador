Um tambor selado contém ar seco e uma mistura equimolar de benzeno e tolueno líquidos em $\pu{20 \degree C}$. A pressão de vapor do benzeno é $\pu{90 Torr}$ e a do tolueno é $\pu{30 Torr}$ nessa temperatura. Um manômetro acoplado ao tambor registra a pressão total de $\pu{760 Torr}$. Em uma queda durante seu transporte, o tambor foi danificado e seu volume interno diminuiu para $\pu{70}\%$ do volume inicial, sem que tenha havido vazamento. A temperatura interna se manteve estável em $\pu{20 \degree C}$. 

a. **Determine** a pressão parcial do ar seco no tambor.
b. **Determine** a fração molar de benzeno na fase gasosa antes da queda.
c. **Determine** a fração molar de benzeno na fase gasosa após a queda.

---

#### **(a)** Calcule a pressão de vapor da mistura usando a lei de Raoult.

$$
    P_\mathrm{vap}
        = x_{\ce{C6H6}} P_{\ce{C6H6}}^\star + x_{\ce{C7H8}} P_{\ce{C7H8}}^\star
        = (\pu{0,5}) \times (\pu{90 Torr}) + (\pu{0,5}) \times (\pu{30 Torr})
        = \pu{60 Torr}
$$

#### Calcule a pressão parcial do ar seco.

$$
    P_\mathrm{ar} 
        = P_\mathrm{total} - P_\mathrm{vap} 
        = (\pu{760 Torr}) - (\pu{60 Torr})
        = \boxed{ \pu{700 Torr} }
$$

#### **(b)** Calcule a fração molar de benzeno na fase gasosa usando a lei de Dalton.

$$
    y_{\ce{C6H6}} 
        = \dfrac{ P_{\ce{C6H6}} }{ P_\mathrm{total} }
        = \dfrac{ x_{\ce{C6H6}} P_{\ce{C6H6}}^\star }{ P_\mathrm{total} }
        = \dfrac{ (\pu{0,5}) \times (\pu{90 Torr}) }{ \pu{760 Torr} }
        = \boxed{ \pu{0,059} }
$$

#### **(c)** Calcule a pressão parcial do ar seco após a queda.

Para uma transformação de gases em que a quantidade e a temperatura permanecem constantes, $PV = P^\prime V^\prime$. Logo,
$$
    P^\prime_\mathrm{ar} 
        = P\dfrac{V}{V^\prime} 
        = (\pu{700 Torr}) \times \left(\dfrac{100}{70}\right)
        = \pu{1000 Torr}
$$

#### Calcule a pressão total após a queda.

Como a temperatura permanece constante, a pressão de vapor permanece inalterada após a queda.
$$
    P^\prime_\mathrm{total}  
        = P^\prime_\mathrm{ar} + P_\mathrm{vap}  
        = (\pu{1000 Torr}) + (\pu{60 Torr})
        = \pu{1060 Torr}
$$

#### Calcule a fração molar de benzeno na fase gasosa após a queda usando a lei de Dalton.

$$
    y^\prime_{\ce{C6H6}} 
        = \dfrac{ P_{\ce{C6H6}} }{ P^\prime_\mathrm{total} }
        = \dfrac{ x_{\ce{C6H6}} P_{\ce{C6H6}}^\star }{ P^\prime_\mathrm{total} }
        = \dfrac{ (\pu{0,5}) \times (\pu{90 Torr}) }{ \pu{1060 Torr} }
        = \boxed{ \pu{0,042} }
$$
