---
elementos: Al, S
---

As primeiras oito energias de ionização para dois elementos do terceiro período da Tabela Periódica são apresentados a seguir.

```latex
\begin{tikzpicture} 
\begin{axis}
[ 
    ylabel = {Energia de ionização, $I_n/\unit{eV}$},
    xlabel = {Número da ionização},
    xtick = {1, 2, 3, 4, 5, 6, 7, 8},
    ymin = 0, ymax = 350,
    xmin = 1, xmax = 8,
]
\addplot [blue, mark options={fill=white}, mark=*] coordinates 
    { 
        (1, 5.98)
        (2, 18.83)
        (3, 28.45)
        (4, 120.0)
        (5, 153.8)
        (6, 190.5)
        (7, 241.7)
        (8, 284.6)
    }; 
\addplot [red, mark options={fill=white}, mark=*] coordinates 
    { 
        (1, 10.36)
        (2, 22.34)
        (3, 34.79)
        (4, 47.22)
        (5, 72.59)
        (6, 88.05)
        (7, 281.0)
        (8, 328.7)
    };
\node at (axis cs: 4.5, 170) {A};
\node at (axis cs: 4.5, 30) {B};
\end{axis} 
\end{tikzpicture}
```

**Assinale** a alternativa com a fórmula empírica do composto iônico binário formado pela reação entre $\ce{A}$ e $\ce{B}$.

- [ ] $\ce{AB}$
- [ ] $\ce{A2B}$
- [ ] $\ce{AB2}$
- [x] $\ce{A2B3}$
- [ ] $\ce{A3B2}$

---

#### Determine o grupo da Tabela Periódica de $\ce{A}$ identificando o maior salto na energia de ionização.

Para $\ce{A}$, há um grande salto da terceira para a quarta energia de ionização, indicando que o quarto elétron foi retirado de uma camada inferior. $\ce{A}$ tem três elétrons em sua camada de valência e pertence ao Grupo 13 (alumínio). 

#### Determine o grupo da Tabela Periódica de $\ce{B}$ identificando o maior salto na energia de ionização.

Para $\ce{B}$, há um grande salto da sexta para a sétima energia de ionização, indicando que o sétimo elétron foi retirado de uma camada inferior. $\ce{B}$ tem seis elétrons em sua camada de valência e pertence ao Grupo 16 (enxofre).

#### Identifique o composto formado entre $\ce{A}$ e $\ce{B}$.

Para atingir a configuração do gás nobre, $\ce{A}$ deve perder três elétrons formando o cátion $\ce{A^{3+}}$ e $\ce{B}$ deve ganhar dois elétrons para formar o ânion $\ce{B^{2-}}$. 

O composto iônico formado por $\ce{A^{3+}}$ e $\ce{B^{2-}}$ é o $\boxed{\ce{A2B3}}$.
