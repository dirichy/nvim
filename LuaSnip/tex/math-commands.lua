local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local tex = require("util.conditions")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "res", snippetType = "autosnippet" },
    fmta("\\res{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "(%a)res", regTrig = true, priority = 2000, snippetType = "autosnippet" },
    fmta("\\res{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "(\\%a+)res", regTrig = true, priority = 3000, snippetType = "autosnippet" },
    fmta("\\res{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "sqrt", snippetType = "autosnippet" },
    fmta("\\sqrt{<>}", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "fun", snippetType = "autosnippet", priority = 2000 },
    fmta("\\fun{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "bar", snippetType = "autosnippet", priority = 200 },
    fmta("\\overline{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_math }
  ),
  -- s(
  --   { trig = "bar", snippetType = "autosnippet" },
  --   fmta("\\overline{<>} ", {
  --     i(1),
  --   }),
  --   { condition = tex.in_math }
  -- ),
  s(
    { trig = "(\\%a+)bar", regTrig = true, snippetType = "autosnippet" },
    fmta("\\overline{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "(\\%a+)hat", regTrig = true, snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "mtd", snippetType = "autosnippet", priority = 2000 },
    fmta("\\tilde{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "mtd", snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "(\\%a+)~", regTrig = true, snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "(%a)~", regTrig = true, snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet", priority = 2000 },
    fmta("\\dot{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet" },
    fmta("\\dot{<>}", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet", priority = 2000 },
    fmta("\\hat{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet" },
    fmta("|<>|", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "vec", snippetType = "autosnippet", priority = 2000 },
    fmta("\\vec{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_math }
  ),
}
