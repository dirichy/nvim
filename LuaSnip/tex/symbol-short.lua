local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local tex = require("util.conditions")
return {
  s({ trig = "or ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\vee "),
  }, { condition = tex.in_math }),
  s({ trig = "and", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\wedge"),
  }, { condition = tex.in_math }),
  s({ trig = "...", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\cdots"),
  }, { condition = tex.in_math }),
  s({ trig = "iff", snippetType = "autosnippet" }, {
    t("\\iff"),
  }, { condition = tex.in_math }),
  s({ trig = "in", snippetType = "autosnippet" }, {
    t("\\in"),
  }, { condition = tex.in_math }),
  s({ trig = "nin", snippetType = "autosnippet" }, {
    t("\\notin"),
  }, { condition = tex.in_math }),
  s({ trig = "aa ", snippetType = "autosnippet" }, {
    t("\\forall "),
  }, { condition = tex.in_math }),
  s({ trig = "ee ", snippetType = "autosnippet" }, {
    t("\\exists "),
  }, { condition = tex.in_math }),
  s({ trig = "dd ", snippetType = "autosnippet" }, {
    t("\\d "),
  }, { condition = tex.in_math }),
  s({ trig = "!=", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex.in_math }),
  s({ trig = "neq", snippetType = "autosnippet" }, {
    t("\\neq"),
  }, { condition = tex.in_math }),
  s({ trig = "==", wordTrig = false, snippetType = "autosnippet" }, {
    t("&="),
  }, { condition = tex.in_math }),
  s({ trig = "leq", snippetType = "autosnippet" }, {
    t("\\leq"),
  }, { condition = tex.in_math }),
  s({ trig = "geq", snippetType = "autosnippet" }, {
    t("\\geq"),
  }, { condition = tex.in_math }),
  s({ trig = "apx", snippetType = "autosnippet" }, {
    t("\\approx"),
  }, { condition = tex.in_math }),
  s({ trig = "~", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex.in_math }),
  s({ trig = "sim", snippetType = "autosnippet" }, {
    t("\\sim"),
  }, { condition = tex.in_math }),
  s({ trig = "to", snippetType = "autosnippet" }, {
    t("\\to"),
  }, { condition = tex.in_math }),
  s({ trig = "mto", snippetType = "autosnippet", priority = 1001 }, {
    t("\\mapsto"),
  }, { condition = tex.in_math }),
  s({ trig = "ker", snippetType = "autosnippet" }, {
    t("\\ker"),
  }, { condition = tex.in_math }),
  s({ trig = "--", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\setminus"),
  }, { condition = tex.in_math }),
  s({ trig = "||", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex.in_math }),
  s({ trig = "mid", snippetType = "autosnippet" }, {
    t("\\mid"),
  }, { condition = tex.in_math }),
  s({ trig = "nmid", snippetType = "autosnippet", priority = 2000 }, {
    t("\\nmid"),
  }, { condition = tex.in_math }),
  s({ trig = "  ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\, "),
  }, { condition = tex.in_math }),
  s({ trig = "pm ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\pm "),
  }, { condition = tex.in_math }),
  s({ trig = "mp ", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\mp "),
  }, { condition = tex.in_math }),
  s({ trig = "rhs", snippetType = "autosnippet" }, {
    t("\\mathrm{R.H.S}"),
  }, { condition = tex.in_math }),
  s({ trig = "lhs", snippetType = "autosnippet" }, {
    t("\\mathrm{L.H.S}"),
  }, { condition = tex.in_math }),
  s({ trig = "cap", snippetType = "autosnippet" }, {
    t("\\cap"),
  }, { condition = tex.in_math }),
  s({ trig = "cup", snippetType = "autosnippet" }, {
    t("\\cup"),
  }, { condition = tex.in_math }),
  s({ trig = "sub", snippetType = "autosnippet" }, {
    t("\\subset"),
  }, { condition = tex.in_math }),
  s({ trig = "ssub", snippetType = "autosnippet", priority = 2000 }, {
    t("\\sqsubset"),
  }, { condition = tex.in_math }),
  s({ trig = "prec", snippetType = "autosnippet" }, {
    t("\\prec"),
  }, { condition = tex.in_math }),
  s({ trig = "ple", snippetType = "autosnippet" }, {
    t("\\prec"),
  }, { condition = tex.in_math }),
  s({ trig = "ifn", snippetType = "autosnippet" }, {
    t("\\infty"),
  }, { condition = tex.in_math }),
  s({ trig = "perp", snippetType = "autosnippet" }, {
    t("\\perp"),
  }, { condition = tex.in_math }),
  s({ trig = "xx", snippetType = "autosnippet" }, {
    t("\\times"),
  }, { condition = tex.in_math }),
  s({ trig = "=>", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\implies"),
  }, { condition = tex.in_math }),
  s({ trig = "<=", snippetType = "autosnippet" }, {
    t("\\impliedby"),
  }, { condition = tex.in_math }),
  s({ trig = "llr", snippetType = "autosnippet" }, {
    t("\\longleftrightarrow "),
  }, { condition = tex.in_math }),
  s({ trig = "circ", snippetType = "autosnippet" }, {
    t("\\circ"),
  }, { condition = tex.in_math }),
  s({ trig = "iso", snippetType = "autosnippet" }, {
    t("\\cong"),
  }, { condition = tex.in_math }),
  s({ trig = "cong", snippetType = "autosnippet" }, {
    t("\\cong"),
  }, { condition = tex.in_math }),
  s({ trig = "eqv", snippetType = "autosnippet" }, {
    t("\\equiv"),
  }, { condition = tex.in_math }),
  s({ trig = "##", wordTrig = false, snippetType = "autosnippet" }, {
    t("\\# "),
  }, { condition = tex.in_math }),
  s({ trig = "oti", snippetType = "autosnippet" }, {
    t("\\otimes"),
  }, { condition = tex.in_math }),
  s({ trig = "opl", snippetType = "autosnippet" }, {
    t("\\oplus"),
  }, { condition = tex.in_math }),
  s({ trig = "not", snippetType = "autosnippet", priority = 2000 }, {
    t("\\not"),
  }, { condition = tex.in_math }),
  s({ trig = "par", snippetType = "autosnippet", priority = 2000 }, {
    t("\\partial"),
  }, { condition = tex.in_math }),
  s({ trig = "0set", snippetType = "autosnippet", priority = 2000 }, {
    t("\\varnothing"),
  }, { condition = tex.in_math }),
  s({ trig = "hom", snippetType = "autosnippet" }, {
    t("\\hom"),
  }, { condition = tex.in_math }),
  s({ trig = "dim", snippetType = "autosnippet" }, {
    t("\\dim"),
  }, { condition = tex.in_math }),
}
