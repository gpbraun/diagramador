# DIAGR – Documentação Completa

O **DIAGR** é uma ferramenta que gera arquivos PDF de avaliações a partir de arquivos escritos em Markdown. Ele possibilita a criação de provas e exercícios complexos, combinando enunciados, gabaritos, fórmulas matemáticas, imagens, tabelas e layouts avançados. Esta documentação cobre:

1. [Interface de Linha de Comando (CLI)](#interface-de-linha-de-comando-cli)
2. [Estrutura do Arquivo de Questão](#estrutura-do-arquivo-de-questão)
3. [Guia de Sintaxe Markdown](#guia-de-sintaxe-markdown)

---

## Interface de Linha de Comando (CLI)

O DIAGR é operado via terminal e permite a diagramação automatizada das avaliações a partir dos arquivos que você criar.

### Sintaxe de Uso

```bash
diagr [-h] [-c CONFIG_FILE] [-l] [-e] [-s] path
```

### Descrição dos Argumentos e Opções

- **Posicional:**
  - **path**  
    Caminho para o arquivo da avaliação. Geralmente, trata-se de um arquivo JSON que contém os dados estruturados da prova.

- **Opções:**
  - **`-h, --help`**  
    Exibe esta mensagem de ajuda e encerra a execução.
  - **`-c, --config-file CONFIG_FILE`**  
    Especifica o caminho para um arquivo de configuração (.cfg) que permite ajustar opções personalizadas para a diagramação.
  - **`-l, --local`**  
    Indica que a diagramação utilizará arquivos locais.
  - **`-e, --pdf-exam`**  
    Gera o arquivo PDF do exame.
  - **`-s, --pdf-solution`**  
    Gera o arquivo PDF do gabarito.

---

## Estrutura do Arquivo de Questão

Cada questão deve ser escrita em um arquivo Markdown seguindo uma estrutura padronizada. Essa estrutura garante que o DIAGR identifique corretamente o enunciado, o gabarito e os metadados (quando presentes).

### Estrutura Básica da Questão

A estrutura recomendada para cada questão é a seguinte:

```markdown
# Título do problema (opcional)

Enunciado

---

Gabarito

#### Primeira etapa do gabarito (formata automaticamente como “Etapa 1: …”)

Texto da primeira etapa

#### Segunda etapa do gabarito

Texto da segunda etapa
```

- **Título (opcional):**  
  Um header de nível 1 (`#`) pode ser usado para identificar a questão. Se não for necessário, pode ser omitido.
  
- **Enunciado:**  
  Texto que descreve o problema. Aqui você pode utilizar:
  - Texto explicativo (inclusive com caracteres Unicode como “α”, “β”, “π”, “✓”, “✔”, etc.)
  - Equações e fórmulas (usando LaTeX inline ou em blocos)
  - Imagens, tabelas, listas, block quotes e ambientes em colunas.
  
- **Linha Horizontal (`---`):**  
  Esta linha é **exclusiva** para separar o enunciado do gabarito.
  
- **Gabarito:**  
  Seção que contém a solução da questão, organizada em etapas. Cada etapa deve iniciar com um header de nível 4 (`####`), que o DIAGR formata automaticamente como “Etapa 1:”, “Etapa 2:”, etc.

### Questões Objetivas

Para questões objetivas, defina as alternativas utilizando caixas de seleção:

```markdown
Enunciado

- [ ] Alternativa A
- [x] Alternativa B
- [ ] Alternativa C
- [ ] Alternativa D
- [ ] Alternativa E
```

> **Atenção:** Se mais de uma alternativa for marcada como correta (ou seja, se houver mais de um `[x]`), a questão será considerada **anulada** no gabarito.


### Metadados Suportados

Os metadados são opcionais e devem ser inseridos no início do arquivo, delimitados por três traços (`---`). Atualmente, são suportados dois tipos:

1. **Massa Molar de Elementos (para provas de Química):**

```yaml
---
elementos: C, H, O
---
```

2. **Inclusão de Pacotes LaTeX (disponíveis no CTAN):**

```yaml
---
usepackage:
  - modiagram
  - circuitikz
---
```

---

## Guia de Sintaxe Markdown

Esta seção explica em detalhes os elementos da sintaxe Markdown suportada pelo DIAGR, permitindo que usuários sem experiência prévia possam criar questões complexas.

### 1. Cabeçalhos

Utilize os símbolos `#` para criar títulos e seções:

```markdown
# Título Principal (opcional)
```

### 2. Parágrafos e Quebras de Linha

- **Parágrafos:**  
  Escreva o texto de forma contínua. Para iniciar um novo parágrafo, insira uma linha em branco.

  ```markdown
  Este é o primeiro parágrafo.
  
  Este é o segundo parágrafo.
  ```

### 3. Linha Horizontal

Utilize três ou mais traços para criar uma linha horizontal, que no DIAGR é usada **exclusivamente** para separar o enunciado do gabarito.

```markdown
---
```

### 4. Blocos de Código para LaTeX (incluindo TikZ)

Blocos de código permitem inserir trechos de LaTeX diretamente, possibilitando a inclusão de figuras e gráficos via TikZ.

- **Exemplo Básico de Equação com TikZ:**

  ```latex
  \begin{tikzpicture}[scale=1]
    % Eixos
    \draw[->] (0,0) -- (3,0) node[right] {$x$};
    \draw[->] (0,0) -- (0,3) node[above] {$y$};
    
    % Círculo centrado na origem
    \draw (0,0) circle (1cm);
    
    % Seta diagonal
    \draw[->, red, thick] (0,0) -- (2,2) node[midway, above, sloped] {$\vec{v}$};
  \end{tikzpicture}
  ```

Neste exemplo, o bloco de código em LaTeX renderiza um diagrama simples com:
- Eixos \(x\) e \(y\)
- Um círculo centrado na origem
- Uma seta diagonal vermelha representando um vetor

Você pode incluir esse bloco diretamente em seu arquivo Markdown para que o DIAGR processe e renderize a figura no documento final.

### 5. Tipos de Listas

O Markdown suporta diversos estilos de listas. A seguir, são apresentados alguns tipos comuns:

#### 5.1 Listas Não Ordenadas

Utilize `-` ou `*` para itens simples:

```markdown
- Item 1
- Item 2
```

#### 5.2 Listas Ordenadas (Numéricas)

Utilize números seguidos de ponto:

```markdown
1. Primeiro item
2. Segundo item
```

#### 5.3 Listas Ordenadas com Letras

Utilize letras seguidas de ponto. Insira dois espaços após o marcador para uma formatação adequada:

```markdown
a.  Item A  
b.  Item B  
c.  Item C
```

#### 5.4 Listas Ordenadas com Números Romanos

Utilize numerais romanos seguidos de ponto, com dois espaços após o marcador:

```markdown
I.  Primeiro item  
II. Segundo item  
III. Terceiro item
```

### 6. Imagens

Para inserir imagens, utilize a sintaxe padrão do Markdown:

```markdown
![](caminho/para/imagem.svg){width=95%}
```

- O atributo `{width=95%}` é opcional e ajusta a largura da imagem.

### 7. Tabelas

Crie tabelas utilizando pipes (`|`) e hifens (`-`):

```markdown
| Cabeçalho 1 | Cabeçalho 2 | Cabeçalho 3 |
| ----------- | ----------- | ----------- |
| Dado 1      | Dado 2      | Dado 3      |
| Dado 4      | Dado 5      | Dado 6      |
```

### 8. Ambientes em Colunas

O DIAGR suporta layouts com colunas para organizar conteúdo lado a lado, útil para combinar imagens, listas e textos:

```markdown
:::::::::::::: {.columns}

::: {.column width=35%}
![](NH3_vapor_cycle.svg){width=95%}
:::

::: {.column width=65%}
- **Etapa 0–1:** Descrição da etapa.
- **Etapa 1–2:** Descrição da etapa.
:::

::::::::::::::
```

- **Notas:**
  - O bloco `:::::::::::::: {.columns}` inicia o ambiente de colunas.
  - Cada coluna é definida com `::: {.column width=XX%}`, onde o valor `width` determina a largura relativa da coluna.

### 9. Block Quotes

Block quotes são usados para destacar trechos de texto, como citações ou excertos. No DIAGR, esses blocos podem incluir uma contagem de linhas (conforme a configuração do tema):

```markdown
> Este é um exemplo de block quote.
> Cada linha do block quote pode ser numerada ou formatada para destacar o conteúdo.
```

- O caractere `>` inicia a citação em bloco.

### 10. Fórmulas Matemáticas e Uso de Unicode

Você pode incluir fórmulas matemáticas tanto em formato inline quanto em destaque:

- **Inline:**  
  Utilize `$ ... $` para fórmulas no meio do texto.
  
  ```markdown
  A famosa fórmula de Einstein é $E = mc²$, onde $c \approx 3×10⁸ \, \text{m/s}$.
  ```

- **Display:**  
  Utilize `$$ ... $$` para fórmulas centralizadas.
  
  ```markdown
  $$
  \int_{a}^{b} f(x) \, dx = F(b) - F(a)
  $$
  ```

**Uso de Unicode:**  
Tanto o texto quanto as equações podem conter caracteres Unicode, permitindo a utilização de símbolos como:
- Letras gregas: α, β, γ, Δ, Ω
- Símbolos matemáticos: √, ∑, ∏, ≠, ≤, ≥
- Outros caracteres especiais: ✓, ✔, ©, ®

Certifique-se de que o arquivo esteja salvo com codificação UTF-8 para que todos os caracteres sejam renderizados corretamente.
