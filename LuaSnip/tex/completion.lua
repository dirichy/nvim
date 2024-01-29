local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("util.conditions")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  -- s(
  --   { trig = "(%a);", regTrig = true, snippetType = "autosnippet" },
  --   fmta("\\hat{<>}", {
  --     f(function(_, snip)
  --       return snip.captures[1]
  --     end),
  --   }),
  --   { condition = tex.in_math}
  -- ),
  s(
    { trig = "\\%)(%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\) <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),
  s(
    { trig = "\\](%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("\\] <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),
  s(
    { trig = "([,.?;!])(%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta("<> <>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_text }
  ),
  s(
    { trig = "([,.?;!])(%a)", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 3000 },
    fmta("<><>", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex.in_text * line_begin }
  ),
  s({ trig = "lim", regTrig = true, snippetType = "autosnippet" }, fmta("\\lim", {}), { condition = tex.in_math }),
  -- s(
  --   { trig = "sum", regTrig = true, snippetType = "autosnippet" },
  --   fmta("\\sum\\limits_{<>}^{<>}", {
  --     i(1),
  --     i(1),
  --   }),
  --   { condition = tex.in_math }
  -- ),
  s(
    { trig = "sup", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    t("\\sup"),
    { condition = tex.in_math }
  ),
}
