# DIAGR

O **DIAGR** é uma ferramenta que gera arquivos PDF de avaliações a partir de arquivos escritos em Markdown. Ele possibilita a criação de provas e exercícios complexos, combinando enunciados, gabaritos, fórmulas matemáticas, imagens, tabelas e layouts avançados.

## Interface de Linha de Comando (CLI)

O DIAGR é operado via terminal e permite a diagramação automatizada das avaliações a partir dos arquivos JSON criados.

### Sintaxe de Uso

```bash
diagr [-h] [-l] [-e] [-s] [-c CONFIG_FILE] path
```

#### Descrição dos Argumentos e Opções

- **`path`**  
  Caminho para o arquivo da avaliação. Geralmente, trata-se de um arquivo JSON que contém os dados estruturados da prova.

**Opções:**

- **`-h, --help`**  
  Exibe a mensagem de ajuda e encerra a execução.

- **`-l, --local`**  
  Indica que a diagramação utilizará arquivos locais.

- **`-e, --pdf-exam`**  
  Gera o arquivo `.pdf` do exame.

- **`-s, --pdf-solution`**  
  Gera o arquivo `.pdf` do gabarito.

- **`-c, --config-file CONFIG_FILE`**  
  Especifica o caminho para um arquivo de configuração `.cfg` que permite ajustar opções gerais para a diagramação.
  
  É necessário quando executado em modo não local, pois contém as credenciais e   configurações para acessar a base de dados HedgeDoc.
  
  **Arquivo de configuração padrão:** `defaults.cfg`
    ```ini
    [hedgedoc]
    host = localhost123
    port = 5432
    database = hedgedoc
    user = hedgedoc
    password = password
    ```

## Estrutura do Arquivo JSON

O arquivo JSON contém a estrutura necessária para que o DIAGR possa gerar a diagramação automatizada da avaliação. Abaixo está a descrição detalhada dos campos utilizados.

**Campos principais**

- **`id_`** *(string)*
  - Identificador único da avaliação.
  - Exemplo: "ime"

- **`title`** *(string)*
  - Título da avaliação.
  - Exemplo: "Prova de Etapa 1"

- **`template`** *(string)*
  - Modelo utilizado para a diagramação. Deve ser um dos seguintes valores:
    ```
    {"IME", "ITA", "EN", "AFA", "EFOMM", "ESPCEX", "FLEX", "PENSI", "PROVA", "GABARITO"}
    ```
  - Exemplo: "IME"

- **`affiliation`** *(string)*
  - Instituição responsável ou turma que executará a prova.
  - Exemplo: "EM IME-ITA-1"

- **`date`** *(string)*
  - Ano da avaliação.
  - Exemplo: "2024"

**Estrutura das questões**

- **`problem_set`** *(array de objetos)*
  - Lista das disciplinas e respectivas questões.
  
Cada item do array contém os seguintes campos:
  - **`title`** *(string)*: Nome da disciplina.
    - Exemplo: "Química"
  - **`subject`** *(string)*: Código da disciplina.
    - Exemplo: "qui"
  - **`problems`** *(array de strings)*: Lista de identificadores das questões.
    - Quando executado em modo local, os arquivos Markdown (`.md`) são buscados localmente.
    - Quando executado em modo não local, os identificadores referenciam arquivos na plataforma HedgeDoc.
    - Exemplo:
      ```json
      ["ime_1", "ime_2", "ime_3", "ime_4", "ime_5"]
      ```

**Configurações de Saída**

- **`pdf_exam_name`** *(string)*
  - Nome do arquivo PDF gerado para a prova.
  - Exemplo: "ime.pdf"

- **`pdf_solution_name`** *(string)*
  - Nome do arquivo PDF gerado para o gabarito.
  - Exemplo: "ime_gabarito.pdf"

### Exemplo Completo do Arquivo JSON

```json
{
    "id_": "ime",
    "title": "Prova de Etapa 1",
    "template": "IME",
    "affiliation": "EM IME-ITA-1",
    "date": "2024",
    "problem_set": [
        {
            "title": "Química",
            "subject": "qui",
            "problems": [
                "ime_1",
                "ime_2",
                "ime_3",
                "ime_4",
                "ime_5"
            ]
        }
    ],
    "pdf_exam_name": "ime.pdf",
    "pdf_solution_name": "ime_gabarito.pdf"
}
```

## Estrutura do Arquivo de Questão

Cada questão deve ser escrita em um arquivo Markdown seguindo uma estrutura padronizada. Essa estrutura garante que o DIAGR identifique corretamente o enunciado, o gabarito e os metadados (quando presentes).

### Estrutura Básica da Questão

A estrutura para cada questão é a seguinte:

```markdown
# Título do problema

Enunciado da questão...

---

#### Primeira etapa da solução.

Texto da primeira etapa...

#### Segunda etapa da solução.

Texto da segunda etapa...
```

- **Título (opcional):**  
  Um header de nível 1 (`#`) pode ser usado para identificar a questão. Se não for necessário, pode ser omitido.
  
- **Enunciado:**  
  Texto que descreve o problema.
  
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

**Massa Molar de Elementos.**

```yaml
---
elementos: Cu, Ag, Au
---

Enunciado da questão...
```

**Inclusão de Pacotes LaTeX.**

```yaml
---
usepackage:
  - modiagram
  - circuitikz
---

Enunciado da questão...
```

---

## DIAGR Markdown: guia de sintaxe básica

Esta seção explica em detalhes os elementos da sintaxe Markdown suportada pelo DIAGR, permitindo que usuários sem experiência prévia possam criar questões complexas.

### Parágrafos e Quebras de Linha

**Parágrafos:**  

Escreva o texto de forma contínua. Para iniciar um novo parágrafo, insira uma linha em branco.

```markdown
Este é o primeiro parágrafo.

Este é o segundo parágrafo.
```

A partir da versão **2025**, caracteres Unicode como α, β, π, ✓, podem ser incluídos diretamente no texto!

### Fórmulas e equações matemáticas

Você pode incluir fórmulas matemáticas tanto em formato inline quanto em destaque:

#### Equação em linha

Utilize `$ ... $` para fórmulas no meio do texto.
  
```markdown
A famosa fórmula de Einstein é $E = mc^2$.
```

#### Equação em destaque

Utilize `$$ ... $$` para fórmulas centralizadas.

```markdown
$$
  \int_{a}^{b} f(x) \, dx = F(b) - F(a)
$$
```

A partir da versão **2025**, caracteres Unicode como α, β, π, ✓, podem ser incluídos diretamente no texto!

```markdown
$$
  ΔS = ∫ δQᵣ/T
$$
```

É diagramado como:

$$
    ΔS = ∫ δQᵣ/T
$$

### Listas

O Markdown suporta diversos estilos de listas. A seguir, são apresentados alguns tipos comuns:

#### Listas Não Ordenadas

Utilize `-` ou `*` para itens simples:

```markdown
- Item 1
- Item 2
```

#### Listas Ordenadas (Numéricas)

Utilize números seguidos de ponto:

```markdown
1. Primeiro item
2. Segundo item
```

#### Listas Ordenadas com Letras

Utilize letras seguidas de ponto. Insira dois espaços após o marcador para uma formatação adequada:

```markdown
a.  Item A  
b.  Item B  
c.  Item C
```

#### Listas Ordenadas com Números Romanos

Utilize numerais romanos seguidos de ponto, com dois espaços após o marcador:

```markdown
I.  Primeiro item  
II. Segundo item  
III. Terceiro item
```

### Imagens

Para inserir imagens, utilize a sintaxe padrão do Markdown:

```markdown
![](caminho/para/imagem.png){width=95%}
```

- O atributo `{width=95%}` é opcional e ajusta a largura da imagem.

### Tabelas

Crie tabelas utilizando pipes (`|`) e hifens (`-`):

```markdown
| Cabeçalho 1 | Cabeçalho 2 | Cabeçalho 3 |
| ----------- | ----------- | ----------- |
| Dado 1      | Dado 2      | Dado 3      |
| Dado 4      | Dado 5      | Dado 6      |
```

### Blocos de referência textual

Block quotes são usados para destacar trechos de texto, como citações ou excertos. No DIAGR, esses blocos podem incluir uma contagem de linhas (conforme a configuração do tema):

```markdown

:::text

### Título do texto

Este é um exemplo de block quote. Cada linha do block quote pode ser numerada ou formatada para destacar o conteúdo.

> Clarice Lispector

:::

```

## DIAGR Markdown: guia de sintaxe avançada

### Blocos de código LaTeX

Blocos de código permitem inserir trechos de LaTeX diretamente. O conteúdo dos blocos é ignorado pela ferramenta de conversão e inserido diretamente no arquivo `.tex` para compilação.

```markdown
Uma figura tikz:

~~~latex
\begin{tikzpicture}[scale=1]
  \draw[->] (0,0) -- (3,0) node[right] {$x$};
  \draw[->] (0,0) -- (0,3) node[above] {$y$};
  
  \draw (0,0) circle (1cm);

  \draw[->, red, thick] (0,0) -- (2,2) node[midway, above, sloped] {$\vec{v}$};
\end{tikzpicture}
~~~
```

Você pode incluir esse bloco diretamente em seu arquivo Markdown para que o DIAGR processe e renderize a figura no documento final.

### Ambientes em Colunas

O DIAGR suporta layouts com colunas para organizar conteúdo lado a lado, útil para combinar imagens, listas e textos:

```markdown
:::::::::::::: {.columns}

::: {.column width=35%}
![](NH3_vapor_cycle.svg){width=95%}
:::

::: {.column width=65%}
- **Etapa 0-1:** Descrição da etapa.
- **Etapa 1-2:** Descrição da etapa.
:::

::::::::::::::
```

- **Notas:**
  - O bloco `:::::::::::::: {.columns}` inicia o ambiente de colunas.
  - Cada coluna é definida com `::: {.column width=XX%}`, onde o valor `width` determina a largura relativa da coluna.

---
