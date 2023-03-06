A **temperatura adiabática de chama** é a temperatura que resulta de uma combustão completa em pressão constante que ocorre sem qualquer transferência de calor para a vizinhança.

Considere a combustão do octano, $\ce{C8H18}$, em $\pu{25 \degree C}$.

a. **Determine** a temperatura adiabática de chama da combustão com quantidade estequiométrica de oxigênio.
b. **Determine** a temperatura adiabática de chama da combustão com $\pu{300}\%$ de excesso de ar.

| Dados em $\pu{25 \degree C}$                                            | $\ce{C8H18(l)}$ | $\ce{O2(g)}$ | $\ce{N2(g)}$ | $\ce{H2O(g)}$ | $\ce{CO2(g)}$ |
| :---------------------------------------------------------------------- | --------------: | -----------: | -----------: | ------------: | ------------: |
| Entalpia padrão de formação, $\Delta H_\mathrm{f}^\circ/{\pu{kJ//mol}}$ |     $\pu{-250}$ |              |              |   $\pu{-242}$ |   $\pu{-394}$ |
| Capacidade calorífica isobárica, $C_P/{\pu{J//K.mol}}$                  |                 |    $\pu{30}$ |    $\pu{30}$ |     $\pu{40}$ |     $\pu{40}$ |

---

#### Escreva a reação balanceada de combustão do octano formando água gasosa.

$$
    \ce{ C8H18(g) + 25/2 O2(g) -> 8 CO2(g) + 9 H2O(g) }
$$

#### Calcule a entalpia padrão de combustão em $\ce{25 \degree C}$.

De $\Delta H_\mathrm{r}^\circ = \sum_\text{produtos} n \Delta H^\circ_\mathrm{f} - \sum_\text{reagentes} n \Delta H^\circ_\mathrm{f}$,
$$
   \Delta H_\mathrm{c}^\circ 
        = 8 \Delta H^\circ_{\mathrm{f}, \ce{CO2(g)}} 
        + 9 \Delta H^\circ_{\mathrm{f}, \ce{H2O(g)}} 
        - \Delta H^\circ_{\mathrm{f}, \ce{C8H18(l)}}
$$
logo,
$$
   \Delta H_\mathrm{c}^\circ
        = \Big\{ 8 (\pu{-394}) + 9 (\pu{-242}) - (\pu{-250}) \Big\}\,\pu{kJ//mol}
        = \pu{-6718 kJ.mol-1}
$$
A reação de combustão completa é exotérmica, como esperado.

#### Base de cálculo: $\pu{1 mol}$ de $\ce{C8H18}$. Calcula a variação de entalpia total da combustão.

$$
    \Delta H = (\pu{-6718 kJ//mol}) \times (\pu{1 mol}) = \pu{-6718 kJ}
$$

####  **(a)** Quando a queima é adiabática, todo calor liberado na combustão é usado para aquecer os produtos. Use a relação estequiométrica para converter a quantidade de $\ce{C8H18}$ na quantidade de $\ce{CO2}$ e $\ce{H2O}$ formados na reação.

$$
    n_{\ce{CO2}} = \dfrac{8}{1} \times (\pu{1 mol}) = \pu{8 mol}
    \qquad
    n_{\ce{H2O}} = \dfrac{9}{1} \times (\pu{1 mol}) = \pu{9 mol}
$$
Nesse caso não há $\ce{O2}$ ou $\ce{N2}$ ao final da reação.

#### Calcule a capacidade calorífica dos produtos.

De $C_P = \sum n C_{P,m}$,
$$
    C_{P, \text{produtos}} 
        = n_{\ce{CO2}} C_{P,\mathrm{m},\ce{CO2}}
        + n_{\ce{H2O}} C_{P,\mathrm{m},\ce{H2O}}
$$
logo,
$$
    C_{P, \text{produtos}}  
        = \Big\{ (\pu{8} \times \pu{40})
        + (\pu{9} \times \pu{40}) \Big\}\,\pu{J//K}
        = \pu{680 J.K-1}
$$

#### Calcule a temperatura dos produtos após absorverem o calor liberado pela reação.

De $Q_P = C_P \Delta T$,
$$
    \Delta T 
        = \dfrac{ (-\Delta H) }{ C_{P, \mathrm{produtos}} } 
        = \dfrac{ \pu{6718 kJ} }{ \pu{680 kJ//K} }
        = \pu{34 K}
$$
logo,
$$
    T_\text{chama} = \pu{298 K} + \pu{9880 K} = \boxed{ \pu{10178 K} }
$$

####  **(a)** Use a relação estequiométrica para converter a quantidade de $\ce{C8H18}$ na quantidade de $\ce{O2}$ consumida na reação.

$$
    n_{\ce{O2}, \text{consumido}} 
        = \dfrac{25}{2} \times (\pu{1 mol})
        = \pu{12,5 mol}
$$
Para a combustão com $\pu{300}\%$ de excesso de $\ce{O2}$,
$$
    n_{\ce{O2}} 
        = 4 \times (\pu{12,5 mol})
        = \pu{50 mol}
    \qquad
    n_{\ce{O2}, \mathrm{xs}} 
        = 3 \times (\pu{12,5 mol})
        = \pu{72,5 mol}
$$

#### Calcule a quantidade de nitrogênio no ar.

$$
    n_{\ce{N2}} = \dfrac{79}{21} \times (\pu{\pu{50 mol}}) = \pu{200 mol}
$$

#### Calcule a capacidade calorífica dos produtos.

De $C_P = \sum n C_{P,m}$,
$$
    C_{P, \text{saída}}^\prime
        = n_{\ce{O2}, \mathrm{xs}} C_{P,\mathrm{m},\ce{O2}}
        + n_{\ce{N2}} C_{P,\mathrm{m},\ce{N2}}
        + n_{\ce{CO2}} C_{P,\mathrm{m},\ce{CO2}}
        + n_{\ce{H2O}} C_{P,\mathrm{m},\ce{H2O}}
$$
logo,
$$
    C_{P, \text{saída}}^\prime
        = \Big\{ (\pu{72,5} \times \pu{30})
        + (\pu{200} \times \pu{30})
        + (\pu{8} \times \pu{40})
        + (\pu{9} \times \pu{40}) \Big\}\,\pu{J//K}
        = \pu{8855 J.K-1}
$$

#### Calcule a temperatura dos produtos após absorverem o calor liberado pela reação.

De $Q_P = C_P \Delta T$,
$$
    \Delta T^\prime
        = \dfrac{ (-\Delta H) }{ C_{P, \mathrm{produtos}}^\prime } 
        = \dfrac{ \pu{6718 kJ} }{ \pu{8855 kJ//K} }
        = \pu{776 K}
$$
logo,
$$
    T_\text{chama}^\prime = \pu{298 K} + \pu{776 K} = \boxed{ \pu{1074 K} }
$$
