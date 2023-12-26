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

-- [
-- personal imports
-- ]
local tex = require("util.conditions")
local auto_backslash_snippet = require("util.scaffolding").auto_backslash_snippet
local symbol_snippet = require("util.scaffolding").symbol_snippet
local single_command_snippet = require("util.scaffolding").single_command_snippet
local postfix_snippet = require("util.scaffolding").postfix_snippet
local text_line_begin_leader = "."
local envs = {
  pf = { name = "proof", condition = 2 },
  so = { name = "solution", condition = 2 },
  ex = { name = "exercise", condition = 2, label = "exe" },
  cr = { name = "center", condition = 2 },
  pr = { name = "problem", condition = 2, label = "pro" },
  le = { name = "lemma", condition = 2, label = "lem" },
  en = { name = "enumerate", condition = 2, item = true },
  it = { name = "itemize", condition = 2, item = true },
  eq = { name = "equation", condition = 2, label = "equ" },
}
local make_label = function(_, snip)
  local env = envs[snip.captures[1]]
  local label = env.label
  if label then
    return sn(nil, {
      f(function(args, _)
        if args[1][1] ~= "" then
          return "\\label{" .. label .. ":"
        else
          return " "
        end
      end, { 1 }),
      i(1),
      f(function(args, _)
        if args[1][1] ~= "" then
          return "}"
        else
          return ""
        end
      end, { 1 }),
    })
  else
    return sn(nil, { t("") })
  end
end
M = {
  s(
    { trig = "%" .. text_line_begin_leader .. "(%a%a)", regTrig = true, snippetType = "autosnippet" },
    fmta(
      [[
\begin{<>}<>
  <><>
\end{<>}
<>
      ]],
      {
        f(function(_, snip)
          return envs[snip.captures[1]].name
        end),
        d(1, make_label),
        f(function(_, snip)
          if envs[snip.captures[1]].item then
            return "\\item "
          else
            return ""
          end
        end),
        i(2),
        f(function(_, snip)
          return envs[snip.captures[1]].name
        end),
        i(0),
      }
    ),
    { condition = tex.in_text * line_begin }
  ),
}
return M
