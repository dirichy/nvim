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
    { trig = "(\\%a+)res", regTrig = true, priority = 3000, snippetType = "autosnippet" },
    fmta("\\res{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
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
}
