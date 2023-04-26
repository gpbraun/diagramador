function Div(elem)
    local env_name = elem.classes[1]
    return {
        pandoc.RawInline('latex', '\\begin{' .. env_name .. '}'),
        elem,
        pandoc.RawInline('latex', '\\end{' .. env_name .. '}'),
    }
end
