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

local cmd2char = {
  ["in"] = [[\in]],
  ["xx"] = [[\times]],
  ["to"] = [[\to]],
  ["Mu"] = [[\Mu]],
  ["mu"] = [[\mu]],
  ["Nu"] = [[\Nu]],
  ["nu"] = [[\nu]],
  ["Pi"] = [[\Pi]],
  ["pi"] = [[\pi]],
  ["Xi"] = [[\Xi]],
  ["xi"] = [[\xi]],
}
local cmd3char = {
  ["in "] = [[\in ]],
  ["xx "] = [[\times ]],
  ["to "] = [[\to ]],
  ["Mu "] = [[\Mu ]],
  ["mu "] = [[\mu ]],
  ["Nu "] = [[\Nu ]],
  ["nu "] = [[\nu ]],
  ["Pi "] = [[\Pi ]],
  ["pi "] = [[\pi ]],
  ["Xi "] = [[\Xi ]],
  ["xi "] = [[\xi ]],
  ["Zet"] = [[\Zeta]],
  ["zet"] = [[\zeta]],
  ["Psi"] = [[\Psi]],
  ["psi"] = [[\psi]],
  ["Rho"] = [[\Rho]],
  ["rho"] = [[\rho]],
  ["Sig"] = [[\Sigma]],
  ["sig"] = [[\sigma]],
  ["Tau"] = [[\Tau]],
  ["tau"] = [[\tau]],
  ["The"] = [[\Theta]],
  ["the"] = [[\theta]],
  ["vhi"] = [[\varphi]],
  ["Ome"] = [[\Omega]],
  ["ome"] = [[\omega]],
  ["omi"] = [[\omicron]],
  ["Phi"] = [[\Phi]],
  ["phi"] = [[\phi]],
  ["ale"] = [[\aleph]],
  ["alp"] = [[\alpha]],
  ["bet"] = [[\beta]],
  ["chi"] = [[\chi]],
  ["Del"] = [[\Delta]],
  ["del"] = [[\delta]],
  ["Eps"] = [[\Epsilon]],
  ["eps"] = [[\varepsilon]],
  ["Eta"] = [[\Eta]],
  ["eta"] = [[\eta]],
  ["Gam"] = [[\Gamma]],
  ["gam"] = [[\gamma]],
  ["Iot"] = [[\Iota]],
  ["iot"] = [[\iota]],
  ["Kap"] = [[\Kappa]],
  ["kap"] = [[\kappa]],
  ["Lam"] = [[\Lambda]],
  ["lam"] = [[\lambda]],
  ["or "] = [[\or ]],
  ["and"] = [[\and]],
  ["iff"] = [[\iff]],
  ["nin"] = [[\notin]],
  ["aa "] = [[\forall ]],
  ["ee "] = [[\exists ]],
  ["dd "] = [[\d ]],
  ["neq"] = [[\neq]],
  ["leq"] = [[\leq]],
  ["geq"] = [[\geq]],
  ["apx"] = [[\approx]],
  ["sim"] = [[\sim]],
  ["mto"] = [[\mapsto]],
  ["ker"] = [[\ker]],
  ["smn"] = [[\setminus]],
  ["mid"] = [[\mid]],
  ["pm "] = [[\pm ]],
  ["mp "] = [[\mp ]],
  ["rhs"] = [[\mathrm{R.H.S}]],
  ["lhs"] = [[\mathrm{L.H.S}]],
  ["cap"] = [[\cap]],
  ["cup"] = [[\cup]],
  ["sub"] = [[\subset]],
  ["ple"] = [[\prec]],
  ["ifn"] = [[\infty]],
  ["llr"] = [[\longleftrightarrow]],
  ["iso"] = [[\cong]],
  ["eqv"] = [[\equiv]],
  ["oti"] = [[\otimes]],
  ["opl"] = [[\oplus]],
  ["oad"] = [[\oplus]],
  ["add"] = [[+]],
  ["not"] = [[\not]],
  ["par"] = [[\partial]],
  ["hom"] = [[\hom]],
  ["dim"] = [[\dim]],
  ["arg"] = [[\arg]],
  ["set"] = [[\set]],
  ["ord"] = [[\ord]],
  ["sin"] = [[\sin]],
  ["cos"] = [[\cos]],
  ["tan"] = [[\tan]],
  ["cot"] = [[\cot]],
  ["csc"] = [[\csc]],
  ["sec"] = [[\sec]],
  ["log"] = [[\log]],
  ["ln "] = [[\ln ]],
  ["max"] = [[\max]],
  ["min"] = [[\min]],
  ["exp"] = [[\exp]],
  ["mod"] = [[\mod]],
  ["sgn"] = [[\sgn]],
  ["gcd"] = [[\gcd]],
  ["lcm"] = [[\lcm]],
  ["deg"] = [[\deg]],
  ["lim"] = [[\lim]],
  ["sup"] = [[\sup]],
  ["inf"] = [[\inf]],
  ["dom"] = [[\dom]],
  ["ran"] = [[\ran]],
  ["img"] = [[\im]],
  ["rel"] = [[\re]],
}
local cmd4char = {
  ["card"] = [[\card]],
  ["asin"] = [[\arcsin]],
  ["acos"] = [[\arccos]],
  ["asec"] = [[\arcsec]],
  ["atan"] = [[\arctan]],
  ["acot"] = [[\arccot]],
  ["acsc"] = [[\arccsc]],
  ["span"] = [[\Span]],
  ["nmid"] = [[\nmid]],
  ["ssub"] = [[\sqsubset]],
  ["prec"] = [[\prec]],
  ["perp"] = [[\perp]],
  ["circ"] = [[\circ]],
  ["cong"] = [[\cong]],
  ["oset"] = [[\emptyset]],
}
local M = {
  -- add cmd3char
  s({ trig = "%f[%a\\](%a%a[%a ])", regTrig = true, priority = 100, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd3char[snip.captures[1]]
      return out or snip.captures[1]
    end),
  }, { condition = tex.in_math }),
  -- add cmd2char and solve compact between cmd2cahr and cmd3char
  s({ trig = "%f[%a\\](%a%a)([^%a%s%d])", regTrig = true, priority = 100, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd2char[snip.captures[1]]
      return (out or snip.captures[1]) .. snip.captures[2]
    end),
  }, { condition = tex.in_math }),
  s({ trig = "%f[%a\\](%a%a)([%d])", regTrig = true, priority = 100, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd2char[snip.captures[1]]
      return out and out .. [[_]] .. snip.captures[2] or snip.captures[1] .. snip.captures[2]
    end),
  }, { condition = tex.in_math }),
  -- add cmd4char
  s({ trig = "%f[%a\\](%a%a%a%a)", regTrig = true, priority = 100, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd4char[snip.captures[1]]
      return out or snip.captures[1]
    end),
  }, { condition = tex.in_math }),
}
-- solve compact between cmd3char and cmd4char
for k, v in pairs(cmd4char) do
  local last = string.sub(k, -1, -1)
  k = string.sub(k, 1, 3)
  local cmd3 = cmd3char[k]
  if cmd3 then
    table.insert(
      M,
      s({ trig = cmd3 .. last, priority = 2000, snippetType = "autosnippet" }, {
        t(v),
      }, { condition = tex.in_math })
    )
  end
end
return M
