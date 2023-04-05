"""
Raw latex block in markdown
"""

import panflute as pf


def latex(text):
    return pf.RawBlock(text, format="latex")


def raw_tex(elem, doc, debug=False):
    if isinstance(elem, pf.CodeBlock) and "latex" in elem.classes:
        elem = latex(pf.stringify(elem))
        return elem
    if isinstance(elem, pf.Code):
        elem = pf.RawInline(pf.stringify(elem), format="latex")
        return elem
    return


def main(doc=None):
    return pf.run_filter(raw_tex, doc=doc)


if __name__ == "__main__":
    main()
