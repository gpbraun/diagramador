oi

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

1. lá