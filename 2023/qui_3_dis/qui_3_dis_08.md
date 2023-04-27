---
elementos: P, F, S, Cl, Br, I
---

a. **Compare** o comprimento das $\ce{P-F}$ no $\ce{PCl5}$.
b. **Ordene** as moléculas $\ce{SF4}$, $\ce{SeF4}$, $\ce{ClF3}$ e $\ce{IF3}$ em função do ângulo de ligação $\ce{F-X-F}$ considerando os átomos de flúor mais afastados um do outro.
c. **Explique** porque os ângulos de ligação nas moléculas $\ce{SF4}$, $\ce{SCl4}$ e $\ce{SBr4}$ variam conforme os diagramas:

```latex 
\def\bondLenght{0.5 cm}
\tikzset
    {
        3Datom/.style=
            {
                shade,
                circle,
                shading = ball,
                ball color = #1!90,
                minimum size = 1.1em,
            },
        3Dbond/.style 2 args=
            {
                cylinder,
                minimum height = #2 * \bondLenght,    
                aspect = 0.8,
                anchor = bottom,
                inner sep = 1.5pt,
                top color = gray, 
                bottom color = gray, 
                middle color = gray!40,
                shading angle = #1,
                rotate = #1,    
                shift={(3.2pt,0)},
            },
		3Dlonepair/.style=
            {
                shade,
                isosceles triangle,
                shading = ball,
                rounded corners = 2ex,
                ball color = cyan,
                minimum width = 1.5em,
                minimum height = 2.5em,
                semitransparent,
                rotate = 180 + #1,
                anchor = apex,
            }
    }
\pgfdeclarelayer{back bonds}
\pgfdeclarelayer{back atoms}
\pgfsetlayers{back atoms, back bonds, main}
\begin{tabular}{ c @{\qquad\qquad} c @{\qquad\qquad} c }
%%%% SF4
\begin{tikzpicture}
\node (C1) [3Datom=yellow] at (0,0) {};
\begin{pgfonlayer}{back bonds}
\node (L1) [3Dbond={ +20}{0.9}] at (C1) {};
\node (L2) [3Dbond={ -80}{1.0}] at (C1) {};
\end{pgfonlayer}
\node (L3) [3Dbond={ -20}{1.1}] at (C1) {};
\node (L5) [3Dbond={ +80}{1.0}] at (C1) {};
\begin{scope}[every node/.style={3Datom=lime}]
    \begin{pgfonlayer}{back atoms}
    \node at ($(L1.top) + (L1.bottom)$) {};
    \node at ($(L2.top) + (L2.bottom)$) {};
    \end{pgfonlayer}
    \node at ($(L3.top) + (L3.bottom)$) {};
    \node at ($(L5.top) + (L5.bottom)$) {};
\end{scope}
\end{tikzpicture}
&
%%%% SCl4
\begin{tikzpicture}
\node (C1) [3Datom=yellow] at (0,0) {};
\begin{pgfonlayer}{back bonds}
\node (L1) [3Dbond={ +20}{0.9}] at (C1) {};
\node (L2) [3Dbond={ -95}{1.0}] at (C1) {};
\end{pgfonlayer}
\node (L3) [3Dbond={ -20}{1.1}] at (C1) {};
\node (L5) [3Dbond={ +95}{1.0}] at (C1) {};
\begin{scope}[every node/.style={3Datom=green}]
    \begin{pgfonlayer}{back atoms}
    \node at ($(L1.top) + (L1.bottom)$) {};
    \node at ($(L2.top) + (L2.bottom)$) {};
    \end{pgfonlayer}
    \node at ($(L3.top) + (L3.bottom)$) {};
    \node at ($(L5.top) + (L5.bottom)$) {};
\end{scope}
\end{tikzpicture}
&
%%%% SBr4
\begin{tikzpicture}
\node (C1) [3Datom=yellow] at (0,0) {};
\begin{pgfonlayer}{back bonds}
\node (L1) [3Dbond={ +20}{0.9}] at (C1) {};
\node (L2) [3Dbond={-100}{1.0}] at (C1) {};
\end{pgfonlayer}
\node (L3) [3Dbond={ -20}{1.1}] at (C1) {};
\node (L5) [3Dbond={+100}{1.0}] at (C1) {};
\begin{scope}[every node/.style={3Datom=orange}]
    \begin{pgfonlayer}{back atoms}
    \node at ($(L1.top) + (L1.bottom)$) {};
    \node at ($(L2.top) + (L2.bottom)$) {};
    \end{pgfonlayer}
    \node at ($(L3.top) + (L3.bottom)$) {};
    \node at ($(L5.top) + (L5.bottom)$) {};
\end{scope}
\end{tikzpicture}
\\
\ce{SF4} & \ce{SCl4} & \ce{SBr4}
\end{tabular}
```