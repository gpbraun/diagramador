Quando um hidrocarboneto desconhecido reage com cloro, ocorre a reação de substituição de um dos átomo de hidrogênio da molécula por um átomo de cloro. Nessa reação, foram formados apenas dois produtos clorados,  possuindo $\pu{29,5}\%$ de cloro em massa.

a. **Determine** a massa molar do hidrocarboneto.
b. **Determine** a fórmula molecular do hidrocarboneto.
b. **Apresente** a estrutura de todos os isômeros desse hidrocarboneto.
c. **Determine** a estrutura do hidrocarboneto e dos produtos clorados.

---

#### **(a)** Calcule a massa molar dos produtos clorados, $\ce{PC}$.

Cada molécula de produto clorado possui apenas um átomo de cloro.

De $f_{\ce{Cl}} = M_{\ce{Cl}}/M_{\ce{PC}}$
$$
    M_{\ce{PC}} 
        = \dfrac{ M_{\ce{Cl}} }{ f_{\ce{Cl}} }
        = \dfrac{ \pu{35,5 g//mol} }{ \pu{0,295} } 
        = \pu{120,5 g.mol-1}
$$

#### Calcule a massa molar do hidrocarboneto, $\ce{HC}$.

Na reação de cloração, o hidrocarboneto perde um átomo de hidrogênio e ganha um átomo de cloro:
$$
    M_{\ce{HC}} 
        = M_{\ce{PC}} - M_{\ce{Cl}} + M_{\ce{H}}
        = \Big\{ (\pu{120,5}) - (\pu{35,5}) + (\pu{1}) \Big\} \,\pu{g//mol}
        = \boxed{ \pu{86 g.mol-1} }
$$

#### **(b)** Para determinar a fórmula molecular de um hidrocarboneto a partir de sua massa molar verifique o número máximo de carbonos possível. A massa molar restante é referente aos hidrogênios. Se a fórmula molecular obtida não for plausível, diminua o número de carbonos.

O número máximo de carbonos é 7. Nesse caso a fórmula molecular seria $\ce{C7H2}$, que não corresponde a nenhuma estrutura plausível. Se o número de carbonos for 6 a fórmula molecular seria $\ce{C6H14}$, compatível com a fórmula molecular de um alcano.

Assim, a fórmula molecular do hidrocarboneto é $\boxed{ \ce{C6H14} }$

#### **(c)** Apresente a estrutura de todos os isômeros com fórmula molecular $\ce{C6H14}$. Comece com as cadeias mais longas e diminua o tamanho da cadeia principal adicionando as ramificações.

Existem 5 isômeros constitucionais com fórmula molecular $\ce{C6H14}$:

```latex
\chemfig{-[1]-[-1]-[1]-[-1]-[1]}
\qquad
\chemfig{-[1](-[3])-[-1]-[1]-[-1]}
\qquad
\chemfig{-[1]-[-1](-[-3])-[1]-[-1]}
\qquad
\chemfig{-[1](-[4])(-[2])-[-1]-[1]}
\qquad
\chemfig{-[1](-[3])-[-1](-[-3])-[1]}
```

Nenhum dos compostos possui estereoisômeros.

#### **(d)** Determine a estrutura do hidrocarboneto identificando o único isômero constitucional que leva a formação de apenas dois produtos clorados.

O hidrocarboneto é o 2,3-dimetilbutano:

```latex
\schemestart
    \chemfig{-[1](-[3])-[-1](-[-3])-[1]}
    \arrow{->[\ce{Cl2}]}
    \chemfig{-[1](-[4])(-[2]Cl)-[-1](-[-3])-[1]}
    \arrow{0}[,0]
    \+
    \arrow{0}[,0]
    \chemfig{-[1](-[3])-[-1](-[-3])-[1]-[-1]Cl}
\schemestop
```
