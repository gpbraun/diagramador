**Classifique** cada par de compostos a seguir como enantiômeros, diastereoisômeros, isômeros constitucionais ou representações diferentes de um mesmo composto.

```latex
\definesubmol{x}{(-[6]H)(-[0]OH)}
\definesubmol{y}{(-[0]H)(-[6]HO)}
\raggedright
\qquad
\schemestart
a.
\arrow{0}[,0.2]
\chemfig{[3]CH_2OH-!x-!y-(-[5]H)=[1,,,,fix]O}
\arrow{0}[,0.2]
e
\arrow{0}[,0.2]
\chemfig{[3]CH_2OH-!x-!x-(-[5]H)=[1,,,,fix]O}
\schemestop
```

```latex
\raggedright
\qquad
\schemestart
b.
\arrow{0}[,0.2]
\chemfig{*6(--(<:[,,,,cap=butt]Cl)-(<Cl)---)}
\arrow{0}[,0.2]
e
\arrow{0}[,0.2]
\chemfig{*6(--(<Cl)-(<:[,,,,cap=butt]Cl)---)}
\schemestop
```

```latex
\raggedright
\qquad
\schemestart
c.
\arrow{0}[,0.2]
\chemfig{*6((<Br)--(<Br)----)}
\arrow{0}[,0.2]
e
\arrow{0}[,0.2]
\chemfig{*6(---(<:[,,,,cap=butt]Br)--(<:[,,,,cap=butt]Br)-)}
\schemestop
```

```latex
\raggedright
\qquad
\schemestart
d.
\arrow{0}[,0.2]
\chemfig{
                   (-[-3]CH_3)% 1
      -[:63.4,1.08](-[1]CH_3)% 2
    -[:148.8,1.057]% 3
    -[:207.8,1.122]% 4
    -[:245.4,0.992]% 5
     -[:20.2,1.051]% 6
                      (
        -[:331.8,0.954]% -> 1
                      )
     -[:85.1,2.039]% 7
                      (
              -[:284.2]% -> 3
                      )
}
\arrow{0}[,0.2]
e
\arrow{0}[,0.2]
\chemfig{
                   % 1
      -[:63.4,1.08]% 2
    -[:148.8,1.057]% 3
    -[:207.8,1.122](-[5]H_3C)% 4
    -[:245.4,0.992](-[-3]CH_3)% 5
     -[:20.2,1.051]% 6
                      (
        -[:331.8,0.954]% -> 1
                      )
     -[:85.1,2.039]% 7
                      (
              -[:284.2]% -> 3
                      )
}
\schemestop
```

```latex
\raggedright
\qquad
\schemestart
e.
\arrow{0}[,0.2]
\chemfig{
                   (-[1]CH_3)(-[-3]OH)% 1
      -[:63.4,1.08]% 2
    -[:148.8,1.057]% 3
    -[:207.8,1.122]% 4
    -[:245.4,0.992]% 5
     -[:20.2,1.051]% 6
                      (
        -[:331.8,0.954]% -> 1
                      )
     -[:85.1,2.039]% 7
                      (
              -[:284.2]% -> 3
                      )
}
\arrow{0}[,0.2]
e
\arrow{0}[,0.2]
\chemfig{
                   (-[-3]CH_3)(-[1]OH)% 1
      -[:63.4,1.08]% 2
    -[:148.8,1.057]% 3
    -[:207.8,1.122]% 4
    -[:245.4,0.992]% 5
     -[:20.2,1.051]% 6
                      (
        -[:331.8,0.954]% -> 1
                      )
     -[:85.1,2.039]% 7
                      (
              -[:284.2]% -> 3
                      )
}
\schemestop
```

---

a. Diastereoisômeros
b. Enantiômeros
c. Representações diferentes do mesmo composto.
d. Enantiômeros.
e. Diastereoisômeros
