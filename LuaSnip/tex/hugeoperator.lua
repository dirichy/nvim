-- [
-- snip_env + autosnippets
-- ]
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta

-- [
-- personal imports
-- ]
local tex = require("util.conditions")
local Operators = {
  band = "bigwedge",
  bcap = "bigcap",
  bcup = "bigcup",
  bodt = "bigodot",
  bopl = "bigoplus",
  bor = "bigvee",
  boti = "bigotimes",
  bscp = "bigsqcup",
  iiit = "iiint",
  iint = "iint",
  int = "int",
  oint = "oint",
  prod = "prod",
  sum = "sum",
}
M = {}
for k, v in pairs(Operators) do
  -- table.insert(
  --   M,
  --   s({ trig = k, snippetType = "autosnippet" }, {
  --     t("\\" .. v .. ".."),
  --   }, { condition = tex.in_math })
  -- )
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
      { trig = "%f[^\\]" .. v .. "([%a%d%+%-])", snippetType = "autosnippet", regTrig = true },
      fmta(v .. "_{<><>}", {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
      }),
      { condition = tex.in_math }
    )
  )
  table.insert(
    M,
    s(
      { trig = "%f[^\\]" .. v .. "(_%b{})([%a%d])", snippetType = "autosnippet", regTrig = true },
      fmta(v .. "<><><><><><>", {
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
