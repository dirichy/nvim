local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = require("util.latex")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "sqrt", snippetType = "autosnippet" },
    fmta("\\sqrt{<>}", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "set", snippetType = "autosnippet" }, {
    t("\\set"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ord", snippetType = "autosnippet" }, {
    t("\\ord"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "card", snippetType = "autosnippet" }, {
    t("\\card"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ide", snippetType = "autosnippet" }, {
    t("\\ide"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "van", snippetType = "autosnippet" }, {
    t("\\van"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sin", snippetType = "autosnippet" }, {
    t("\\sin"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "asin", snippetType = "autosnippet" }, {
    t("\\arcsin"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cos", snippetType = "autosnippet" }, {
    t("\\cos"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acos", snippetType = "autosnippet" }, {
    t("\\arccos"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "tan", snippetType = "autosnippet" }, {
    t("\\tan"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "atan", snippetType = "autosnippet" }, {
    t("\\arctan"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cot", snippetType = "autosnippet" }, {
    t("\\cot"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acot", snippetType = "autosnippet" }, {
    t("\\arccot"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "csc", snippetType = "autosnippet" }, {
    t("\\csc"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "acsc", snippetType = "autosnippet" }, {
    t("\\arccsc"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sec", snippetType = "autosnippet" }, {
    t("\\sec"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "asec", snippetType = "autosnippet" }, {
    t("\\arcsec"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "log", snippetType = "autosnippet" }, {
    t("\\log"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "max", snippetType = "autosnippet" }, {
    t("\\max"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "min", snippetType = "autosnippet" }, {
    t("\\min"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ln ", snippetType = "autosnippet" }, {
    t("\\ln "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "bb1", snippetType = "autosnippet", priority = 2000 }, {
    t("\\mathbbm{1}"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = "bb(%w)", regTrig = true, snippetType = "autosnippet" },
    fmta("\\mathbb{<>}", {
      f(function(_, snip)
        return string.upper(snip.captures[1])
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "fun", snippetType = "autosnippet", priority = 2000 },
    fmta("\\fun{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mbm(%w)", regTrig = true, snippetType = "autosnippet" },
    fmta("\\mathbbm{<>}", {
      f(function(_, snip)
        return string.upper(snip.captures[1])
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "exp", snippetType = "autosnippet" }, {
    t("\\exp"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = "bar", snippetType = "autosnippet", priority = 2000 },
    fmta("\\overline{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "bar", snippetType = "autosnippet" },
    fmta("\\overline{<>} ", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+)bar", regTrig = true, snippetType = "autosnippet" },
    fmta("\\overline{<>} ", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a)bar", regTrig = true, snippetType = "autosnippet" },
    fmta("\\overline{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "\\mathbb{A}r", regTrig = true, snippetType = "autosnippet", priority = 2000 },
    fmta("\\overline{b}", {}),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mtd", snippetType = "autosnippet", priority = 2000 },
    fmta("\\tilde{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mtd", snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(\\%a+)~", regTrig = true, snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "(%a)~", regTrig = true, snippetType = "autosnippet" },
    fmta("\\tilde{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet", priority = 2000 },
    fmta("\\dot{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "dot", snippetType = "autosnippet" },
    fmta("\\dot{<>}", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet", priority = 2000 },
    fmta("\\hat{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "hat", snippetType = "autosnippet" },
    fmta("\\hat{<>}", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet" },
    fmta("|<>|", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "vec", snippetType = "autosnippet", priority = 2000 },
    fmta("\\vec{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "mod", snippetType = "autosnippet" }, fmta("\\mod", {}), { condition = tex.in_mathzone }),
  s({ trig = "sgn", snippetType = "autosnippet", priority = 2000 }, fmta("\\sgn", {}), { condition = tex.in_mathzone }),
  s({ trig = "gcd", snippetType = "autosnippet", priority = 2000 }, fmta("\\gcd", {}), { condition = tex.in_mathzone }),
  s({ trig = "deg", snippetType = "autosnippet", priority = 2000 }, fmta("\\deg", {}), { condition = tex.in_mathzone }),
  s({ trig = "span", snippetType = "autosnippet" }, {
    t("\\Span"),
  }, { condition = tex.in_mathzone }),
}
