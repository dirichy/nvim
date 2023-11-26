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
local tex = require("util.latex")

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
  --   { condition = tex.in_mathzone}
  -- ),
  s(
    { trig = "(%d+)/", regTrig = true, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a)/", regTrig = true, snippetType = "autosnippet", priority = 100 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "%<(.+)%>/", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+)/", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+%{%a+%})/", regTrig = true, snippetType = "autosnippet", priority = 3000 },
    fmta("\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "//", regTrig = true, snippetType = "autosnippet", priority = 3000 },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
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
  s({ trig = "lim", regTrig = true, snippetType = "autosnippet" }, fmta("\\lim", {}), { condition = tex.in_mathzone }),
  -- s(
  --   { trig = "sum", regTrig = true, snippetType = "autosnippet" },
  --   fmta("\\sum\\limits_{<>}^{<>}", {
  --     i(1),
  --     i(1),
  --   }),
  --   { condition = tex.in_mathzone }
  -- ),
  s(
    { trig = "sum", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\sum_{"), i(1), t("} ") }),
      sn(nil, { t("\\sum_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "prod", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\prod_{"), i(1), t("} ") }),
      sn(nil, { t("\\prod_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "boti", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    c(1, {
      sn(nil, { t("\\bigotimes_{"), i(1), t("} ") }),
      sn(nil, { t("\\bigotimes_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "bcap", snippetType = "autosnippet", priority = 2000 },
    c(1, {
      sn(nil, { t("\\bigcap_{"), i(1), t("} ") }),
      sn(nil, { t("\\bigcap_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "bcup", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    c(1, {
      sn(nil, { t("\\bigcup_{"), i(1), t("} ") }),
      sn(nil, { t("\\bigcup_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "\\int", snippetType = "autosnippet" },
    c(1, {
      sn(nil, { t("\\int_{"), i(1), t("} ") }),
      sn(nil, { t("\\int_{"), i(1), t("}^{"), i(2), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "iint", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    c(1, {
      t("\\iint "),
      sn(nil, { t("\\iint_{"), i(1), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "sup", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    c(1, {
      t("\\sup "),
      sn(nil, { t("\\sup_{"), i(1), t("} ") }),
    }),
    { condition = tex.in_mathzone }
  ),
}
