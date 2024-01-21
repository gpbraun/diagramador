-----------------------------------------------------------------
-- choices.lua
--
-- Gabriel Braun, 2023
-----------------------------------------------------------------

local math = require "math"

-----------------------------------------------------------------
-- Funções auxiliares
-----------------------------------------------------------------

local function latex(block)
    --
    -- Converte um pandoc.Block em latex e html simples.
    --
    local doc = pandoc.Pandoc(block)
    return pandoc.write(doc, 'latex')
end

-----------------------------------------------------------------
-- Extensão da funcionalidade das tabelas
-----------------------------------------------------------------

function table.contains(tbl, element)
    --
    -- Verifica se uma tabela contém um elemento.
    --
    for _, value in pairs(tbl) do
        if value == element then
            return true
        end
    end
    return false
end

function table.shuffle(tbl)
    --
    -- Algorítimo de embaralhamento de Fisher-Yates.
    --
    local new_tbl = {}
    for i = 1, #tbl do
        new_tbl[i] = tbl[i]
    end
    for i = #new_tbl, 2, -1 do
        local j = math.random(i)
        new_tbl[i], new_tbl[j] = new_tbl[j], new_tbl[i]
    end
    return new_tbl
end

function table.maxfreq(tbl)
    --
    -- Retorna a frequência do elemento mais frequente em uma tabela.
    --
    local freqs = {}
    local max_freq = 0
    for _, value in ipairs(tbl) do
        freqs[value] = (freqs[value] or 0) + 1
        max_freq = math.max(max_freq, freqs[value])
    end
    return max_freq
end

-----------------------------------------------------------------
-- Geração automática de alternativas
-----------------------------------------------------------------

local choices = {}
local correct_choice = 0
local separator

local function addChoice(choice, pos)
    --
    -- Adiciona uma alternativa na lista global.
    --
    local content = latex(choice)
    local choice_data = {
        content = content,
        correct = (correct_choice == #choices + 1)
    }
    if pos then
        table.insert(choices, pos, choice_data)
    else
        table.insert(choices, choice_data)
    end
end

-----------------------------------------------------------------
-- Geração automática de alternativas numéricas
-----------------------------------------------------------------

local function numberString(number)
    --
    -- Converte um valor em uma string com formatação correta.
    --
    local prec_value = string.format("%.2g", number)

    if math.abs(number) < 1e-3 or math.abs(number) > 1e4 then
        -- notação exponencial
        return string.format("%.1E", prec_value):gsub("E%+?0?(%d+)", "E%1"):gsub("%.", ",")
    end
    -- notação decimal
    return string.format("%.4f", prec_value):gsub("%.?0+$", ""):gsub("%.", ",")
end


local function autoNumChoices(math_text)
    --
    -- Cria distratores a partir de uma alternativa numérica.
    --
    local _, _, correct_value_str = string.find(math_text, "(%d+[%.%,]?%d*[eE]?[+-]?%d*)")
    local correct_value = tonumber(tostring(string.gsub(correct_value_str, ",", ".")))

    local function addNumChoice(value)
        -- Cria uma alternativa numérica a partir de seu valor.
        local choice_value_str = numberString(value)
        local math_choice_text = math_text:gsub("(%d+[%.%,]?%d*[eE]?[+-]?%d*)", choice_value_str)
        addChoice(pandoc.Plain(pandoc.Math("InlineMath", math_choice_text)))
    end

    ---@diagnostic disable-next-line: param-type-mismatch
    local scale = 1 + (math.abs(math.log(correct_value, 10)) + 1) / 5
    for i = 1, 5 do
        local value = correct_value * scale ^ (i - correct_choice)
        addNumChoice(value)
    end
end

-----------------------------------------------------------------
-- Geração automática de alternativas de ordenação
-----------------------------------------------------------------

local function trimBlockContentSpaces(content)
    --
    -- Remove espaços em volta de um bloco.
    --
    if content[1].tag == "Space" then
        table.remove(content, 1)
    end
    if content[#content].tag == "Space" then
        table.remove(content, #content)
    end
end

local function autoOrderChoices(choice_content)
    --
    -- Cria distratores a partir de uma alternativa com ordenação.
    --
    local items = {}
    local item_strings = {}
    local new_item = {}
    local total_num = 0
    local unique_num = 0
    local correct_indexes = {}

    local function processItem()
        total_num = total_num + 1
        trimBlockContentSpaces(new_item)
        local new_item_string = pandoc.utils.stringify(new_item)
        -- verifica se já existe um item idêntico na lista
        for i, item_string in ipairs(item_strings) do
            if new_item_string == item_string then
                table.insert(correct_indexes, i)
                return
            end
        end
        -- não há item idêntico na lista
        unique_num = unique_num + 1
        table.insert(items, new_item)
        table.insert(item_strings, new_item_string)
        table.insert(correct_indexes, #items)
    end

    -- separa os items pelo separador
    for _, block in ipairs(choice_content) do
        local block_str = pandoc.utils.stringify(block)
        if block_str == separator then
            separator = block_str
            processItem()
            new_item = {}
        else
            table.insert(new_item, block)
        end
    end
    processItem()

    -- verifica se há items únicos suficientes para gerar 5 alternativas
    local max_freq_num = table.maxfreq(correct_indexes)
    if unique_num < 2 or
        (unique_num == 2 and total_num < 4) or
        (unique_num == 2 and total_num == 4 and max_freq_num > 2)
    then
        return
    end

    local function addOrderChoice(indexes, num)
        local order_choice = {}
        for i, index in ipairs(indexes) do
            -- concatena `order_choice` e `items[indexes]`
            for _, block in ipairs(items[index]) do
                table.insert(order_choice, block)
            end
            if i < #indexes then
                if separator == ">" or separator == "<" then
                    table.insert(order_choice, pandoc.Space())
                end
                table.insert(order_choice, pandoc.Str(separator .. " "))
            end
        end
        addChoice(pandoc.Plain(order_choice), num)
    end

    local indexes_strings = {}
    local correct_indexes_strings = table.concat(correct_indexes, ",")
    table.insert(indexes_strings, correct_indexes_strings)

    while #choices < 4 do
        local new_indexes = table.shuffle(correct_indexes)
        local new_indexes_string = table.concat(new_indexes, ",")

        if not table.contains(indexes_strings, new_indexes_string) then
            table.insert(indexes_strings, new_indexes_string)
            addOrderChoice(new_indexes)
        end
    end
    addOrderChoice(correct_indexes, correct_choice)
end

-----------------------------------------------------------------
-- Geração automática de alternativas de V ou F
-----------------------------------------------------------------

local PROP_CHOICES_MAP = {
    [""] = {
        {},
        { 1 },
        { 2 },
        { 3 },
        { 4 }
    },
    ["1"] = {
        { 1 },
        { 2 },
        { 1, 2 },
        { 1, 3 },
        { 1, 4 }
    },
    ["2"] = {
        { 1 },
        { 2 },
        { 1, 2 },
        { 2, 3 },
        { 2, 4 }
    },
    ["3"] = {
        { 3 },
        { 4 },
        { 1, 3 },
        { 2, 3 },
        { 3, 4 }
    },
    ["4"] = {
        { 3 },
        { 4 },
        { 1, 4 },
        { 2, 4 },
        { 3, 4 }
    },
    ["1,2"] = {
        { 1 },
        { 2 },
        { 1, 2 },
        { 1, 2, 3 },
        { 1, 2, 4 }
    },
    ["1,3"] = {
        { 1 },
        { 3 },
        { 1, 3 },
        { 1, 2, 3 },
        { 1, 3, 4 }
    },
    ["1,4"] = {
        { 1 },
        { 4 },
        { 1, 4 },
        { 1, 2, 4 },
        { 1, 3, 4 }
    },
    ["2,3"] = {
        { 2 },
        { 3 },
        { 2, 3 },
        { 1, 2, 3 },
        { 2, 3, 4 }
    },
    ["2,4"] = {
        { 2 },
        { 4 },
        { 2, 4 },
        { 1, 2, 4 },
        { 2, 3, 4 }
    },
    ["3,4"] = {
        { 3 },
        { 4 },
        { 3, 4 },
        { 1, 3, 4 },
        { 2, 3, 4 }
    },
    ["1,2,3"] = {
        { 1, 2 },
        { 1, 3 },
        { 2, 3 },
        { 1, 2, 3 },
        { 1, 2, 3, 4 }
    },
    ["1,2,4"] = {
        { 1, 2 },
        { 1, 4 },
        { 2, 4 },
        { 1, 2, 4 },
        { 1, 2, 3, 4 }
    },
    ["1,3,4"] = {
        { 1, 3 },
        { 1, 4 },
        { 3, 4 },
        { 1, 3, 4 },
        { 1, 2, 3, 4 }
    },
    ["2,3,4"] = {
        { 2, 3 },
        { 2, 4 },
        { 3, 4 },
        { 2, 3, 4 },
        { 1, 2, 3, 4 }
    },
    ["1,2,3,4"] = {
        { 1, 2, 3 },
        { 1, 2, 4 },
        { 1, 3, 4 },
        { 2, 3, 4 },
        { 1, 2, 3, 4 }
    }
}

local function addPropChoice(prop_choice_nums)
    --
    -- Cria uma alternativa para proposições.
    --
    local prop_choice = {}

    if #prop_choice_nums == 0 then
        table.insert(prop_choice, pandoc.Str("NDA"))
    else
        for i, prop_num in ipairs(prop_choice_nums) do
            table.insert(prop_choice, pandoc.Strong(tostring(prop_num)))
            if i < #prop_choice_nums - 1 then
                -- separator do meio
                table.insert(prop_choice, pandoc.Str(", "))
            elseif i == #prop_choice_nums - 1 then
                -- último separador
                table.insert(prop_choice, pandoc.Str(" e "))
            end
        end
    end
    addChoice(pandoc.Plain(prop_choice))
end

local function autoPropChoices(elem)
    --
    -- Cria distratores para um problema de avaliação de proposições.
    --
    choices = {}

    local correct_props = {}
    for i, choice in ipairs(elem.content) do
        local checkbox = choice[1].content:remove(1).text
        if checkbox == "☒" then
            table.insert(correct_props, i)
        end
        -- remove o primeiro espaço
        choice[1].content:remove(1)
    end

    -- adiciona as cinco alternativas na lista
    local correct_props_str = table.concat(correct_props, ",")
    for i, prop_choice_nums in ipairs(PROP_CHOICES_MAP[correct_props_str]) do
        addPropChoice(prop_choice_nums)
        -- procura a alternativa correta
        if table.concat(prop_choice_nums, ",") == correct_props_str then
            correct_choice = i
        end
    end
end

-----------------------------------------------------------------
-- Listas dos problemas
-----------------------------------------------------------------

local function autoChoices(choice)
    --
    -- Gera distratores a partir de uma alternativa correta.
    --
    if #choice ~= 1 then
        return
    end

    local choice_content = choice[1].content

    correct_choice = math.random(1, 5)

    -- alternativa consiste apenas de uma equação
    if #choice_content == 1 and choice_content[1].tag == "Math" then
        -- gerar alternativas numéricas
        autoNumChoices(choice_content[1].text)
        return
    end
    -- alternativa contém ";", ">", "<"
    separator = pandoc.utils.stringify(choice_content):match("[;<>]")
    if separator ~= nil then
        -- gerar alternativas de ordenação
        autoOrderChoices(choice_content)
        return
    end
end

local function taskBulletList(elem)
    --
    -- Problema objetivo com alternativas.
    --
    local input_choices = {}

    for i, choice in ipairs(elem.content) do
        local checkbox = choice[1].content:remove(1).text
        if checkbox == "☒" then
            correct_choice = i
        end
        -- remove o primeiro espaço
        choice[1].content:remove(1)
        table.insert(input_choices, choice)
    end

    -- problema com apenas uma alternativa (gerar as alternativas)
    if #input_choices == 1 then
        autoChoices(input_choices[1])
        return
    end
    -- problema com multiplas alternativas
    for _, choice in ipairs(input_choices) do
        addChoice(choice)
    end
end

-----------------------------------------------------------------
-- Filtro das listas
-----------------------------------------------------------------

local function decompactifyItem(blocks)
    for i, block in ipairs(blocks) do
        if block.tag == 'Plain' then
            blocks[i] = pandoc.Para(block.content)
        end
    end
    return blocks
end


local function decompactifyList(elem)
    elem.content = elem.content:map(decompactifyItem)
end

-----------------------------------------------------------------
-- Elementos
-----------------------------------------------------------------

local function BulletList(elem)
    local frist = elem.content[1][1].content[1].text
    if frist == "☒" or frist == "☐" then
        taskBulletList(elem)
        -- remove a lista do enunciado
        return {}
    end

    decompactifyList(elem)
    return elem
end

local function OrderedList(elem)
    local frist = elem.content[1][1].content[1].text
    if frist == "☒" or frist == "☐" then
        autoPropChoices(elem)
    end

    decompactifyList(elem)
    return elem
end

local function Meta(meta)
    --
    -- Registra as alternativas nos metadados
    --
    meta.choices = choices
    meta.correct_choice = correct_choice
    return meta
end

-----------------------------------------------------------------
-- Export filtros
-----------------------------------------------------------------

return {
    {
        BulletList = BulletList,
        OrderedList = OrderedList,
        Meta = Meta,
    }
}
