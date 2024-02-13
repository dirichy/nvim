local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex = require("util.conditions")
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {
  s(
    { trig = "cha" },
    fmta(
      [[
        \chapter{<>}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "par" },
    fmta(
      [[
        \paragraph{<>}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "sec" },
    fmta(
      [[
        \section{<>}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "ssec" },
    fmta(
      [[
        \subsection{<>}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "sss" },
    c(1, { sn(nil, { t("\\subsubsection{"), i(1), t("}") }), sn(nil, { t("\\subsubsection*{"), i(1), t("}") }) }),
    { condition = tex.in_text }
  ),
  s(
    { trig = "sss" },
    fmta(
      [[
        \subsubsection{<>}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin * tex.in_text }
  ),
}
