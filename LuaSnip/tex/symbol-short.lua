local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
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
  s({ trig = "and", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\vee"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "or ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\wedge "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "band", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\bigvee"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "bor", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\bigwedge"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "...", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cdots"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "c.", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cdot"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "v.", wordTrig = false, snippetType = "autosnippet", priority = 2000 }, {
    t("\\vdots"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "iff", snippetType = "autosnippet" }, {
    t("\\iff"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "in", snippetType = "autosnippet" }, {
    t("\\in"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "nin", snippetType = "autosnippet" }, {
    t("\\notin"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "aa ", snippetType = "autosnippet" }, {
    t("\\forall "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ee ", snippetType = "autosnippet" }, {
    t("\\exists "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "dd ", snippetType = "autosnippet" }, {
    t("\\d "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "!=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "neq", snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "==", wordTrig = false, snippetType = "autosnippet" }, {
    t("&="),
  }, { condition = tex.in_mathzone }),
  s({ trig = "leq", snippetType = "autosnippet" }, {
    t("\\leq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "geq", snippetType = "autosnippet" }, {
    t("\\geq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "apx", snippetType = "autosnippet" }, {
    t("\\approx"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "~", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sim", snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex.in_mathzone }),
  s({ trig = ">=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\geq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "<=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\leq"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "to", snippetType = "autosnippet" }, {
    t("\\to"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "mto", snippetType = "autosnippet", priority = 1001 }, {
    t("\\mapsto"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "--", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\setminus"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "||", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "mid", snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "nmid", snippetType = "autosnippet", priority = 2000 }, {
    t("\\nmid"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "  ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\, "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "pm ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\pm "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "mp ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mp "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "rhs", snippetType = "autosnippet" }, {
    t("\\mathrm{R.H.S}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "lhs", snippetType = "autosnippet" }, {
    t("\\mathrm{L.H.S}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cap", snippetType = "autosnippet" }, {
    t("\\cap"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cup", snippetType = "autosnippet" }, {
    t("\\cup"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sub", snippetType = "autosnippet" }, {
    t("\\subset"),
  }, { condition = tex.in_mathzone }),
  -- s({ trig = "sup", wordTrig = false, snippetType = "autosnippet" }, {
  --   t("\\supseteq "),
  -- }, { condition = tex.in_mathzone }),
  s({ trig = "ifn", snippetType = "autosnippet" }, {
    t("\\infty"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "perp", snippetType = "autosnippet" }, {
    t("^\\perp"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "xx", snippetType = "autosnippet" }, {
    t("\\times"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "=>", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\implies"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "To", snippetType = "autosnippet" }, {
    t("\\implies"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "llr", snippetType = "autosnippet" }, {
    t("\\longleftrightarrow "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "circ", snippetType = "autosnippet" }, {
    t("\\circ"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "iso", snippetType = "autosnippet" }, {
    t("\\cong"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cong", snippetType = "autosnippet" }, {
    t("\\cong"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "eqv", snippetType = "autosnippet" }, {
    t("\\equiv"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "##", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\# "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "oti", snippetType = "autosnippet" }, {
    t("\\otimes"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "opl", snippetType = "autosnippet" }, {
    t("\\oplus"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "not", snippetType = "autosnippet", priority = 2000 }, {
    t("\\not"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "par", snippetType = "autosnippet", priority = 2000 }, {
    t("\\partial"),
  }, { condition = tex.in_mathzone }),
  s(
    { trig = "__", wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
    _{<>}
    ]],
      { i(1) }
    ),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "^^", wordTrig = false, snippetType = "autosnippet" },
    fmta(
      [[
    ^{<>}
    ]],
      { i(1) }
    ),
    { condition = tex.in_mathzone }
  ),
}
