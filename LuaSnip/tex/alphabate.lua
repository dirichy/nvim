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
  s({ trig = "alp", snippetType = "autosnippet" }, {
    t("\\alpha"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Alp", snippetType = "autosnippet" }, {
    t("\\Alpha"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "bet", snippetType = "autosnippet" }, {
    t("\\beta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Bet", snippetType = "autosnippet" }, {
    t("\\Beta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "gam", snippetType = "autosnippet" }, {
    t("\\gamma"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Gam", snippetType = "autosnippet" }, {
    t("\\Gamma"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "del", snippetType = "autosnippet" }, {
    t("\\delta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Del", snippetType = "autosnippet" }, {
    t("\\Delta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "eps", snippetType = "autosnippet" }, {
    t("\\varepsilon"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "vep", snippetType = "autosnippet" }, {
    t("\\varepsilon"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Eps", snippetType = "autosnippet" }, {
    t("\\Epsilon"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "zet", snippetType = "autosnippet" }, {
    t("\\zeta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Zet", snippetType = "autosnippet" }, {
    t("\\Zeta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "eta", snippetType = "autosnippet" }, {
    t("\\eta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Eta", snippetType = "autosnippet" }, {
    t("\\Eta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "the", snippetType = "autosnippet" }, {
    t("\\theta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "The", snippetType = "autosnippet" }, {
    t("\\Theta"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "iot", snippetType = "autosnippet" }, {
    t("\\iota"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Iot", snippetType = "autosnippet" }, {
    t("\\Iota"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "kap", snippetType = "autosnippet" }, {
    t("\\kappa"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Kap", snippetType = "autosnippet" }, {
    t("\\Kappa"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "lam", snippetType = "autosnippet" }, {
    t("\\lambda"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Lam", snippetType = "autosnippet" }, {
    t("\\Lambda"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "mu ", snippetType = "autosnippet" }, {
    t("\\mu "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Mu ", snippetType = "autosnippet" }, {
    t("\\Mu "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "nu ", snippetType = "autosnippet" }, {
    t("\\nu "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Nu ", snippetType = "autosnippet" }, {
    t("\\Nu "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "xi ", snippetType = "autosnippet" }, {
    t("\\xi "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "x_ii", snippetType = "autosnippet" }, {
    t("\\xi_i"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\xi_ii", snippetType = "autosnippet" }, {
    t("x_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "x_{ii}i", snippetType = "autosnippet" }, {
    t("\\xi_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Xi ", snippetType = "autosnippet" }, {
    t("\\Xi "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "X_ii", snippetType = "autosnippet" }, {
    t("\\Xi_i"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\Xi_ii", snippetType = "autosnippet" }, {
    t("X_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "X_{ii}i", snippetType = "autosnippet" }, {
    t("\\Xi_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "omi", snippetType = "autosnippet" }, {
    t("\\omicron"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "pi ", snippetType = "autosnippet" }, {
    t("\\pi "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "p_ii", snippetType = "autosnippet" }, {
    t("\\pi_i"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\pi_ii", snippetType = "autosnippet" }, {
    t("p_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "p_{ii}i", snippetType = "autosnippet" }, {
    t("\\pi_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Pi ", snippetType = "autosnippet" }, {
    t("\\Pi "),
  }, { condition = tex.in_mathzone }),
  s({ trig = "P_ii", snippetType = "autosnippet" }, {
    t("\\Pi_i"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\Pi_ii", snippetType = "autosnippet" }, {
    t("P_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "P_{ii}i", snippetType = "autosnippet" }, {
    t("\\Pi_{ii}"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "rho", snippetType = "autosnippet" }, {
    t("\\rho"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Rho", snippetType = "autosnippet" }, {
    t("\\Rho"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "sig", snippetType = "autosnippet" }, {
    t("\\sigma"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Sig", snippetType = "autosnippet" }, {
    t("\\Sigma"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "tau", snippetType = "autosnippet" }, {
    t("\\tau"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Tau", snippetType = "autosnippet" }, {
    t("\\Tau"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ups", snippetType = "autosnippet" }, {
    t("\\ups"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Ups", snippetType = "autosnippet" }, {
    t("\\Ups"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "phi", snippetType = "autosnippet" }, {
    t("\\phi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\phii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\phii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Phi", snippetType = "autosnippet" }, {
    t("\\Phi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\Phii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\Phii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "vhi", snippetType = "autosnippet" }, {
    t("\\varphi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\vhii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\vhii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\Vhii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\Vhii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Vhi", snippetType = "autosnippet" }, {
    t("\\Varphi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "chi", snippetType = "autosnippet" }, {
    t("\\chi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Chi", snippetType = "autosnippet" }, {
    t("\\Chi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "psi", snippetType = "autosnippet" }, {
    t("\\psi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\psii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\psii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Psi", snippetType = "autosnippet" }, {
    t("\\Psi"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "\\Psii", snippetType = "autosnippet", priority = 2000 }, {
    t("\\Psii"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "ome", snippetType = "autosnippet" }, {
    t("\\omega"),
  }, { condition = tex.in_mathzone }),
  s({ trig = "Ome", snippetType = "autosnippet" }, {
    t("\\Omega"),
  }, { condition = tex.in_mathzone }),
}
