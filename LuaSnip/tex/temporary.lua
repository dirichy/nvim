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
  -- s({ trig = "sp", snippetType = "autosnippet" }, fmta("\\hat{\\$}", {}), { condition = tex.in_mathzone }),
  -- s({ trig = "T", snippetType = "autosnippet" }, fmta("\\mathcal{T}", {}), { condition = tex.in_mathzone }),
  -- s({ trig = "tv", snippetType = "autosnippet" }, fmta("\\mathrm{TV}", {}), { condition = tex.in_mathzone }),
  -- s({ trig = "ce", snippetType = "autosnippet" }, fmta("\\mathrm{couple}", {}), { condition = tex.in_mathzone }),
  -- s({ trig = "mix", snippetType = "autosnippet" }, fmta("\\mathrm{mix}", {}), { condition = tex.in_mathzone }),

  s(
    { trig = "norm", snippetType = "autosnippet" },
    fmta("\\norm{<>}", {
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "ipro", regTrig = true, snippetType = "autosnippet", priority = 3000 },
    fmta("\\langle <> , <> \\rangel", {
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "dom", snippetType = "autosnippet" }, {
    t("\\dom"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ran", snippetType = "autosnippet" }, {
    t("\\ran"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "mad", snippetType = "autosnippet" }, {
    t("\\madd"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "img", snippetType = "autosnippet" }, {
    t("\\im"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "rel", snippetType = "autosnippet" }, {
    t("\\re"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "cof", snippetType = "autosnippet" }, {
    t("\\cof"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "wp", snippetType = "autosnippet" }, {
    t("\\wp"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sym", snippetType = "autosnippet" }, {
    t("\\sym"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "odt", snippetType = "autosnippet" }, {
    t("\\odt"),
  }, { condition = tex.in_mathzone }),
}
