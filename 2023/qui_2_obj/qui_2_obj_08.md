
Colesterol é um lipídio encontrado nas membranas celulares e transportado no plasma sanguíneo de todos os animais. É um componente essencial das membranas celulares dos mamíferos.

```latex
\chemname{
\chemfig{
                  % 1
           -[:312]% 2
                     (
                -[:12]% 3
                     )
           -[:252]% 4
           -[:192]% 5
           -[:252]% 6
           -[:192]% 7
                     (
               -[:132]% 8
                     )
           -[:252]% 9
           -[:306]% 10
           -[:234]% 11
           -[:162]% 12
            -[:90]% 13
                     (
                -[:18]% -> 9
                     )
                     (
                -[:84]% 28
                     )
           -[:150]% 14
           -[:210]% 15
           -[:270]% 16
           -[:330]% 17
                     (
                -[:30]% -> 12
                     )
           -[:270]% 18
           -[:210]% 19
    -[:150,,,,drh]% 20
            -[:90]% 21
                     (
                -[:30]% -> 16
                     )
                     (
                -[:90]% 27
                     )
           -[:150]% 22
           -[:210]% 23
           -[:270]% 24
                     (
           -[:210,,,2]HO% 26
                     )
           -[:330]% 25
                     (
                -[:30]% -> 20
                     )
}
}{Colesterol}
```

**Assinale** a alternativa com o número de estereoisômeros do colesterol.

- [ ] 32
- [ ] 64
- [ ] 128
- [x] 256
- [ ] 512

---

#### Identifique os centros quirais na estrutura do colesterol.

```latex
\chemfig{
                  % 1
           -[:312]% 2
                     (
                -[:12]% 3
                     )
           -[:252]% 4
           -[:192]% 5
           -[:252]% 6
           -[:192](-[2.5,0.3,,,draw=none]{\color{red}\Large\star})% 7
                     (
               -[:132]% 8
                     )
           -[:252](-[0,0.3,,,draw=none]{\color{red}\Large\star})% 9
           -[:306]% 10
           -[:234]% 11
           -[:162](-[-3,0.3,,,draw=none]{\color{red}\Large\star})% 12
            -[:90](-[-5,0.3,,,draw=none]{\color{red}\Large\star})% 13
                     (
                -[:18]% -> 9
                     )
                     (
                -[:84]% 28
                     )
           -[:150]% 14
           -[:210]% 15
           -[:270](-[-3,0.3,,,draw=none]{\color{red}\Large\star})% 16
           -[:330](-[-1,0.3,,,draw=none]{\color{red}\Large\star})% 17
                     (
                -[:30]% -> 12
                     )
           -[:270]% 18
           -[:210]% 19
    -[:150,,,,drh]% 20
            -[:90](-[-1,0.3,,,draw=none]{\color{red}\Large\star})% 21
                     (
                -[:30]% -> 16
                     )
                     (
                -[:90]% 27
                     )
           -[:150]% 22
           -[:210]% 23
           -[:270](-[1,0.3,,,draw=none]{\color{red}\Large\star})% 24
                     (
           -[:210,,,2]HO% 26
                     )
           -[:330]% 25
                     (
                -[:30]% -> 20
                     )
}
```

#### Quando não há simetria na molécula, o número de estereoisômeros é $2^n$, onde $n$ é o número de centros quirais.

$$
     \text{Número de estereoisômeros} = 2^8 = \boxed{ 256 }
$$


