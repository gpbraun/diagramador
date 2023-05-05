---
elementos: Br
---

O composto **X**, $\ce{C5H9Br}$, não reage com bromo ou com permanganato de potássio diluído. O tratamento de **X** com potassa alcoólica leva à formação de um único composto, **Y**. Diferente de **X**, **Y** descora a água de bromo e muda a cor de uma solução de permanganato de violeta para marrom. A reação de **Y** com gás hidrogênio e platila forma metilciclobutano. Quando **Y** é tratado com ozônio seguido de zinco metálico, é formado o composto **Z**, $\ce{C5H8O2}$.

**Assinale** a alternativa com a estrutura do composto **X**.

- [x] `\chemfig{*4(-(-)--(-Br)-)}`
- [ ] `\chemfig{*4(--(-[3])(-[0]Br)--)}`
- [ ] `\chemfig{*4(--(-Br)-(-)-)}`
- [ ] `\chemfig{*4(-(-)--(-Br)-)}`
- [ ] `\chemfig{-[1](-[3]Br)-[-1]=^[1]-[-1]}`

---

#### Reação de eliminação

```latex
\begin{chemscheme}
\schemestart
    \chemnameinit{}
    \chemname{\chemfig{*4(-(-)--(-Br)-)}}{\textbf{X}}
    \arrow{->[\ce{KOH}]}[,1.5]
    \chemname{\chemfig{*4(-(-)-=-)}}{\textbf{Y}}
\schemestop
\end{chemscheme}
```

#### Reação de hidrogenação

```latex
\begin{chemscheme}
\schemestart
    \chemnameinit{}
    \chemname{\chemfig{*4(-(-)--(-Br)-)}}{\textbf{Y}}
    \arrow{->[\ce{H2}][\ce{Pt}]}[,1.5]
    \chemname{\chemfig{*4(-(-)---)}}{metilciclobutano}
\schemestop
\end{chemscheme}
```

#### Reação de ozonólise

```latex
\begin{chemscheme}
\schemestart
    \chemnameinit{}
    \chemname{\chemfig{*4(-(-)-=-)}}{\textbf{Y}}
    \arrow{->[1. \ce{O3}][2. \ce{Zn}]}[,1.5]
    \chemname{\chemfig{H-[-1](=[-3,,,,fix]O)-[1]-[-1](-[-3])-[1](=[3,,,,fix]O)-[-1]H}}{\textbf{Z}}
\schemestop
\end{chemscheme}
```
