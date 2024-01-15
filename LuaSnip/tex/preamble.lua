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
local line_begin = require("luasnip.extras.expand_conditions").line_begin
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
local tex = require("util.conditions")
M = {
  s({ trig = "pkg", snippetType = "autosnippet" }, {
    t("\\usepackage{"),
    i(1),
    t("}"),
  }, { condition = tex.in_preamble * line_begin }),
  s(
    { trig = "(%d?)(r?)env", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
    \<>newenvironment{<>}<>%
    {<>}%
    {<>}
    ]],
      {
        f(function(_, snip)
          return snip.captures[2] ~= "" and "re" or ""
        end),
        i(1),
        f(function(_, snip)
          return snip.captures[1] ~= "" and "[" .. snip.captures[1] .. "]" or ""
        end),
        i(2),
        i(3),
      }
    ),
    { condition = tex.in_preamble * line_begin }
  ),
  s(
    { trig = "(%d?)(r?)cmd", regTrig = true, snippetType = "autosnippet" },
    fmta("\\<>newcommand{\\<>}<>{<>}", {
      f(function(_, snip)
        return snip.captures[2] ~= "" and "re" or ""
      end),
      i(1),
      f(function(_, snip)
        return snip.captures[1] ~= "" and "[" .. snip.captures[1] .. "]" or ""
      end),
      i(2),
    }),
    { condition = tex.in_preamble * line_begin }
  ),
}
return M
