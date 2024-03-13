local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local tex = require("util.conditions")

return {
  -- s({ trig = "sp", snippetType = "autosnippet" }, fmta("\\hat{\\$}", {}), { condition = tex.in_math }),
  -- s({ trig = "T", snippetType = "autosnippet" }, fmta("\\mathcal{T}", {}), { condition = tex.in_math }),
  -- s({ trig = "tv", snippetType = "autosnippet" }, fmta("\\mathrm{TV}", {}), { condition = tex.in_math }),
  -- s({ trig = "ce", snippetType = "autosnippet" }, fmta("\\mathrm{couple}", {}), { condition = tex.in_math }),
  -- s({ trig = "mix", snippetType = "autosnippet" }, fmta("\\mathrm{mix}", {}), { condition = tex.in_math }),

  s(
    { trig = "norm", snippetType = "autosnippet" },
    fmta("\\norm{<>}", {
      i(1),
    }),
    { condition = tex.in_math }
  ),
  s(
    { trig = "ipro", regTrig = true, snippetType = "autosnippet", priority = 3000 },
    fmta("\\langle <> , <> \\rangel", {
      i(1),
      i(2),
    }),
    { condition = tex.in_math }
  ),
  s({ trig = "img", snippetType = "autosnippet" }, {
    t("\\im"),
  }, { condition = tex.in_math }),
  s({ trig = "rel", snippetType = "autosnippet" }, {
    t("\\re"),
  }, { condition = tex.in_math }),
  s({ trig = "cof", snippetType = "autosnippet" }, {
    t("\\cof"),
  }, { condition = tex.in_math }),
  s({ trig = "wp", snippetType = "autosnippet" }, {
    t("\\wp"),
  }, { condition = tex.in_math }),
  s({ trig = "sym", snippetType = "autosnippet" }, {
    t("\\sym"),
  }, { condition = tex.in_math }),
  s({ trig = "odt", snippetType = "autosnippet" }, {
    t("\\odt"),
  }, { condition = tex.in_math }),
}
