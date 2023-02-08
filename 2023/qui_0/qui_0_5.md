---
elementos: Fe
---

Em uma estação de tratamento de água deseja-se medir a concentração de íons ferro(II). O ferro(II) reage com 1,10-fenantrolina, $\ce{phen}$, para formar o complexo vermelho ferroína, $\ce{Fe(phen)3^{2+}}$, cuja concentração pode ser determinada por espectrofotometria. Entretanto, em solução ácida o complexo se decompões conforma a reação
$$
    \ce{ Fe(phen)3^{2+}(aq) + 3 H3O^+(aq) -> Fe^{2+}(aq) + 3 Hphen^+(aq) + 3 H2O(l) }
$$
Os experimentos a seguir foram realizados em $\pu{40 \degree C}$.

| **Exp.** | $\ce{[Fe(phen)3^{2+}]}/\pu{M}$ | $\ce{[H2O]}/\pu{M}$ | $v_0/{\pu{mM.s-1}}$ |
| :------: | :----------------------------: | :-----------------: | :-----------------: |
|  **1**   |         $\pu{7,50e-3}$         |     $\pu{0,50}$     |    $\pu{9,0e-3}$    |
|  **2**   |         $\pu{7,50e-3}$         |     $\pu{0,05}$     |    $\pu{9,0e-3}$    |
|  **3**   |         $\pu{3,75e-2}$         |     $\pu{0,05}$     |    $\pu{4,5e-2}$    |

A constante de velocidade desse processo em $\pu{70 \degree C}$ é $\pu{8,5e-2 s-1}$.


a. (Valor: $\pu{0,8}$) **Determine** a constante de velocidade da reação em $\pu{40 \degree C}$.
b. (Valor: $\pu{0,8}$) **Determine** a energia de ativação da reação.
c. (Valor: $\pu{0,4}$) **Determine** o tempo de meia-vida da reação em $\pu{25 \degree C}$.

---

**a.** A lei de velocidade é da forma:
$$
    v = k \ce{[Fe(phen)3^{2+}]}^a \ce{[H2O]}^b
$$

Cálculo da ordem em $\ce{Fe(phen)3^{2+}}$. Comparando os experimentos **1** e **3**:
$$
    \dfrac{ v_{0, 3} }{ v_{0, 1} }
        = \dfrac{ \pu{4,5e-5} }{ \pu{9,0e-6} }
        = \left( \dfrac{ \pu{3,75e-2} }{ \pu{7,50e-3} } \right)^a
$$
logo, $a = 1$.

Cálculo da ordem em $\ce{H2O}$. Comparando os experimentos **1** e **2**:
$$
    \dfrac{ v_{0, 2} }{ v_{0, 1} }
        = \dfrac{ \pu{9,0e-6} }{ \pu{9,0e-6} }
        = \left( \dfrac{ \pu{0,50} }{ \pu{0,05} } \right)^b
$$
logo, $b = 0$.

Do experimento **1**:
$$
    \pu{9,0e-6 M//s} = k (\pu{7,50e-3 M})^1
$$
logo,
$$
    k = \boxed{ \pu{1,2e-3 s-1} }
$$

**b.** Da equação de Arrhenius:
$$
    \ln \left( \frac{k_2}{k_1} \right) 
        = -\dfrac{E_\mathrm{a}}{R} \left( \frac{1}{T_2} - \frac{1}{T_1} \right)
$$
substituindo as constantes cinética a $\pu{40 \degree C}$ e a $\pu{70 \degree C}$:
$$
    \ln \left( \frac{ \pu{8,5e-2 s-1} }{ \pu{1,2e-3 s-1} }\right) 
        = -\dfrac{E_\mathrm{a}}{\pu{8,3e-3 kJ//mol.K}} \left( \frac{1}{ \pu{343 K} } - \frac{1}{ \pu{313 K} } \right)
$$
logo,
$$
    E_\mathrm{a} = \boxed{ \pu{127 kJ.mol-1} }
$$

**c.** Cálculo da constante cinética a $\pu{25 \degree C}$:
$$
    \ln \left( \frac{ k_{\pu{25 \degree C}} }{ \pu{1,2e-3 s-1} } \right) 
        = -\dfrac{ \pu{127 kJ.mol-1} }{\pu{8,3e-3 kJ//mol.K}} \left( \frac{1}{ \pu{298 K} } - \frac{1}{ \pu{313 K} } \right)
$$
logo,
$$
    k_{\pu{25 \degree C}} = \boxed{ \pu{1e-4 s-1} }
$$
A meia vida é dada por $t_{1/2} = \ln 2/k$,
$$
    t_{1/2} 
        = \dfrac{ \ln(2) }{ \pu{2e-9 s-1} }
        = \pu{6900 s}
$$

