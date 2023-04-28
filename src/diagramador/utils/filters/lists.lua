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


local choices
local correct_choice


local function addChoice(choice)
    -- Adiciona uma alternativa na lista global.
    table.insert(choices, choice)
end

local function addPropChoice(prop_choice_nums)
    -- Cria uma alternativa para proposições.
    if #prop_choice_nums == 0 then
        return pandoc.Plain("NDA")
    end
    local prop_choice = {}
    for i, prop_num in ipairs(prop_choice_nums) do
        table.insert(prop_choice, pandoc.Strong(tostring(prop_num)))
        if i < #prop_choice_nums - 1 then
            table.insert(prop_choice, pandoc.Str(","))
            table.insert(prop_choice, pandoc.Space())
        elseif i == #prop_choice_nums - 1 then
            table.insert(prop_choice, pandoc.Space())
            table.insert(prop_choice, pandoc.Str("e"))
            table.insert(prop_choice, pandoc.Space())
        end
    end
    addChoice(pandoc.Plain(prop_choice))
end


local function autoPropChoices(elem)
    -- Cria distratores para um problema de avaliação de proposições.
    choices = {}

    local correct_props = {}
    for i, choice in ipairs(elem.content) do
        local checkbox = choice[1].content:remove(1).text
        if checkbox == "☒" then
            table.insert(correct_props, i)
        end
        -- Remove o primeiro espaço
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


local function taskBulletList(elem)
    -- Problema objetivo com alternativas.
    choices = {}

    for i, choice in ipairs(elem.content) do
        local checkbox = choice[1].content:remove(1).text
        if checkbox == "☒" then
            correct_choice = i
        end
        -- Remove o primeiro espaço
        choice[1].content:remove(1)
        addChoice(choice)
    end
end


local function decompactifyItem(blocks)
    for i, bolck in ipairs(blocks) do
        if bolck.tag == 'Plain' then
            blocks[i] = pandoc.Para(bolck.content)
        end
    end
    return blocks
end


local function decompactifyList(elem)
    elem.content = elem.content:map(decompactifyItem)
end


function OrderedList(elem)
    local frist = elem.content[1][1].content[1].text
    if frist == "☒" or frist == "☐" then
        autoPropChoices(elem)
    end

    decompactifyList(elem)
    return elem
end

function BulletList(elem)
    local frist = elem.content[1][1].content[1].text
    if frist == "☒" or frist == "☐" then
        taskBulletList(elem)
        -- remove a lista do enunciado
        return {}
    end

    decompactifyList(elem)
    return elem
end

function Meta(metadata)
    metadata.date = os.date("!%Y-%m-%dT%T")
    metadata.choices = choices
    metadata.correct_choice = correct_choice
    return metadata
end
