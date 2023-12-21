-- [
-- snip_env + autosnippets
-- ]
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
local line_begin = require("luasnip.extras.conditions.expand").line_begin
local Operators = {
  band = "bigwedge",
  bcap = "bigcap",
  bcup = "bigcup",
  bodot = "bigodot",
  bopl = "bigoplus",
  bor = "bigvee",
  boti = "bigotimes",
  bscup = "bigsqcup",
  iiint = "iiint",
  iint = "iint",
  int = "int",
  oint = "oint",
  prod = "prod",
  sum = "sum",
}
M = {
  s({ trig = "\\int", priority = 2000, snippetType = "autosnippet" }, {
    t("\\int.."),
  }, { condition = tex.in_math }),
}
for k, v in pairs(Operators) do
  table.insert(
    M,
    s({ trig = k, snippetType = "autosnippet" }, {
      t("\\" .. v .. ".."),
    }, { condition = tex.in_math })
  )
  --  table.insert(
  --    M,
  --    s(
  --      { trig = "\\" .. v .. "(%a)", snippetType = "autosnippet", regTrig = true },
  --      fmta("\\" .. v .. "_{<><>}<>", {
  --        f(function(_, snip)
  --          return snip.captures[1]
  --        end),
  --        i(1),
  --        i(0),
  --      }),
  --      { condition = tex.in_math }
  --    )
  --  )
  table.insert(
    M,
    s(
      { trig = "\\" .. v .. ".. ", snippetType = "autosnippet", regTrig = true },
      t("\\" .. v .. " "),
      { condition = tex.in_math }
    )
  )
  table.insert(
    M,
    s(
      { trig = "\\" .. v .. "(_%b{})([%a%d])", snippetType = "autosnippet", regTrig = true },
      fmta("\\" .. v .. "<><><><><><>", {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          local str = snip.captures[1]
          str = str:gsub("^_{(.-)}$", "%1")
          str = str:gsub("{.*}", "")
          return string.find(str, "=") and "^{" or ""
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(1),
        f(function(_, snip)
          local str = snip.captures[1]
          str = str:gsub("^_{(.-)}$", "%1")
          str = str:gsub("{.*}", "")
          return string.find(str, "=") and "}" or ""
        end),
        i(0),
      }),
      { condition = tex.in_math }
    )
  )
end
return M
