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
M = {
  autosnippet(
    {
      trig = "([%a%)%]|}])(%d)",
      wordTrig = true,
      regTrig = true,
      hidden = true,
    },
    fmta(
      [[
   <>_<><>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math, show_condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "(\\[^%(%[][%a%d%[%]{}]-[%a}%]])(%d)",
      regTrig = true,
      hidden = true,
    },
    fmta(
      [[
   <>_<><>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%)}%]])_([^{][%d%a]+) ",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>_{<>} <>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%d%)}%]])^([^{][%d%a]+) ",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>^{<>} <>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%)}%]|])%.([%a%d])",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>_<><>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%d%)}%]|])'([%a%d%*])",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>^<><>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%)}%]|])%.%.([^%.%s])",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>_{<><>} <>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%d%)}%]|])''([^%.%s])",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>^{<><>} <>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        f(function(_, snip)
          return snip.captures[2]
        end),
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  autosnippet(
    {
      trig = "([%a%d%)}%]|])`",
      regTrig = true,
      wordTrig = false,
      hidden = true,
    },
    fmta(
      [[
   <>^{(<>)} <>
    ]],
      {
        f(function(_, snip)
          return snip.captures[1]
        end),
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_math, show_condition = tex.in_math }
  ),
}
return M
