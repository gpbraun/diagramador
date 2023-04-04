Um engenheiro projetou uma planta para separação de um efluente industrial aquoso contendo massas iguais de uma mistura de nitrato de cobre(II), nitrato de chumbo(II) e nitrato de prata, na concentração total de $\pu{60 g/L}$.

```latex
\begin{tikzpicture}
\pic (mixer1) at (0 ,0) { stirred reactor };
\pic (filter1) at (3 , -2) { bag filter };
\pic (mixer2) at (6 , -2) { stirred reactor };
\pic (filter2) at (9 , -4) { bag filter };
\pic (tank1) at (4, 2) { tank };
\pic (tank2) at (10, 0) { tank };
\draw [ main stream ] 
    ($(mixer1-top left) - (2,0)$) -- (mixer1-top left);
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
\draw [ main stream ] (filter2-fluid outlet right) --++ (3, 0);
\draw [ main stream ] (filter1-solid outlet) --++ (0, -1);
\draw [ main stream ] (filter2-solid outlet) --++ (0, -1);
\node [align = center] at (tank1-anchor) { Sulfato \\ de amônio \\ aquoso };
\node [anchor = north] at (tank1-bottom) { Tanque 1 };
\node [align = center] at (tank2-anchor) { Carbonato \\ de sódio \\ aquoso };
\node [anchor = north] at (tank2-bottom) { Tanque 2 };
\node [anchor = north] at (mixer1-bottom) { Misturador 1 };
\node [anchor = north] at (mixer2-bottom) { Misturador 2 };
\node [anchor = south, shift={(0, 3pt)}] at (filter1-top) { Filtro 1 };
\node [anchor = south, shift={(0, 3pt)}] at (filter2-top) { Filtro 2 };
\node [anchor = south west, shift={(3pt, 3pt)}] at (filter2-fluid outlet right) { Saída líquida };
\node [anchor = north east, shift={(-3pt, -3pt)}] at (filter2-solid outlet) { Saída sólida 2 };
\node [anchor = north east, shift={(-3pt, -3pt)}] at (filter1-solid outlet) { Saída  sólida 1 };
\node [anchor = south east, shift={(-3pt, +3pt)}] at (mixer1-top left) { Entrada };
\end{tikzpicture}
```

O Misturador 1 recebe a entrada de efluente na vazão de $\pu{100 L.s-1}$, que é misturada com $\pu{100 L.s-1}$ de uma solução de sulfato de amônio $\pu{20 g.L-1}$. O Misturador 2 recebe o material passante do Filtro 1, $\pu{100 L.s-1}$ de uma solução aquosa de carbonato de sódio de concentração $\pu{40 g.L-1}$ e pequena quantidade de uma solução de hidróxido de sódio objetivando o ajuste do pH de precipitação para, em seguida, proceder a filtração.

Considere as proposições.

1. [x] A saída de sólida do filtro 2 é uma mistura heterogênea.
2. [ ] Olá
3. [ ] três
4. [ ] quatro

**Assinale** a alternativa que relaciona as proposições corretas.

---

Gabarito!
