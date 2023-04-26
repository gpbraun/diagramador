function CodeBlock(block)
    if block.classes[1] == "latex" then
        return {
            pandoc.RawInline('latex', '\\begin{center}'),
            pandoc.RawInline('latex', block.text),
            pandoc.RawInline('latex', '\\end{center}'),
        }
    end
end
