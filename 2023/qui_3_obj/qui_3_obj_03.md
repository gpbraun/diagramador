O diagrama de fases para a mistura de água e 1,4-dioxano é apresentado a seguir.

```latex
\begin{tikzpicture}
\begin{axis}
[
    grid = both,
    xlabel = {Fração molar, $x$},
    ylabel = {Temperatura, $T/\unit{\degree C}$},
    xmin = 0, xmax = 1,
    ymin = 75, ymax = 110,
]    
        
\draw [draw=blue, very thick]
    (axis cs: 0.8,80) 
            .. controls (axis cs: 0.4,80) 
            and (axis cs: 0.15,90) .. 
    (axis cs: 0, 100);

\draw [draw=blue, very thick]
    (axis cs: 0.8,80) parabola (axis cs: 1, 105);

\draw [draw=red, very thick]
    (axis cs: 0.8,80) 
            .. controls (axis cs: 0.62,90) 
            and (axis cs: 0.4,100) .. 
    (axis cs: 0, 100);

\draw [draw=red, very thick]
    (axis cs: 0.8,80) parabola bend (axis cs: 1, 105)
        (axis cs: 1, 105);
\end{axis}
\end{tikzpicture}
```

Considere as proposições.

1. [x] Água e dioxano formam um azeótropo de ponto de ebulição mínimo quando a fração molar de água é $\pu{20}\%$.
2. [ ] A mistura de água e dioxano ocorre com liberação de energia.
3. [ ] Em $\pu{20 \degree C}$, a pressão de vapor da água é $\pu{20 Torr}$ e a do dioxano é $\pu{30 Torr}$. A pressão de vapor de uma mistura equimolar de água e dioxano em $\pu{20 \degree C}$ é menor que $\pu{25 Torr}$.
4. [x] Uma mistura contendo $\pu{80}\%$ de água e $\pu{20}\%$ de dioxano em base molar em $\pu{70 \degree C}$ é aquecida até o início da ebulição. O vapor coletado é resfriado de volta a $\pu{70 \degree C}$ resultando em um líquido contendo $\pu{40}\%$ de água em base molar.


**Assinale** a alternativa que relaciona as proposições *corretas*.

---

#### O eixo das abscissas é a fração molar, mas a espécie não está indicada. Identifique qual é a espécie.

Quando a fração molar dessa espécie é zero, a temperatura de ebulição é $\pu{100 \degree C}$, temperatura de ebulição da água. Assim, eixo das abscissas representa a fração molar de dioxano.

#### **(1)** Identifique o ponto de azeótropo no diagrama de fases.

No ponto de azeótropo a composição do vapor é a mesma do líquido em ebulição. O diagrama de fases possui um azeótropo quando a fração molar de dioxano é $\pu{80}\%$ (e a fração molar de água é $\pu{20}\%$) com temperatura de ebulição mínima ($\pu{80 \degree C}$).

#### **(2)** Identifique o tipo de desvio da lei de Raoult.

A mistura de água e dioxano provoca a diminuição da temperatura de ebulição, caracterizada pelo azeótropo de mínimo. Assim, o par água e dioxano apresenta **desvio positivo da lei de Raoult** e o processo de mistura ocorre com **absorção de energia**.

#### **(3)** Calcule a pressão de vapor da mistura ideal usando a lei de Raoult.

Em uma mistura equimolar, $x_{\ce{H2O}} = x_\mathrm{dioxano} = \pu{0,5}$.
$$
    P_\mathrm{vap, ideal}
        = x_{\ce{H2O}} P_{\ce{H2O}}^\star + x_\mathrm{dioxano} P_\mathrm{dioxano}^\star
        = (\pu{0,5}) \times (\pu{20 Torr}) + (\pu{0,5}) \times (\pu{30 Torr})
        = \boxed{ \pu{25 Torr} }
$$
Como a mistura apresenta desvio positivo da lei de Raoult, a pressão de vapor total deve ser maior do que a prevista pela lei de Raoult, isto é, **deve ser maior que** $\pu{25 Torr}$.

#### **(4)** Identifique os pontos correspondentes às etapas do processo de destilação do diagrama de fases.

Quando uma mistura contendo $\pu{80}\%$ de água e $\pu{20}\%$ de dioxano em base molar em $\pu{70 \degree C}$ é aquecida até $\pu{90 \degree C}$ ela entra em ebulição, possibilitando a marcação do ponto $A$ que representa o líquido $\alpha$.

```latex
\begin{tikzpicture}
\begin{axis}
[
    grid = both,
    xlabel = {Fração molar de água, $x_{\ce{H2O}}$},
    ylabel = {Temperatura, $T/\unit{\degree C}$},
    xmin = 0, xmax = 1,
    ymin = 75, ymax = 110,
]     
\draw [draw=blue, very thick]
    (axis cs: 0.8,80) 
            .. controls (axis cs: 0.4,80) 
            and (axis cs: 0.15,90) .. 
    (axis cs: 0, 100);
\draw [draw=blue, very thick]
    (axis cs: 0.8,80) parabola (axis cs: 1, 105);
\draw [draw=red, very thick]
    (axis cs: 0.8,80) 
            .. controls (axis cs: 0.62,90) 
            and (axis cs: 0.4,100) .. 
    (axis cs: 0, 100);
\draw [draw=red, very thick]
    (axis cs: 0.8,80) parabola bend (axis cs: 1, 105)
        (axis cs: 1, 105);
\draw [draw=green, ultra thick, dashed]
    (axis cs: 0.2, 70) -- (axis cs: 0.2, 90) -- (axis cs: 0.6, 90) -- (axis cs: 0.6, 70);
\addplot [ mark=*, color=green, only marks ] coordinates
        {
            (0.2, 90)
            (0.6, 90)
        };
\node [anchor = south west] at (0.2, 90) {$A$};
\node [anchor = south west] at (0.6, 90) {$B$};
\end{axis}
\end{tikzpicture}
```

O ponto $B$ representa o vapor $\beta$ gerado pela vaporização do líquido $\alpha$. Quando o vapor $\beta$ é condensado o líquido resultante tem $\pu{40}\%$ de água em base molar.
