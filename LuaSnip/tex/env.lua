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
    { trig = "jj", snippetType = "autosnippet" },
    fmta(
      [[
      \(<>\)<>
      ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = tex.in_text }
  ),
  s(
    { trig = "tt", snippetType = "autosnippet" },
    fmta(
      [[
      \[
        <>
      \]
      ]],
      {
        i(1),
      }
    ),
    { condition = tex.in_text }
  ),
  s(
    { trig = "beg" },
    fmta(
      [[
      \begin{<>}[<>]
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        i(0),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "ben" },
    fmta(
      [[
      \begin{enumerate}
        \item <>
      \end{enumerate}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "box" },
    fmta(
      [[
      \begin{framed}
        <>
      \end{framed}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex.in_text * line_begin }
  ),
  s(
    { trig = "bal" },
    fmta(
      [[
      \begin{aligned}
        <>
      \end{aligned}
      ]],
      {
        i(0),
      }
    ),
    { condition = tex.in_math }
  ),
  s(
    { trig = "bal", snippetType = "autosnippet", priority = 2000 },
    fmta(
      [[
      \begin{aligned}
        <>
      \end{aligned}
      ]],
      {
        d(1, get_visual),
      }
    ),
    { condition = tex.in_math }
  ),
  s({ trig = "  item", snippetType = "autosnippet" }, {
    t("\\item"),
  }, { condition = tex.in_item * line_begin }),
  s(
    { trig = "bcr", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{center}
        <>
      \end{center}
      ]],
      {
        i(0),
      }
    ),
    { condition = line_begin }
  ),
  s(
    { trig = "btr", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{tabular}{<>}
        \hline
        <>
        \hline
      \end{tabular}
      ]],
      {
        i(1),
        i(0),
      }
    ),
    { condition = line_begin }
  ),
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
    { condition = line_begin }
  ),
}
