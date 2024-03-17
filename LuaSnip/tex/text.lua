local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local tex = require("util.conditions")
local knowntypes = {
  pro = "Problem",
  fig = "Figure",
  lem = "Lemma",
  equ = "Equation",
}

return {
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
    i(1),
    t("}"),
  }, { condition = tex.in_text, show_condition = tex.in_text }),
  s(
    { trig = "cref", snippetType = "autosnippet" },
    fmta("\\<>ref{<>}", {
      f(function(args, _)
        if args[1][1] ~= "" then
          return "C"
        end
        return ""
      end, { 1 }),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "ref", snippetType = "autosnippet" }, {
    f(function(args, _)
      local label = args[1][1]
      local type = string.match(label, "^[^:]*")
      type = knowntypes[type] and knowntypes[type] .. " " or ""
      return type
    end, { 1 }),
    f(function(args, _)
      local label = args[1][1]
      local type = string.match(label, "^[^:]*")
      type = type == "equ" and "\\eqref{" or "\\ref{"
      return type
    end, { 1 }),
    i(1),
    t("}"),
  }, { condition = tex.in_text }),
  s(
    { trig = "href", snippetType = "autosnippet" },
    fmta("\\href{<>}{<>}", {
      i(1),
      i(2),
    }),
    { condition = tex.in_text }
  ),

  s({ trig = "wlog ", snippetType = "autosnippet" }, {
    t("without loss of generality "),
  }, { condition = tex.in_text }),
  s({ trig = "Wlog ", snippetType = "autosnippet" }, {
    t("Without loss of generality "),
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
