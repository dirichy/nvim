local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("util.conditions")
local mathupperfont = {
  bb = "mathbb",
  bm = "mathbbm",
  cal = "mathcal",
  scr = "mathscr",
}
local mathnormalfont = {
  bf = "mathbf",
  rm = "mathrm",
  frk = "mathfrak",
  te = "text",
}
local textfont = {
  it = "textit",
  bf = "textbf",
  tt = "texttt",
}
local font_snippets = {}
for k, v in pairs(mathupperfont) do
  table.insert(
    font_snippets,
    s(
      { trig = k .. "(%a)", regTrig = true, snippetType = "autosnippet" },
      fmta("\\" .. v .. "{<>}<>", {
        f(function(_, snip)
          return string.upper(snip.captures[1])
        end),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
  table.insert(
    font_snippets,
    s(
      { trig = "m" .. k, snippetType = "autosnippet" },
      fmta("\\" .. v .. "{<>}<>", {
        i(1),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
end
for k, v in pairs(mathnormalfont) do
  table.insert(
    font_snippets,
    s(
      { trig = k .. "(%a)", regTrig = true, snippetType = "autosnippet" },
      fmta("\\" .. v .. "{<>}<>", {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
  table.insert(
    font_snippets,
    s(
      { trig = "m" .. k, snippetType = "autosnippet" },
      fmta("\\" .. v .. "{<>}<>", {
        i(1),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
end
for k, v in pairs(textfont) do
  table.insert(
    font_snippets,
    s(
      { trig = k },
      fmta("\\" .. v .. "{<>}<>", {
        i(1),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
end
M = {
  s({ trig = "bb1", snippetType = "autosnippet" }, {
    t("\\mathbbm{1}"),
  }, { condition = tex.in_math }),
  s({ trig = "bm1", snippetType = "autosnippet" }, {
    t("\\mathbbm{1}"),
  }, { condition = tex.in_math }),
}
vim.list_extend(M, font_snippets)
return M
