-----------------------------------------------------------------
-- columns.lua
--
-- Gabriel Braun, 2024
-----------------------------------------------------------------

-----------------------------------------------------------------
-- Funções auxiliares
-----------------------------------------------------------------

local function inline(content_str)
    return pandoc.RawInline('latex', content_str)
end


local function tonumber_ex(str)
    --
    -- Função para conversão de números que funciona com porcentagens.
    --
    -- Retorna: (number) número convertido
    --
    if type(str) ~= "string" then
        return tonumber(str)
    end

    local num = tonumber(str:match("([%d%.]+)"))

    if num then
        if str:match("%%") then
            return num / 100
        else
            return num
        end
    end

    return nil
end

-----------------------------------------------------------------
-- Column
-----------------------------------------------------------------

local function column(elem, width)
    --
    -- Retorna: (Block) Div.
    --

    -- Possibilidades de horizontal
    if elem.attributes.align == "center" then
        elem.content:insert(1,
            inline("\\centering")
        )
    end
    if elem.attributes.align == "left" then
        elem.content:insert(1,
            inline("\\raggedleft")
        )
    end
    if elem.attributes.align == "right" then
        elem.content:insert(1,
            inline("\\raggedright")
        )
    end

    -- Criação do ambiente minipage
    elem.content:insert(1,
        inline("\\begin{minipage}{" .. width .. "\\linewidth}")
    )
    elem.content:insert(
        inline("\\end{minipage}\\igorepar")
    )

    return elem
end

-----------------------------------------------------------------
-- Column Group
-----------------------------------------------------------------

local function column_group(elem)
    --
    -- Retorna: (Block) Div.
    --
    elem.content:insert(1,
        inline "\\begin{center}"
    )
    elem.content:insert(
        inline "\\end{center}"
    )

    local total_width = 0

    -- PRIMEIRO LOOP: Calcula o comprimento total.
    elem.content = elem.content:walk {
        Div = function(div_elem)
            if div_elem.classes:includes("column") then
                -- Width relativo default: 1
                div_elem.attributes.width = tonumber_ex(div_elem.attributes.width) or 1

                -- Atualiza o width total
                total_width = total_width + div_elem.attributes.width
            end
            return div_elem
        end
    }

    -- SEGUNDO LOOP: Formata as colunas.
    elem.content = elem.content:walk {
        Div = function(div_elem)
            if div_elem.classes:includes("column") then
                -- Calcula o tamanho relativo da coluna
                local div_width = div_elem.attributes.width / total_width

                return column(div_elem, div_width)
            else
                return div_elem
            end
        end
    }

    return elem
end

-----------------------------------------------------------------
-- Div
-----------------------------------------------------------------

function Div(elem)
    --
    -- Retorna: (Block) Div.
    --
    if elem.classes:includes("columns") then
        return column_group(elem)
    end

    return elem
end

-----------------------------------------------------------------
-- Export filtros
-----------------------------------------------------------------

return {
    { Div = Div },
}
