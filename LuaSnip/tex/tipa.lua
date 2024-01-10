local ls = require("luasnip")
local c = ls.choice_node
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("util.latex")
local rep = require("luasnip.extras").rep
return {
  s({ trig = "tipa", snippetType = "autosnippet" }, {
    t("\\textipa{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = tex.in_text }),
}
