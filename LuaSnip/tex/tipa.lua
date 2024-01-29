local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local tex = require("util.conditions")
return {
  s({ trig = "tipa", snippetType = "autosnippet" }, {
    t("\\textipa{"),
    i(1),
    t("}"),
    i(0),
  }, { condition = tex.in_text }),
}
