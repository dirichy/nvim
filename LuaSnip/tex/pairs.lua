local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("util.latex")

return {
  s(
    { trig = ";a", wordTrig = false, snippetType = "autosnippet" },
    fmta("(<>)", {
      i(1),
    })
  ),
  s({ trig = ";ha", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\left("),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";la", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\right)"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = ";A", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\left(<>\\right)", {
      i(1),
    })
  ),
  s(
    { trig = ";s", wordTrig = false, snippetType = "autosnippet" },
    fmta("[<>]", {
      i(1),
    })
  ),
  s(
    { trig = ";S", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\left[<>\\right]", {
      i(1),
    })
  ),
  s({ trig = ";hs", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\left["),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";ls", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\right]"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = ";d", wordTrig = false, snippetType = "autosnippet" },
    fmta("{<>}", {
      i(1),
    })
  ),
  s({ trig = ";hd", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\left."),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";ld", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\right."),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = ";f", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\{<>\\}", {
      i(1),
    })
  ),
  s(
    { trig = ";F", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\left\\{<>\\right\\}", {
      i(1),
    })
  ),
  s({ trig = ";hf", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\left\\{"),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";lf", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\right\\}"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = ";g", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\langle <>\\rangle ", {
      i(1),
    })
  ),
  s(
    { trig = ";G", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\left\\langle <>\\right\\rangle ", {
      i(1),
    })
  ),
  s({ trig = ";hg", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\left\\langle"),
  }, { condition = tex.in_mathzone }),
  s({ trig = ";lg", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\right\\rangle"),
  }, { condition = tex.in_mathzone }),
}
