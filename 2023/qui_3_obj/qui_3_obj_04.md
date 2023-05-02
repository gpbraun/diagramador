**Assinale** a alternativa com o número total de isômeros (constitucionais e estereoisômeros) com fórmula molecular $\ce{C3H7N}$.

- [ ] 12
- [ ] 13
- [ ] 14
- [x] 15
- [ ] 16

---

#### Escreva as aminas de cadeia aberta.

```latex
\schemestart
\chemfig{=^[1]-[-1]-[1]NH_2}
\qquad
\chemfig{-[1]=^[-1]-[1]NH_2}
\qquad
\chemfig{(-[3])=^[-1]-[1]NH_2}
\qquad
\chemfig{-[1](=[3,,,,fix])-[-1]NH_2}
\qquad
\chemfig{=^[1]-[-1]\chembelow{N}{H}-[1]}
\schemestop
```

#### Escreva as iminas de cadeia aberta.

```latex
\schemestart
\chemfig{-[1]-[-1]=^[1]N-[-1]H}
\qquad
\chemfig{-[1]-[-1]=^[1]N-[3]H}
\qquad
\chemfig{-[1]=^[-1]N-[1]}
\qquad
\chemfig{-[1]=^[-1]N-[-3]}
\qquad
\chemfig{-[1](-[3])=^[-1]N-[1]H}
\schemestop
```

#### Escreva as aminas de cadeia fechada.

```latex
\schemestart
\chemfig{*4(-\chembelow{N}{H}---)}
\qquad
\chemfig{*3(-(-NH_2)--)}
\qquad
\chemfig{*3(-(<[,,,,cap=butt])-N(-H)-)}
\qquad
\chemfig{*3(-(<:[,,,,cap=butt])-N(-H)-)}
\qquad
\chemfig{*3(-N(-[,,,,cap=butt])--)}
\schemestop
```
