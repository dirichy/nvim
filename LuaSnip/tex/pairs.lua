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

return {
  s(
    { trig = "(", snippetType = "autosnippet" },
    fmta("(<>)<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = "[", snippetType = "autosnippet" },
    fmta("[<>]<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = "{", snippetType = "autosnippet" },
    fmta("{<>}<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = "[[", snippetType = "autosnippet" },
    fmta("\\{<>\\}<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = ";a", wordTrig = false, snippetType = "autosnippet" },
    fmta("(<>)<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = ";s", wordTrig = false, snippetType = "autosnippet" },
    fmta("[<>]<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = ";d", wordTrig = false, snippetType = "autosnippet" },
    fmta("{<>}<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = ";f", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\{<>\\}<>", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = ";g", wordTrig = false, snippetType = "autosnippet" },
    fmta("<<<>>><>", {
      i(1),
      i(2),
    })
  ),
}
