local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- [
-- personal imports
-- ]
local tex = require("util.conditions")
local auto_backslash_snippet = require("util.scaffolding").auto_backslash_snippet
local symbol_snippet = require("util.scaffolding").symbol_snippet
local single_command_snippet = require("util.scaffolding").single_command_snippet
local postfix_snippet = require("util.scaffolding").postfix_snippet
M = {}
local greek_specs = {
  alp = [[\alpha]],
  ale = [[\aleph]],
  bet = [[\beta]],
  gam = [[\gamma]],
  Gam = [[\Gamma]],
  del = [[\delta]],
  Del = [[\Delta]],
  eps = [[\varepsilon]],
  Eps = [[\Epsilon]],
  zet = [[\zeta]],
  Zet = [[\Zeta]],
  eta = [[\eta]],
  Eta = [[\Eta]],
  the = [[\theta]],
  The = [[\Theta]],
  iot = [[\iota]],
  Iot = [[\Iota]],
  kap = [[\kappa]],
  Kap = [[\Kappa]],
  lam = [[\lambda]],
  Lam = [[\Lambda]],
  mu = [[\mu]],
  Mu = [[\Mu]],
  nu = [[\nu]],
  Nu = [[\Nu]],
  xi = [[\xi]],
  Xi = [[\Xi]],
  omi = [[\omicron]],
  pi = [[\pi]],
  Pi = [[\Pi]],
  rho = [[\rho]],
  Rho = [[\Rho]],
  sig = [[\sigma]],
  Sig = [[\Sigma]],
  tau = [[\tau]],
  Tau = [[\Tau]],
  phi = [[\phi]],
  Phi = [[\Phi]],
  vhi = [[\varphi]],
  psi = [[\psi]],
  Psi = [[\Psi]],
  ome = [[\omega]],
  Ome = [[\Omega]],
}

local greek_snippets = {}
for k, v in pairs(greek_specs) do
  table.insert(
    greek_snippets,
    s(
      { trig = "([_^])" .. k, wordTrig = false, snippetType = "autosnippet", regTrig = true },
      fmta("<>" .. v .. "<>", {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
  table.insert(
    greek_snippets,
    s(
      { trig = k, snippetType = "autosnippet", regTrig = true },
      fmta(v .. "<>", {
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
end
vim.list_extend(M, greek_snippets)
return M
