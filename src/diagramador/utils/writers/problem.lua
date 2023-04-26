-- Converte um Pandoc em latex e html
local text = function(block, opts)
    local doc = pandoc.Pandoc(block)
    local latex_text = pandoc.write(doc, 'latex', opts)
    latex_text = latex_text:gsub("\\noalign{}", "")
    latex_text = latex_text:gsub("\\endhead", "")
    latex_text = latex_text:gsub("\\endlastfoot", "")
    latex_text = latex_text:gsub("\\bottomrule", "")
    return latex_text
end

function Writer(doc, opts)
    -- Converte as alternativas
    local choices = nil
    if doc.meta.choices ~= nil then
        choices = {}
        for _, block in ipairs(doc.meta.choices) do
            table.insert(choices, text(block, opts))
        end
    end

    -- Converte os dados
    local data = nil
    if doc.meta.dados ~= nil then
        data = {}
        for _, block in ipairs(doc.meta.dados) do
            table.insert(data, text(block, opts))
        end
    end

    -- Converte os elementos
    local elements = nil
    if doc.meta.elementos ~= nil then
        elements = {}
        for _, block in ipairs(doc.meta.elementos) do
            table.insert(elements, block.text)
        end
    end

    -- Separa o enunciado da solução.
    local in_solution = false
    local solution = {}
    local statement = {}

    for _, block in ipairs(doc.blocks) do
        if block.t == "HorizontalRule" then
            in_solution = true
        elseif in_solution == true then
            table.insert(solution, block)
        else
            table.insert(statement, block)
        end
    end

    local problem_data = {
        -- date           = doc.meta.date,
        choices        = choices,
        data           = data,
        correct_choice = doc.meta.correct_choice,
        elements       = elements,
        statement      = text(statement, opts),
        solution       = text(solution, opts)
    }
    return pandoc.json.encode(problem_data)
end
