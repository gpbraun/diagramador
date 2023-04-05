---
elementos: Ag, Cu, Pb
---

Um engenheiro projetou uma planta para separação de um efluente industrial aquoso contendo massas iguais de nitrato de cobre(II), nitrato de chumbo(II) e nitrato de prata, na concentração total de $\pu{51 g/L}$. 

```latex
\begin{tikzpicture}
\pic (mixer1) at (0 ,0) { stirred reactor };
\pic at (mixer1-anchor) { jacket };
\pic (filter1) at (3 , -1.3) { bag filter };
\pic (mixer2) at (6 , 0) { stirred reactor };
\pic (filter2) at (9 , -1.3) { bag filter };
\pic at (mixer2-anchor) { jacket };
\pic[yscale=0.9] (tank1) at (3, 2) { tank };
\pic[yscale=0.9] (tank2) at (9, 2) { tank };
\draw [ main stream ] 
    ($(mixer1-top left) - (1.8,0)$) -- (mixer1-top left);
\draw [ main stream ] 
    (tank1-bottom left) 
    -| ($(tank1-bottom left)!0.5!(mixer1-top right)$) 
    |- (mixer1-top right);
\draw [ main stream ] 
    (tank2-bottom left) 
    -| ($(tank2-bottom left)!0.5!(mixer2-top right)$) 
    |- (mixer2-top right);
\draw [ main stream ] 
    (mixer1-bottom right) 
    -| ($(mixer1-bottom right)!0.5!(filter1-inlet left)$) 
    |- (filter1-inlet left);
\draw [ main stream ] 
    (filter1-fluid outlet right) 
    -| ($(filter1-fluid outlet right)!0.5!(mixer2-top left)$) 
    |- (mixer2-top left);
\draw [ main stream ] 
    (mixer2-bottom right) 
    -| ($(mixer2-bottom right)!0.5!(filter2-inlet left)$) 
    |- (filter2-inlet left);
\draw [ main stream ] (filter2-fluid outlet right) --++ (2.5, 0);
\draw [ main stream ] (filter1-solid outlet) --++ (0, -0.8);
\draw [ main stream ] (filter2-solid outlet) --++ (0, -0.8);
\node [align = center] at (tank1-anchor) 
    { Sulfato \\ de amônio \\ aquoso \\[1ex] \qty{26}{g.L^{-1}} };
\node [align = center] at (tank2-anchor) 
    { Carbonato \\ de sódio \\ aquoso \\[1ex] \qty{53}{g.L^{-1}}  };
\node [anchor = north] at (tank1-bottom) 
    { Tanque 1 };
\node [anchor = north] at (tank2-bottom) 
    { Tanque 2 };
\node [anchor = north, shift={(0, -5pt)}] at (mixer1-bottom) 
    { Misturador 1 };
\node [anchor = north, shift={(0, -5pt)}] at (mixer2-bottom) 
    { Misturador 2 };
\node [anchor = north, shift={(0, +20pt)}] at (mixer1-bottom) 
    { \qty{80}{\celsius} };
\node [anchor = north, shift={(0, +20pt)}] at (mixer2-bottom) 
    { \qty{10}{\celsius} };
\node [anchor = south, shift={(0, 3pt)}] at (filter1-top) 
    { Filtro 1 };
\node [anchor = south, shift={(0, 3pt)}] at (filter2-top) 
    { Filtro 2 };
\node [anchor = south west, shift={(3pt, 3pt)}] at (filter2-fluid outlet right) 
    { Saída líquida };
\node [anchor = north east, shift={(-3pt, -3pt)}] at (filter2-solid outlet) 
    { Saída sólida 2 };
\node [anchor = north east, shift={(-3pt, -3pt)}] at (filter1-solid outlet) 
    { Saída  sólida 1 };
\node [anchor = south east, shift={(-3pt, +3pt)}] at (mixer1-top left) 
    { Entrada };
\end{tikzpicture}
```
O Misturador 1 recebe a entrada de efluente na vazão de $\pu{100 L.s-1}$ que é misturada com $\pu{100 L.s-1}$ de uma solução de sulfato de amônio $\pu{26 g.L-1}$. O Misturador 1 é equipado com uma jaqueta que mantém a mistura em $\pu{80 \degree C}$.

O Misturador 2 recebe o material passante do Filtro 1 e $\pu{100 L.s-1}$ de uma solução aquosa de carbonato de sódio de concentração $\pu{53 g.L-1}$ com pequena quantidade de uma solução de hidróxido de sódio objetivando o ajuste do pH de precipitação. A temperatura da solução é mantida em $\pu{10 \degree C}$ no misturador para, em seguida, proceder a filtração no Filtro 2. 

A curva de solubilidade do sulfato de prata em água é apresentada a seguir.

```latex
\begin{tikzpicture}
\begin{axis}
[
    width = 0.8\linewidth,
    height = 5.2cm,
    grid = both,
    ylabel = {Solubilidade, $s/(\qty{1}{g}/\qty{100}{mL})$},
    xlabel = {Temperatura, $T/\unit{\degree C}$},
    xmin = 0, xmax = 100,
    ymin = 0.5, ymax = 1.5,
    ytick = {0.5, 0.75, 1, 1.25, 1.5},
    yticklabels = {\num{0,50}, \num{0,75}, \num{1,00}, \num{1,25}, \num{1,50}},
]       
\addplot+ [smooth, mark=*, mark options={fill=white}] coordinates
    {
        (0, 0.573)
        (20, 0.796)	
        (40, 0.979)	
        (60, 1.15)
        (80, 1.3)	
        (100, 1.46)
    };
\end{axis}
\end{tikzpicture}
```

Considere as proposições.

1. [x] A saída sólida do Filtro 1 é constituída apenas de sulfato de chumbo(II).
2. [x] A saída de sólida do Filtro 2 é uma mistura heterogênea.
3. [x] Todos os cátions metálicos do efluente são removidos nas saídas sólidas dos Filtros 1 e 2.
4. [x] A prata metálica pode ser obtida pela calcinação da mistura na saída sólida do Filtro 2.

**Assinale** a alternativa que relaciona as proposições corretas.

---

####  **(1)** Identifique os íons em solução no Misturador 1.

A solução no Misturador 1 contém os íons $\ce{Ag^+}$, $\ce{Pb^{2+}}$, $\ce{Cu^{2+}}$, $\ce{NO3^-}$, $\ce{NH4^+}$ e $\ce{SO4^{2-}}$.

#### Use as regras de solubilidade para verificar se há formação de precipitado no Misturador 1.

Os íons $\ce{Pb^{2+}}$ e $\ce{SO4^{2-}}$ formam um composto insolúvel, e o $\ce{PbSO4}$ precipita.

O $\ce{Ag2SO4}$ é ligeiramente solúvel, sua concentração deve ser calculada para verificar se há precipitação.

#### Calcule a concentração molar inicial de $\ce{Ag^+}$ e $\ce{Pb^{2+}}$ no Misturador 1.

$$
\begin{aligned}
    \ce{[Ag^+]}
        = \ce{[AgNO3]}
        &= \dfrac{1}{2} \times \dfrac{ \frac{1}{3} \times (\pu{51 g//L}) }{ \pu{170 g//mol} }
        = \pu{50 mmol.L-1} \\
    \ce{[Pb^{2+}]}
        = \ce{[Pb(NO3)2]}
        &= \dfrac{1}{2} \times \dfrac{ \frac{1}{3} \times (\pu{51 g//L}) }{ \pu{331 g//mol} }
        = \pu{25 mmol.L-1} 
\end{aligned}
$$

#### Calcule a concentração molar inicial de $\ce{SO4^{2-}}$ no Misturador 1.

$$
    \ce{[SO4^{2-}]} 
        = \ce{[(NH4)2SO4]}
        = \dfrac{1}{2} \times \dfrac{ (\pu{26 g//L}) }{ \pu{132 g//mol} }
        = \pu{100 mmol.L-1}
$$

#### Escreva a equação iônica simplificada para a reação de precipitação do $\ce{PbSO4}$.

$$
    \ce{ Pb^{2+}(aq) + SO4^{2-}(aq) -> PbSO4(s) }
$$

#### Use a relação estequiométrica para converter a quantidade de $\ce{Pb^{2+}}$ em $\ce{SO4^{2-}}$ consumido.

$$
    \ce{[SO4^{2-}]}_\mathrm{consumido}
        = \dfrac{1}{1} c_{\ce{Pb^{2+}}} 
        = \pu{25 mmol.L-1} 
$$

#### Calcule a quantidade de $\ce{SO4^{2-}}$ em excesso no Misturador 1 após a precipitação de $\ce{PbSO4}$.

$$
    \ce{[SO4^{2-}]}_\mathrm{xs} 
        = \ce{[SO4^{2-}]} - \ce{[SO4^{2-}]}_\mathrm{consumido}
        = \pu{100 mmol//L} - \pu{25 mmol//L} 
        = \pu{75 mmol.L-1} 
$$

#### Calcule a concentração molar de $\ce{Ag2SO4}$ no Misturador 1.

$$
    \ce{[Ag2SO4]} = \pu{25 mmol.L-1} 
$$

#### Calcule a concentração mássica de $\ce{Ag2SO4}$ no Misturador 1.

$$
    \ce{[Ag2SO4]}
        = (\pu{25 mmol//L}) \times (\pu{312 g//mol}) 
        = \dfrac{ \pu{0,78 g} }{ \pu{100 mL} }
$$
A concentração é inferior à solubilidade do sal em $\pu{80 \degree C}$. Não há precipitação de $\ce{Ag2SO4}$ no Filtro 1.

#### **(2)** Identifique os íons em solução no Misturador 2.

A solução no Misturador 2 contém os íons $\ce{Ag^+}$, $\ce{Cu^{2+}}$, $\ce{NO3^-}$, $\ce{NH4^+}$, $\ce{SO4^{2-}}$, $\ce{Na^+}$ e $\ce{CO3^{2-}}$.

#### Use as regras de solubilidade para verificar se há formação de precipitado no Misturador 2.

Os íons $\ce{Cu^{2+}}$ e $\ce{CO3^{2-}}$ e os íons $\ce{Ag^+}$ e $\ce{CO3^{2-}}$ formam compostos insolúveis, e há precipitação de $\ce{CuCO3}$ e $\ce{Ag2CO3}$.

#### **(3)** Identifique a saída de cada cátion metálico.

Os íons $\ce{Pb^{2+}}$ são removidos na saída sólida do Filtro 1, enquanto os íons $\ce{Ag^+}$ e $\ce{Cu^{2+}}$ são removidos na saída sólida do Filtro 2.

#### **(4)** Escreva as reações de calcinação dos componentes da mistura sólida na saída do Filtro 2 ($\ce{Ag2CO3}$ e $\ce{CuCO3}$).

$$
\begin{aligned}
    \ce{ Ag2CO3(s) &->[$\Delta$] Ag2O(s) + CO2(g) } \\
    \ce{ 2 Ag2O(s) &->[$\Delta$] 4 Ag(s) + O2(g) } \\
    \ce{ CuCO3(s) &->[$\Delta$] CuO(s) + CO2(g) }
\end{aligned}
$$
A calcinação do carbonato de prata leva à formação de prata metálica.

