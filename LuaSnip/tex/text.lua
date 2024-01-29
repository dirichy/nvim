local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("util.conditions")

return {
  s({ trig = "dps", snippetType = "autosnippet" }, {
    t("\\displaystyle"),
  }, { condition = tex.in_math }),
  s({ trig = "if" }, {
    t("\\text{\\ if\\ }"),
  }, { condition = tex.in_math }),
  s({ trig = "otherwise", snippetType = "autosnippet" }, {
    t("\\text{\\ otherwise\\ }"),
  }, { condition = tex.in_math }),
  s({ trig = "then" }, {
    t("\\text{\\ then\\ }"),
  }, { condition = tex.in_math }),
  s({ trig = "since" }, {
    t("\\text{\\ since\\ }"),
  }, { condition = tex.in_math }),

  s({ trig = "label", snippetType = "autosnippet" }, {
    t("\\label{"),
    i(0),
    t("}"),
  }, { condition = tex.in_text, show_condition = tex.in_text }),
  s({ trig = "cref", snippetType = "autosnippet" }, {
    t("\\Cref{"),
    i(0),
    t("}"),
  }, { condition = tex.in_text, show_condition = tex.in_text }),
  s(
    { trig = "href", snippetType = "autosnippet" },
    fmta("\\href{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_text }
  ),

  s({ trig = "wlog", snippetType = "autosnippet" }, {
    t("without loss of generality"),
  }, { condition = tex.in_text }),
  s({ trig = "Wlog", snippetType = "autosnippet" }, {
    t("Without loss of generality"),
  }, { condition = tex.in_text }),
  s({ trig = "thm" }, {
    t("theorem"),
  }, { condition = tex.in_text }),
  s({ trig = "propp" }, {
    t("proposition"),
  }, { condition = tex.in_text }),
  s({ trig = "deff" }, {
    t("definition"),
  }, { condition = tex.in_text }),
  s({ trig = "exaa" }, {
    t("example"),
  }, { condition = tex.in_text }),
  s({ trig = "iee" }, {
    t("i.e."),
  }, { condition = tex.in_text }),
  s({ trig = "stt" }, {
    t("such that"),
  }, { condition = tex.in_text }),
  s({ trig = "iff" }, {
    t("if and only if"),
  }, { condition = tex.in_text }),
  s({ trig = "iso" }, {
    t("isomorphic"),
  }, { condition = tex.in_text }),
  s({ trig = "iso" }, {
    t("isomorphism"),
  }, { condition = tex.in_text }),
  s({ trig = "homo" }, {
    t("homomorphism"),
  }, { condition = tex.in_text }),
  s({ trig = "homo" }, {
    t("homomorphic"),
  }, { condition = tex.in_text }),
  -- s({ trig = "psp", snippetType = "autosnippet" }, {
  --   t("\\(p\\)-subgroup"),
  -- }, { condition = tex.in_text }),
  -- s({ trig = "pgp", snippetType = "autosnippet" }, {
  --   t("\\(p\\)-subgroup"),
  -- }, { condition = tex.in_text }),
  -- s({ trig = "spsp", snippetType = "autosnippet" }, {
  --   t("Sylow \\(p\\)-subgroup"),
  -- }, { condition = tex.in_text }),
}
