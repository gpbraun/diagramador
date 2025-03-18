Nos sistemas de refrigeração industrial a amônia é usada como fluido térmico, por não contribuir para o efeito estufa e nem para a destruição a camada de ozônio. Estas unidades industriais são muito grandes e caras, assim, antes de serem construídas, devem ser planejadas tendo em conta diferentes parâmetros. Em sistemas reais, parte do líquido refrigerante é liberado, no início do aquecimento, sob a forma de vapor para o ambiente (ponto 0) e, no final (ponto 1), é sempre aquecido acima da sua temperatura de ebulição.

:::::::::::::: columns

::: {.column width=40% align=center}

![](NH3_vapor_cycle.svg){width=90%}

:::

::: {.column width=60% align=left}

- **Etapa 0--1.** A mistura em equilíbrio, líquido e seu vapor, recebe calor do ambiente a pressão constante $P_1 = \pu{3 bar}$. O líquido refrigerante evapora completamente e superaquece até à temperatura $T_1 = \pu{275 K}$.
- **Etapa 1--2.** O líquido é comprimido reversivelmente em condições adiabáticas e aquece até $T_2 = \pu{400 K}$.
- **Etapa 2--3.** O líquido, que está comprimido, é resfriado num condensador à pressão constante.
- **Etapa 3--0.** O líquido retorna ao estado inicial através de uma expansão adiabática com trabalho nulo.

:::

::::::::::::::

No inicio do processo (ponto 0), $10\%$ da amônia está na fase gasosa. A eficiência do refrigerador é definida como a razão entre o calor absorvido na etapa 0--1 e o trabalho do compressor na etapa 1--2.


Considere que o ciclo envolve $\pu{1 mol}$ de amônia.

a. **Determine** a temperatura $T_0.$
b. **Determine** o calor absorvido na etapa 0--1.
c. **Determine** a eficiência do refrigerador.
d. **Determine** a temperatura $T_3.$
e. **Explique** o efeito do aumento de $T_3$ na eficiência

**Dados**

- Energia interna de vaporização da amônia: $\Delta U_\mathrm{vap} = \pu{20 kJ.mol-1}$ em $T_0.$
- Capacidades caloríficas das fases líquida e gasosa: $C_{V,\ce{(l)}} = \pu{80 J.K-1.mol-1}$ e $C_{V,\ce{(g)}} = \pu{30 J.K-1.mol-1}.$ 
- Relação entre a pressão máxima de vapor da amônia e temperatura: $\log\left(\dfrac{P_{\mathrm{sat}}}{\pu{bar}}\right) = \pu{5,5} - \dfrac{1200}{T/\pu{K} - 20}$

---

#### **(a)** Determine a temperatura inicial $T_0$  

No ponto 0, $x_0 = 10\%$ da amônia está na fase gasosa. Assim, a temperatura $T_0$ deve ser a temperatura de ebulição à pressão $P_1 = \pu{3 bar}.$ 

A temperatura de ebulição à pressão $P_1 = \pu{3 bar}$ é determinada pela equação empírica:
$$
    \log\left(\frac{P_{\mathrm{sat}}}{\pu{bar}}\right) = \pu{5,5} - \frac{\pu{1200}}{T/\pu{K} - \pu{20}}
$$
Logo:
$$
    T_0 = \pu{20 K} + \frac{\pu{1200 K}}{\pu{5,5} - \log(3)} = \boxed{ \pu{260 K} }
$$

#### **(b)** Calcule a variação de energia interna na etapa 0--1.

O cálculo da variação de energia interna $\Delta U_{01}$ pode ser subdividido em duas etapas (01.1 e 01.2).

**01.1.** Vaporização completa da fração líquida em temperatura $T_0.$ 
$$
    \Delta U_{01.1} 
        = (1 - x_0) n \Delta U_\mathrm{vap}^{T_0}
        = (1 - \pu{0,10}) \times (\pu{1 mol}) \times (\pu{20 kJ//mol})
        = \pu{+18 kJ}
$$
**01.2.** Aquecimento do vapor de $T_0$ até $T_1.$ 
$$
    \Delta U_{01.2} = n C_{V,\ce{(g)}} (T_1 - T_0)
        = (\pu{1 mol}) \times (\pu{30e-3 kJ//mol.K}) \times (\pu{275 K} - \pu{260 K})
        = \pu{+0,45 kJ}
$$
Logo:
$$
    \Delta U_{01} = (\pu{18 kJ}) + (\pu{0,45 kJ}) = \pu{+18,45 kJ}
$$

#### Calcule a variação de volume na etapa 0--1.

Considerando o vapor de amônia como gás ideal e desprezando o volume de líquido, a variação de volume é calculada como:
$$
    \Delta V_{01} = V_1 - V_0 = \frac{n R T_1}{P_1} - \frac{ (x_0 n) R T_0}{P_1}
$$
Em que $x_0$ é a fração de amônia vaporizada no ponto 0. Logo:
$$
    \Delta V_{01}
        = \left[\frac{(\pu{1 mol}) \times (\pu{8,31 Pa.m3//mol.K}) \times (\pu{275 K})}{(\pu{3,0e5 Pa})}\right] 
            - \left[\frac{(\pu{0,1 mol}) \times (\pu{8,31 Pa.m3//mol.K}) \times (\pu{260 K})}{(\pu{3,0e5 Pa})}\right]
        = \pu{6,2e-3 m3}
$$

#### Calcule o calor absorvido na etapa 0--1 (isobárica).

O calor absorvido em pressão constante corresponde à variação de entalpia:
$$
    Q_{01} 
        = \Delta H_{01} = \Delta U_{01} + P_1 \Delta V_{01}
        = (\pu{18,45 kJ}) + \left[(\pu{3e5 Pa}) \times (\pu{6,2e-3 m3})\right]
        = \boxed{ \pu{+20,3 kJ} }
$$

#### **(c)** Calcule o trabalho realizado na etapa 1--2 (compressão adiabática)

$$
    W_{12} 
        = n C_{V,\ce{(g)}} (T_2 - T_1)
        = (\pu{1 mol}) \times (\pu{30 J//mol.K}) \times (\pu{400 K} - \pu{275 K})
        = \pu{3,75 kJ}
$$
A eficiência, $\varepsilon,$ é dada por:
$$
    \varepsilon
        = \dfrac{ Q_{01}  }{ W_{12} }
        = \dfrac{ \pu{20,3 kJ} }{ \pu{3,75 kJ} }
        = \boxed{ \pu{5,41} }
$$

#### **(d)** Calcule a temperatura $T_3$ no condensador.

A etapa 3--0 possui variação de energia interna nula:
$$
    \Delta U_{03} = x_0 \Delta U_\mathrm{vap}^{T_0} + C_{V,\ce{(l)}} (T_0 - T_3) = 0
$$
Logo:
$$
    T_3 
        = T_0 - \frac{x_0 \Delta U_\mathrm{vap}^{T_0} }{C_{V,\ce{(l)}}}
        = \pu{260 K} + \frac{(\pu{0,10}) \times (\pu{20 kJ//mol})}{ (\pu{80 J//mol.K}) }
        = \boxed{ \pu{285 K} }
$$

#### **(e)** Avalie o efeito do aumento da temperatura $T_3$ na eficiência.

Amentando $T_3$, o comprimento da linha 0--1 no diagrama diminui, ou seja, a fração de líquido disponível para vaporização em $T_0$ será menor. Isso ocorre porque a fração de gás $x$ da mistura de equilíbrio em $T_0$ aumenta, resultando em menos líquido na mistura. Como consequência, menos calor $Q_{01}$ é necessário para evaporá-lo, **reduzindo a eficiência do refrigerador.**
