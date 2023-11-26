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
  alp = { context = { snippetType = "autosnippet" }, command = [[\alpha]] },
  bet = { context = { snippetType = "autosnippet" }, command = [[\beta]] },
  gam = { context = { snippetType = "autosnippet" }, command = [[\gamma]] },
  Gam = { context = { snippetType = "autosnippet" }, command = [[\Gamma]] },
  del = { context = { snippetType = "autosnippet" }, command = [[\delta]] },
  Del = { context = { snippetType = "autosnippet" }, command = [[\Delta]] },
  eps = { context = { snippetType = "autosnippet" }, command = [[\varepsilon]] },
  Eps = { context = { snippetType = "autosnippet" }, command = [[\Epsilon]] },
  zet = { context = { snippetType = "autosnippet" }, command = [[\zeta]] },
  Zet = { context = { snippetType = "autosnippet" }, command = [[\Zeta]] },
  eta = { context = { snippetType = "autosnippet" }, command = [[\eta]] },
  Eta = { context = { snippetType = "autosnippet" }, command = [[\Eta]] },
  the = { context = { snippetType = "autosnippet" }, command = [[\theta]] },
  The = { context = { snippetType = "autosnippet" }, command = [[\Theta]] },
  iot = { context = { snippetType = "autosnippet" }, command = [[\iota]] },
  Iot = { context = { snippetType = "autosnippet" }, command = [[\Iota]] },
  kap = { context = { snippetType = "autosnippet" }, command = [[\kappa]] },
  Kap = { context = { snippetType = "autosnippet" }, command = [[\Kappa]] },
  lam = { context = { snippetType = "autosnippet" }, command = [[\lambda]] },
  Lam = { context = { snippetType = "autosnippet" }, command = [[\Lambda]] },
  mu = { context = { snippetType = "autosnippet" }, command = [[\mu]] },
  Mu = { context = { snippetType = "autosnippet" }, command = [[\Mu]] },
  nu = { context = { snippetType = "autosnippet" }, command = [[\nu]] },
  Nu = { context = { snippetType = "autosnippet" }, command = [[\Nu]] },
  xi = { context = { snippetType = "autosnippet" }, command = [[\xi]] },
  Xi = { context = { snippetType = "autosnippet" }, command = [[\Xi]] },
  omi = { context = { snippetType = "autosnippet" }, command = [[\omicron]] },
  pi = { context = { snippetType = "autosnippet" }, command = [[\pi]] },
  Pi = { context = { snippetType = "autosnippet" }, command = [[\Pi]] },
  rho = { context = { snippetType = "autosnippet" }, command = [[\rho]] },
  Rho = { context = { snippetType = "autosnippet" }, command = [[\Rho]] },
  sig = { context = { snippetType = "autosnippet" }, command = [[\sigma]] },
  Sig = { context = { snippetType = "autosnippet" }, command = [[\Sigma]] },
  tau = { context = { snippetType = "autosnippet" }, command = [[\tau]] },
  Tau = { context = { snippetType = "autosnippet" }, command = [[\Tau]] },
  phi = { context = { snippetType = "autosnippet" }, command = [[\phi]] },
  Phi = { context = { snippetType = "autosnippet" }, command = [[\Phi]] },
  vhi = { context = { snippetType = "autosnippet" }, command = [[\varphi]] },
  psi = { context = { snippetType = "autosnippet" }, command = [[\psi]] },
  Psi = { context = { snippetType = "autosnippet" }, command = [[\Psi]] },
  ome = { context = { snippetType = "autosnippet" }, command = [[\omega]] },
  Ome = { context = { snippetType = "autosnippet" }, command = [[\Omega]] },
}

local greek_snippets = {}
for k, v in pairs(greek_specs) do
  table.insert(
    greek_snippets,
    symbol_snippet(vim.tbl_deep_extend("keep", { trig = k }, v.context), v.command, { condition = tex.in_math })
  )
end
vim.list_extend(M, greek_snippets)
return M
