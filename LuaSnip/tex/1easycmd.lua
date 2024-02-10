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
local makesnip = function(_, snip, _, con, var)
  local key = snip.captures[1]
  local out = con[key]
  if not out then
    for k, v in pairs(var) do
      if string.match(key, k) then
        out = string.gsub(key, k, v)
        break
      end
    end
  end
  if not out then
    return sn(nil, { t(key) })
  end
  local _, count = string.gsub(out, "<>", "<>")
  if count == 0 then
    return sn(nil, { t(out) })
  else
    local nodes = {}
    for index = 1, count do
      table.insert(nodes, i(index))
    end
    return sn(nil, fmta(out, nodes))
  end
end

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
  ["vec"] = [[\vec{<>}]],
  ["abs"] = [[|<>|]],
  ["dot"] = [[\dot{<>}]],
  ["tdl"] = [[\tidle{<>}]],
  ["hat"] = [[\hat{<>}]],
  ["fun"] = [[\fun{<>}{<>}]],
  ["bar"] = [[\overline{<>}]],
  ["res"] = [[\res{<>}{<>}]],
  ["bor"] = [[\bigvee..]],
  ["int"] = [[\int..]],
  ["sum"] = [[\sum..]],
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
local cmd3charwithcom = {
  ["bb(%a)"] = function(char)
    return [[\mathbb{]] .. string.upper(char) .. "}"
  end,
  ["bm(%a)"] = function(char)
    return [[\mathbbm{]] .. string.upper(char) .. "}"
  end,
  ["bf(%a)"] = [[\mathbf{%1}]],
  ["rm(%a)"] = [[\mathrm{%1}]],
  ["fk(%a)"] = [[\mathfrak{%1}]],
  ["te(%a)"] = [[\text{%1}]],
}
local cmd4char = {
  ["sqrt"] = [[\sqrt{<>}]],
  ["iiit"] = [[\iiint..]],
  ["bscp"] = [[\bigsqcup..]],
  ["bodt"] = [[\bigodot..]],
  ["band"] = [[\bigwedge..]],
  ["bcap"] = [[\bigcap..]],
  ["bcup"] = [[\bigcup..]],
  ["bopl"] = [[\bigoplus..]],
  ["boti"] = [[\bigotimes..]],
  ["iint"] = [[\iint..]],
  ["oint"] = [[\oint..]],
  ["prod"] = [[\prod..]],
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
local cmd4charwithcom = {
  ["(%a)fun"] = [[\fun{%1}{<>}]],
  ["(%a)res"] = [[\res{%1}{<>}]],
  ["cal(%a)"] = function(char)
    return [[\mathcal{]] .. string.upper(char) .. "}"
  end,
  ["scr(%a)"] = function(char)
    return [[\mathscr{]] .. string.upper(char) .. "}"
  end,
  ["frk(%a)"] = [[\mathfrak{%1}]],
  ["(%a)bar"] = [[\overline{%1}]],
  ["(%a)hat"] = [[\hat{%1}]],
  ["(%a)tdl"] = [[\tilde{%1}]],
  ["(%a)vec"] = [[\vec{%1}]],
  ["(%a)dot"] = [[\dot{%1}]],
}
local M = {
  -- add cmd3char
  s({ trig = "%f[%a\\](%a%a[%a ])", regTrig = true, priority = 500, snippetType = "autosnippet" }, {
    d(1, makesnip, {}, { user_args = { cmd3char, cmd3charwithcom } }),
    -- f(function(_, snip)
    --   local out = cmd3char[snip.captures[1]]
    --   return out or snip.captures[1]
    -- end),
  }, { condition = tex.in_math }),
  -- add cmd2char and solve compact between cmd2cahr and cmd3char
  s({ trig = "%f[%a\\](%a%a)([^%a%s%d])", regTrig = true, priority = 500, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd2char[snip.captures[1]]
      return (out or snip.captures[1]) .. snip.captures[2]
    end),
  }, { condition = tex.in_math }),
  s({ trig = "%f[%a\\](%a%a)([%d])", regTrig = true, priority = 500, snippetType = "autosnippet" }, {
    f(function(_, snip)
      local out = cmd2char[snip.captures[1]]
      return out and out .. [[_]] .. snip.captures[2] or snip.captures[1] .. snip.captures[2]
    end),
  }, { condition = tex.in_math }),
  -- add cmd4char
  s({ trig = "%f[%a\\](%a%a%a%a)", regTrig = true, priority = 500, snippetType = "autosnippet" }, {
    d(1, makesnip, {}, { user_args = { cmd4char, cmd4charwithcom } }),
    -- f(function(_, snip)
    --   local out = cmd4char[snip.captures[1]]
    --   return out or snip.captures[1]
    -- end),
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
      s({ trig = cmd3 .. last, priority = 500, snippetType = "autosnippet" }, {
        t(v),
      }, { condition = tex.in_math })
    )
  end
  for pattern, output in pairs(cmd3charwithcom) do
    if string.match(k, pattern) then
      cmd3 = string.gsub(k, pattern, output)
      table.insert(
        M,
        s({ trig = cmd3 .. last, snippetType = "autosnippet" }, {
          t(v),
        }, { condition = tex.in_math })
      )
    end
  end
end
-- for k, v in pairs(cmd3charwithcom) do
--   table.insert(
--     M,
--     s({ trig = k, regTrig = true, priority = 1000, snippetType = "autosnippet" }, {
--       f(function(_, snip)
--         return string.gsub(snip.captures[1], "^(%a*)$", v)
--       end),
--     }, { condition = tex.in_math })
--   )
-- end
-- for k, v in pairs(cmd4charwithcom) do
--   table.insert(
--     M,
--     s({ trig = k, regTrig = true, priority = 1000, snippetType = "autosnippet" }, {
--       f(function(_, snip)
--         return string.gsub(snip.captures[1], "^(%a*)$", v)
--       end),
--     }, { condition = tex.in_math })
--   )
-- end
table.insert(
  M,
  s({ trig = "\\mathbb{A}r", snippetType = "autosnippet" }, {
    t("\\overline{b}"),
  }, { condition = tex.in_math })
)
return M
