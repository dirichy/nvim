local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- [
-- personal imports
-- ]
local tex = require("util.conditions")
local brackets = {
  a = { "(", ")" },
  A = { "\\left(", "\\right)" },
  s = { "[", "]" },
  S = { "\\left[", "\\right]" },
  d = { "{", "}" },
  D = { "\\left.", "\\right." },
  f = { "\\{", "\\}" },
  F = { "\\left\\{", "\\right\\}" },
  g = { "\\langle ", "\\rangle " },
  G = { "\\left\\langle ", "\\right\\rangle " },
  b = { "|", "|" },
  B = { "\\left|", "\\right|" },
  q = { "``", "''" },
  w = { "`", "'" },
}

M = {
  autosnippet(
    {
      trig = ";([aAsSdfFgGbBqw])",
      name = "left right",
      dscr = "left right delimiters",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
    <><><><>
    ]],
      {
        f(function(_, snip)
          local cap = snip.captures[1]
          return brackets[cap][1]
        end),
        i(1),
        f(function(_, snip)
          local cap = snip.captures[1]
          return brackets[cap][2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math, show_condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = ";h([aAsSdDfFgGbB])",
      name = "left right",
      dscr = "left right delimiters",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>
    ]],
      { f(function(_, snip)
        local cap = snip.captures[1]
        return brackets[cap][1]
      end) }
    ),
    { condition = tex.in_math, show_condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = ";l([aAsSdDfFgGbB])",
      name = "left right",
      dscr = "left right delimiters",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>
    ]],
      { f(function(_, snip)
        local cap = snip.captures[1]
        return brackets[cap][2]
      end) }
    ),
    { condition = tex.in_math, show_condition = tex.in_math }
  ),
}

return M
