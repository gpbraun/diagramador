Os amino-ácidos são os tijolos de construção das moléculas de proteínas, que são moléculas com longas cadeias. Eles são oxidados, no organismo, a ureia, $\ce{H2NCONH2}$, dióxido de carbono e água líquida. O amino-ácido mais simples é a glicina:
$$
    \chemname{\chemfig{H_2N-[1]-[-1](=[-3]O)-[1]OH}}{glicina}
$$

A taxa de oxidação de glicina no corpo humano é cerca de $\pu{100 mg}$ por quilo de massa corporal por dia. Considere a oxidação diária de glicina em uma pessoa de $\pu{75 kg}$. A temperatura corporal é $\pu{37 \degree C}$.

a. **Apresente** a reação de oxidação da glicina no organismo.
b. **Determine** a entalpia padrão da oxidação diária de glicina.
c. **Determine** a entropia padrão da oxidação diária de glicina.
d. **Determine** a entropia padrão da vizinhança da oxidação diária de glicina.

Considere os dados em $\pu{37 \degree C}$:

|                                                                         | $\ce{O2(g)}$ | $\ce{H2O(l)}$ | $\ce{CO2(g)}$ | $\ce{ureia(s)}$ | $\ce{glicina(s)}$ |
| :---------------------------------------------------------------------- | -----------: | ------------: | ------------: | --------------: | ----------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |              |   $\pu{-286}$ |   $\pu{-394}$ |     $\pu{-334}$ |       $\pu{-533}$ |
| Entropia padrão molar, $S_\mathrm{m}^\circ/{\pu{J//K.mol}}$             |   $\pu{205}$ |     $\pu{70}$ |    $\pu{214}$ |      $\pu{105}$ |        $\pu{105}$ |

---

#### **(a)** Balanceie a reação de oxidação da glicina.

$$
    \ce{ NH2CH2COOH(s) + 3/2 O2(g) -> 1/2 H2NCONH2(s) + 3/2 CO2(g) + 3/2 H2O(l) }
$$

#### **(b)** Calcula a massa de glicina oxidada em um dia.

$$
    m_\text{glicina} = (\pu{100 mg//kg}) \times (\pu{75 kg}) = \pu{7,5 g}
$$

#### **(b)** Converta a massa de glicina em quantidade usando a massa molar.

De $n = m/M$,
$$
    n_\text{glicina}
        = \dfrac{ m_\text{glicina} }{ M_\text{glicina} }
        = \dfrac{ \pu{7,5 g} }{ \pu{75 g//mol} } = \pu{0,1 mol}
$$

#### Calcule a entalpia molar de oxidação da glicina.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{r}^\circ 
        = \dfrac{1}{2} \Delta H^\circ_{\mathrm{f}, \ce{ureia(s)}} 
        + \dfrac{3}{2} \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        + \dfrac{3}{2} \Delta H^\circ_{\mathrm{f}, \ce{H2O(l)}}
        - \Delta H^\circ_{\mathrm{f}, \ce{glicina(s)}}
$$
logo,
$$
   \Delta H_\mathrm{r}^\circ
        = \left\{ \dfrac{1}{2} (\pu{-334}) + \dfrac{3}{2} (\pu{-394}) + \dfrac{3}{2} (\pu{-286})  - (\pu{-533}) \right\}\,\pu{kJ//mol} \\
        = \pu{-654 kJ.mol-1}
$$

#### Calcule a entalpia de oxidação de $\pu{0,1 mol}$ de glicina.

$$
    \Delta H 
        = n \Delta H_\mathrm{r}^\circ
        = (\pu{0,1 mol}) \times (\pu{-654 kJ//mol})
        = \boxed{ \pu{-65 kJ} }
$$

#### **(c)** Calcule a entropia molar de oxidação da glicina.

De $\Delta S_\mathrm{r}^\circ = \sum_\text{produtos} n S^\circ_\mathrm{m} - \sum_\text{reagentes} n S^\circ_\mathrm{m}$,
$$
   \Delta S_\mathrm{r}^\circ 
        = \dfrac{1}{2} S^\circ_{\mathrm{m}, \ce{ureia(s)}} 
        + \dfrac{3}{2} S^\circ_{\mathrm{m}, \ce{CO2(g)}} 
        + \dfrac{3}{2} S^\circ_{\mathrm{m}, \ce{H2O(l)}}
        - S^\circ_{\mathrm{m}, \ce{glicina(s)}}
        - \dfrac{3}{2} S^\circ_{\mathrm{m}, \ce{O2(g)}}
$$
logo,
$$
   \Delta S_\mathrm{r}^\circ
      = \left\{ \dfrac{1}{2} (\pu{105}) + \dfrac{3}{2} (\pu{214}) + \dfrac{3}{2} (\pu{70})  - (\pu{105}) - \dfrac{3}{2} (\pu{205}) \right\}\,\pu{J//K.mol} \\
      = \pu{+66 J.K-1.mol-1}
$$

#### Calcule a entropia de oxidação de $\pu{0,1 mol}$ de glicina.

$$
    \Delta S^\circ 
        = n \Delta S_\mathrm{r}^\circ
        = (\pu{0,1 mol}) \times (\pu{+66 J//K.mol})
        = \boxed{ \pu{+6,6 J.K-1} }
$$

#### **(d)** Calcule a variação de entropia da vizinhança.

$$
    \Delta S_\mathrm{viz} 
        = \dfrac{\Delta H}{T}
        = - \dfrac{ (\pu{-65 kJ}) }{ \pu{310 K} } = \boxed{ \pu{+210 J.K-1} }
$$
