O grafeno é constituído de uma folha bidimensional de átomos de carbono, com apenas um átomo de espessura. Nesse material, os átomos de carbono estão em um arranjo hexagonal, em que a área de cada hexágono é $\pu{5e-20 m2}$.

Pesquisadores da Universidade de Manchester conduziram um experimento em que gás nitrogênio a $\pu{0 \degree C}$ e $\pu{1 atm}$ foi adsorvido sobre uma folha de $\pu{1 g}$ de grafeno colocada sobre um suporte sólido. O arranjo das moléculas de nitrogênio sobre o grafeno é mostrado a seguir:

```latex
\medskip
\begin{tikzpicture}
\begin{scope}
[
    every node/.style =
        {
            anchor=corner 2,
            regular polygon, 
            regular polygon sides=6,
            draw,
            thick,
            minimum width=4em,
            outer sep=0,
        },
]
\node (A) {};
\node (B) at (A.corner 4) {};
\node[fill=yellow!20] (C) at (B.corner 4) { \ce{N2} };

\node[fill=yellow!20] (D) at (A.corner 6) { \ce{N2} };
\node (E) at (D.corner 4) {};
\node (F) at (E.corner 4) {};

\node[anchor = corner 3] (G) at (D.corner 1) {};
\node (H) at (G.corner 4) {};
\node[fill=yellow!20] (I) at (H.corner 4) { \ce{N2} };

\node[fill=yellow!20] (J) at (G.corner 6) { \ce{N2} };
\node (K) at (J.corner 4) {};
\node (L) at (K.corner 4) {};

\node[anchor = corner 3] (M) at (J.corner 1) {};
\node (N) at (M.corner 4) {};
\node[fill=yellow!20] (O) at (N.corner 4) { \ce{N2} };
    
\foreach \hex in {A,...,O}
    {
        \foreach \corn in {1,...,6}
            \draw[fill=black!20] (\hex.corner \corn) circle (3pt); 
    }
\end{scope}
\end{tikzpicture}
\medskip
```

a. **Determine** área da superfície de uma folha de $\pu{1 g}$ de grafeno.
b. **Determine** o volume ocupado pelas moléculas de nitrogênio adsorvidas no experimento.

---

#### **(a)** Converta a massa de grafeno em quantidade de carbono.

De $n = m/M$,
$$
    n = \dfrac{ \pu{1 g} }{ \pu{12 g//mol} } = \pu{0,083 mol}
$$
#### Calcule o número de átomos de carbono em $\pu{0,083 mol}$ de carbono.

De $N = N_\mathrm{A} n$,
$$
    N_{\mathrm{C}} = (\pu{6e23 mol-1}) \times (\pu{0,083 mol}) = \pu{5e22}
$$

#### Calcule o número de hexágonos em $\pu{5e22}$ de carbono.

Cada hexágono é formado por 6 átomos de carbono, e cada átomo de carbono está em 3 hexágonos.
$$
    N_\mathrm{hex} = \dfrac{3}{6} \times (\pu{5e22}) = \pu{2,5e22}
$$

#### Calcule a área total dos hexágonos $\pu{1 g}$ de grafeno.

$$
    S = 2(\pu{2,5e22}) \times (\pu{5e-20 m2}) 
        = \boxed{ \pu{1250 m2} }
$$

#### **(b)** Determine a quantidade de $\ce{N2}$ que podem ser adsorvida por $\pu{1 g}$ de grafeno.

Nesse caso, como a folha de grafeno está apoiada sobre um suporte sólido, a adsorção ocorre apenas em um dos lados. Assim, cada 6 átomos de carbono adsorvem uma molécula de nitrogênio, ou seja:
$$
    n_{\ce{N2}} = \dfrac{1}{6} n_{\ce{C}} = \dfrac{1}{6} \times (\pu{0,083 mol}) = \pu{0,014 mol}
$$

#### Calcule o volume de $\ce{N2}$ adsorvido.

O volume molar em CNTP ($\pu{0 \degree C}$ e $\pu{1 atm}$) é $V_\mathrm{CNTP} = \pu{22,4 L.mol-1}$. 

De $V = n V_\mathrm{m}$
$$
    V_{\ce{N2}} = (\pu{0,014 mol}) \times (\pu{22,4 L//mol}) = \boxed{ \pu{0,3 L} }
$$

