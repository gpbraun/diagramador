-----------------------------------------------------------------
-- problem.lua
--
-- Gabriel Braun, 2023
-----------------------------------------------------------------

function pandoc.latex(block)
    --
    -- Converte um pandoc.Block em latex e html simples.
    --
    local doc = pandoc.Pandoc(block)
    return pandoc.write(doc, 'latex')
end

-----------------------------------------------------------------
-- Raw LaTeX
-----------------------------------------------------------------

local problemRawTex = {
    Code = function(elem)
        return pandoc.RawInline('latex', elem.text)
    end,
    CodeBlock = function(elem)
        if elem.classes[1] ~= "latex" then
            return elem
        end
        return {
            pandoc.RawInline('latex', '\\begin{center}'),
            pandoc.RawInline('latex', elem.text),
            pandoc.RawInline('latex', '\\end{center}'),
        }
    end,
}

-----------------------------------------------------------------
-- Título
-----------------------------------------------------------------

local title

local problemHeaders = {
    Header = function(elem)
        if elem.level == 1 then
            title = pandoc.utils.stringify(elem)
            return {}
        end

        return pandoc.Div({ pandoc.Strong(elem.content) })
    end
}

local solutionHeaders = {
    Header = function(elem)
        local content = elem.content
        table.insert(content, 1, pandoc.RawInline('latex', '\\StepHeader{'))
        table.insert(content, pandoc.RawInline('latex', '}'))
        return pandoc.Plain(content)
    end,
}

-----------------------------------------------------------------
-- Elementos químicos
-----------------------------------------------------------------

local function parseElementList(tbl)
    --
    -- Retorna: tabela com os elementos químicos a partir de listas.
    --
    if tbl == nil then return {} end

    local elements = {}
    for _, element_seq in ipairs(tbl) do
        for value in string.gmatch(pandoc.utils.stringify(element_seq), "%s*([%a%d]+)[%s,;]*") do
            table.insert(elements, value)
        end
    end
    return elements
end

-----------------------------------------------------------------
-- Imagens .svg
-----------------------------------------------------------------

local function extractSVGWidth(svgContent)
    local value, unit = svgContent:match('%swidth%s*=%s*\"(%d+)([a-zA-Z%%]+)\"')
    if value == nil then return end

    return tostring(tonumber(value) * 1.25) .. unit
end

-----------------------------------------------------------------
-- Writer
-----------------------------------------------------------------

function Writer(doc, opts)
    --
    -- Problema.
    --
    if doc.meta.seed ~= nil then
        math.randomseed(doc.meta.seed)
    end

    -- raw LaTeX
    doc = doc:walk(problemRawTex)

    -- imagens svg
    doc = doc:walk({
        Image = function(elem)
            local img_name, img_ext = pandoc.path.split_extension(elem.src)
            if img_ext == ".svg" then
                local svg_path = pandoc.path.join { doc.meta.path, img_name .. ".svg" }
                local pdf_path = pandoc.path.join { doc.meta.tmp_path, img_name .. ".pdf" }

                local svg_file = io.open(svg_path, "r")
                if not svg_file then return {} end

                local svg_str = svg_file:read("*all")
                svg_file:close()
                local svg_width = extractSVGWidth(svg_str)

                os.execute("cairosvg " .. svg_path .. " -o " .. pdf_path)

                elem.src = pdf_path
                if elem.attributes.width == nil and svg_width ~= nil then
                    elem.attributes.width = svg_width
                end

                return elem
            end
            return elem
        end
    })

    -- separa o enunciado da solução
    local statement = pandoc.Blocks {}
    local solution = pandoc.Blocks {}
    local in_solution = false

    for _, block in ipairs(doc.blocks) do
        if block.t == "HorizontalRule" then
            in_solution = true
        elseif in_solution == true then
            table.insert(solution, block)
        else
            table.insert(statement, block)
        end
    end

    -- tratamento dos títulos do enunciado e solução
    statement = statement:walk(problemHeaders)
    solution = solution:walk(solutionHeaders)

    -- resposta curta para o pdf
    local answer
    if doc.meta.choices ~= nil then
        if tonumber(doc.meta.correct_choice) > 0 then
            answer = string.char(64 + doc.meta.correct_choice)
        else
            answer = "Anulada"
        end
    else
        if doc.meta.resposta ~= nil then
            answer = pandoc.latex(doc.meta.resposta)
        end
    end

    -- dados do problema
    local problem_data = {
        id        = doc.meta.id,
        title     = title,
        statement = pandoc.latex(statement),
        solution  = pandoc.latex(solution),
        answer    = answer,
        choices   = doc.meta.choices,
        elements  = parseElementList(doc.meta.elementos),
        packages  = {},

    }
    return pandoc.json.encode(problem_data)
end
