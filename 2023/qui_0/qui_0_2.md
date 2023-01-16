Nos mamíferos, o metabolismo gera subprodutos nocivos, como o peróxido de hidrogênio, os íons superóxido e radicais contendo oxigênio, designados pelo termo genérico *espécies reativas de oxigênio*. A glutationa (GSH) é um tripeptídeo importante, pois atua como potente antioxidante. O grupo tiol atua como alvo dos agentes oxidantes, perdendo um átomo de hidrogênio e formando uma ligação dissulfeto com outra molécula de GSH. Você está investigando maneiras de proteção contra o estresse oxidativo e precisa saber mais sobre a química desse composto essencial.
$$
    \chemname{
        \chemfig{
            HOOC-[-1]
                (-[-3]NH_2)
            -[1]
            -[-1]
            -[1]
                (=[3,,,,fix]O)
            -[-1]\chembelow{N}{H}
            -[1]
                (-[3]-[1]HS)
            -[-1]
                (=[-3,,,,fix]O)
            -[1]\chemabove{N}{H}
            -[-1]
            -[1]COOH
        }
    }{Glutationa (GSH)}
$$

Os valores de $\mathrm{p}K_\mathrm{a}$ da glutationa são $\mathrm{p}K_\mathrm{a1} = \pu{2,12}$ e $\mathrm{p}K_\mathrm{a2} = \pu{3,59}$ para a desprotonação sucessiva dos dois grupos $\ce{COOH}$, $\mathrm{p}K_\mathrm{a3} = \pu{8,75}$ para o grupo $\ce{NH2}$ e $\mathrm{p}K_\mathrm{a4} = \pu{9,65}$ para o grupo $\ce{SH}$. 

a. **Identifique** as funções orgânicas presentes na glutationa.
b. **Identifique** os produtos de hidrólise completa da glutationa.
c. **Determine** o número de estereoisômeros da glutationa.
d. **Determine** a forma predominante de GSH no $\mathrm{pH}$ fisiológico, $\pu{7,4}$.

---

**a.** Ácido carboxílico, amina, amida e tiol.

**b.** A glutationa sofre hidrólise dos gurpos amida, que é convertido em um grupo ácido carboxílico e um grupo amina.
$$
    \chemfig{
        HOOC-[-1]
            (-[-3]NH_2)
        -[1]
        -[-1]
        -[1]
            (=[3,,,,fix]O)
        -[-1]OH
    }
    \quad
    +
    \quad
    \chemfig{
        H_2N
        -[1]
            (-[3]-[1]SH)
        -[-1]
            (=[-3,,,,fix]O)
        -[1]OH
    }
    \quad
    +
    \quad
    \chemfig{
        H_2N
        -[-1]
        -[1]COOH
    }
$$

**c.** A glutationa possui dois carbonos quirais e, portanto, $2^2 = 4$ estereoisômeros.
$$
    \chemfig{
        HOOC-[-1]
            (-[-3]NH_2)
        -[1]
            (-[3,0.3,,,draw=none]{\color{red}\Large\star})
        -[-1]
        -[1]
            (=[3,,,,fix]O)
        -[-1]\chembelow{N}{H}
        -[1]
             (-[1,0.3,,,draw=none]{\color{red}\Large\star})
            (
                -[3]
                -[1]SH
            )
        -[-1]
            (=[-3,,,,fix]O)
        -[1]\chemabove{N}{H}
        -[-1]
        -[1]COOH
    }
$$

**d.** Em $\mathrm{pH} = \pu{7,4}$, os grupos com $\mathrm{p}K_\mathrm{a} < \pu{7,4}$ estarão desprotonados e os grupos com $\mathrm{p}K_\mathrm{a} > \pu{7,4}$ estarão protonados.
$$
    \chemfig{
        \chemabove{O}{\ominus}
        -[1]
            (=[3,,,,fix]O)
        -[-1]
            (-[-3]\chembelow{N}{\oplus}H_3)
        -[1]
        -[-1]
        -[1]
            (=[3,,,,fix]O)
        -[-1]\chembelow{N}{H}
        -[1]
            (
                -[3]
                -[1]\chemabove{S}{\oplus}H_2
            )
        -[-1]
            (=[-3,,,,fix]O)
        -[1]\chemabove{N}{H}
        -[-1]
        -[1]
            (=[3,,,,fix]O)
        -[-1]\chemabove{O}{\ominus}
    }
$$
