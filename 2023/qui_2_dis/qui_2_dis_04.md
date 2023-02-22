Considere a reação a seguir.

```latex
\schemestart
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]Cl}
\arrow{->[\ce{NaCN}][\ce{DMSO}]}[,1.5]
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]CN}
\schemestop
```

A velocidade dessa reação aumenta consideravelmente quando iodeto de sódio, $\ce{NaI}$, é adicionado ao meio reacional. O iodeto de sódio não é formado nem consumido pela reação sendo, portanto, considerado um catalisador.

a. **Proponha** um mecanismo para a reação sem a adição do catalisador.
b. **Explique** como a adição do catalisador aumenta a velocidade da reação.

---

#### **(a)** A reação é de substituição nucleofílica. Verifique se o mecanismo é Sn1 ou Sn2.

Como o reagente é um haleto de alquila primário, a reação ocorre via Sn2.

#### **(b)** O catalisador participa da reação formando um intermediário, que é posteriormente convertido no produto final.

O iodeto é um ânion grande e polarizável e, por isso, é um bom nucleófilo. Quando o iodeto de sódio é adicionado ao meio reacional ocorre a reação de Sn2:

```latex
\schemestart
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]Cl}
\arrow{->[\ce{I^-}]}[,1.5]
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]I}
\schemestop
```

O iodo também é um excelente grupo de saída devido ao seu grande raio iônico. Os grupos cianeto substituem o iodo em outra reação de substituição nucleofílica Sn2:

```latex
\schemestart
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]I}
\arrow{->[\ce{CN^-}]}[,1.5]
\chemfig{-[1]-[-1]-[1]-[-1]-[1]-[-1]CN}
\schemestop
```

