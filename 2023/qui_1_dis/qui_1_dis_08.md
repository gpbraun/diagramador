Pesquisadores da Universidade de Illinois conduziram a reação a seguir que envolve uma desidrogenação e uma reação de Diels-Alder. Usando um catalisador especial, os materiais de partida aquirais são convertidos em quatro produtos estereoisoméricos --- dois majoritários e dois minoritários. Um dos produtos é mostrado a seguir:

```latex
\schemestart
\chemfig{
                           O% 1
                    =[:288]% 2
                    -[:342]% 3
    -[:270,,,,dbr={73}{73}]% 4
                    -[:198]% 5
                              (
                        =[:252]O% 13
                              )
                    -[:126]N% 6
                              (
                         -[:54]% -> 2
                              )
                    -[:180]% 7
             -[:240,,,,drh]% 8
                    -[:180]% 9
             -[:120,,,,drh]% 10
                     -[:60]% 11
                 -[,,,,drh]% 12
                              (
                        -[:300]% -> 7
                              )
}
\arrow(--[yshift=2.4em]){->[\chemfig{-[:270]-[:330,,,,dlh]-[:30]-[:330]-[:30]-[:330]O-[:30](-[:330])=[:90]O}][catalisador]}[,3]
\chemfig{
                 O% 1
          =[:288]% 2
          -[:342]% 3
                    (
               <:[:96,,,,cap=butt]H% 4
                    )
          -[:270]% 5
                    (
              <:[:264,,,,cap=butt]H% 16
                    )
                    (
              -[:198]% 17
                        (
                  =[:252]O% 25
                        )
              -[:126]N% 18
                        (
                  -[:180]% 19
           -[:120,,,,dlh]% 20
                  -[:180]% 21
           -[:240,,,,dlh]% 22
                  -[:300]% 23
               -[,,,,dlh]% 24
                   -[:60]% -> 19
                        )
               -[:54]% -> 2
                    )
          -[:330]% 6
           -[:30]% 7
    -[:90,,,,dlh]% 8
          -[:150]% 9
                    (
              -[:210]% -> 3
                    )
           <[:90]% 10
           -[:30]% 11
           -[:90]O% 12
           -[:30]% 13
                    (
              -[:330]% 14
                    )
           =[:90]O% 15
}
\arrow(--[yshift=-2.4em]){0}[,-0.2]
\+
\arrow{0}[,0]
estereoisômeros
\schemestop
```

A reação também leva à formação de outro produto majoritário, enantiômero do produto apresentado. Além disso, são formados dois outros produtos minoritários, que mantém a conectividade *cis* nos carbonos de ponte do biciclo e possuem configuração diferente no outro carbono quiral.

a. **Apresente** a estrutura do outro produto majoritário.
b. **Apresente** a estrutura dos dois outros produtos minoritários.
c. **Classifique** os dois produtos minoritários quanto à sua estereoquímica.
d. **Classifique** os dois produtos minoritários e majoritários quanto à sua estereoquímica.

---

#### **(a)** O outro produto majoritário é o enantiômero do produto apresentado. Para determinar sua estrutura inverta a configuração de todos os centros quirais do produto apresentado.

```latex
    \chemfig{
                 O% 1
          =[:288]% 2
          -[:342]% 3
                    (
               <[:96]H% 4
                    )
          -[:270]% 5
                    (
              <[:264]H% 16
                    )
                    (
              -[:198]% 17
                        (
                  =[:252]O% 25
                        )
              -[:126]N% 18
                        (
                  -[:180]% 19
           -[:120,,,,dlh]% 20
                  -[:180]% 21
           -[:240,,,,dlh]% 22
                  -[:300]% 23
               -[,,,,dlh]% 24
                   -[:60]% -> 19
                        )
               -[:54]% -> 2
                    )
          -[:330]% 6
           -[:30]% 7
    -[:90,,,,dlh]% 8
          -[:150]% 9
                    (
              -[:210]% -> 3
                    )
           <:[:90,,,,cap=butt]% 10
           -[:30]% 11
           -[:90]O% 12
           -[:30]% 13
                    (
              -[:330]% 14
                    )
           =[:90]O% 15
}
```

#### **(b)** Os produtos minoritários possuem a mesma configuração *cis* nos carbonos de ponte do bicilo. Para determinar o primeiro subproduto inverta a configuração do outro centro quiral. O outro subproduto é o enantiômero do primeiro.

```latex
\chemfig{
                 O% 1
          =[:288]% 2
          -[:342]% 3
                    (
               <:[:96,,,,cap=butt]H% 4
                    )
          -[:270]% 5
                    (
              <:[:264,,,,cap=butt]H% 16
                    )
                    (
              -[:198]% 17
                        (
                  =[:252]O% 25
                        )
              -[:126]N% 18
                        (
                  -[:180]% 19
           -[:120,,,,dlh]% 20
                  -[:180]% 21
           -[:240,,,,dlh]% 22
                  -[:300]% 23
               -[,,,,dlh]% 24
                   -[:60]% -> 19
                        )
               -[:54]% -> 2
                    )
          -[:330]% 6
           -[:30]% 7
    -[:90,,,,dlh]% 8
          -[:150]% 9
                    (
              -[:210]% -> 3
                    )
           <:[:90,,,,cap=butt]% 10
           -[:30]% 11
           -[:90]O% 12
           -[:30]% 13
                    (
              -[:330]% 14
                    )
           =[:90]O% 15
}
\qquad e \qquad
\chemfig{
                O% 1
        =[:288]% 2
        -[:342]% 3
                (
            <[:96]H% 4
                )
        -[:270]% 5
                (
            <[:264]H% 16
                )
                (
            -[:198]% 17
                    (
                =[:252]O% 25
                    )
            -[:126]N% 18
                    (
                -[:180]% 19
        -[:120,,,,dlh]% 20
                -[:180]% 21
        -[:240,,,,dlh]% 22
                -[:300]% 23
            -[,,,,dlh]% 24
                -[:60]% -> 19
                    )
            -[:54]% -> 2
                )
        -[:330]% 6
        -[:30]% 7
-[:90,,,,dlh]% 8
        -[:150]% 9
                (
            -[:210]% -> 3
                )
        <[:90]% 10
        -[:30]% 11
        -[:90]O% 12
        -[:30]% 13
                (
            -[:330]% 14
                )
        =[:90]O% 15
}
```

#### **(c)** Compare a configuração dos carbonos quirais nos dois produtos minoritários.

Os produtos minoritários constituem um par de **enantiômeros**.

#### **(d)** Compare a configuração dos carbonos quirais dos produtos minoritários e majoritários.

Os produtos minoritários e majoritários apresentam configuração diferente de alguns (porém não de todos) os seus centros quirais. Assim, estes são **diastereoisômeros**.
