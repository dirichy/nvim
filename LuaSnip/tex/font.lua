local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin
local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local tex = require("util.latex")

return {
  s(
    { trig = "msf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathsf{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "msf", snippetType = "autosnippet" },
    fmta("\\mathsf{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "cal(%w)", regTrig = true, snippetType = "autosnippet" },
    fmta("\\mathcal{<>}", {
      f(function(_, snip)
        return string.upper(snip.captures[1])
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "scr(%w)", regTrig = true, snippetType = "autosnippet" },
    fmta("\\mathscr{<>}", {
      f(function(_, snip)
        return string.upper(snip.captures[1])
      end),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathbb{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mbb", snippetType = "autosnippet" },
    fmta("\\mathbb{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathrm{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mrm", snippetType = "autosnippet" },
    fmta("\\mathrm{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "frk", snippetType = "autosnippet", priority = 2000 },
    fmta("\\mathfrak{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "frk", snippetType = "autosnippet" },
    fmta("\\mathfrak{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "tit", snippetType = "autosnippet", priority = 2000 },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tit", snippetType = "autosnippet" },
    fmta("\\textit{<>}", {
      i(0),
    })
  ),
  s(
    { trig = "ttt", snippetType = "autosnippet" },
    fmta("\\texttt{<>}", {
      i(0),
    })
  ),
  s(
    { trig = "tbf", snippetType = "autosnippet", priority = 2000 },
    fmta("\\textbf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "tbf", snippetType = "autosnippet" },
    fmta("\\textbf{<>}", {
      i(0),
    })
  ),
  s(
    { trig = "tet", snippetType = "autosnippet", priority = 2000 },
    fmta("\\text{\\ <>\\ }", {
      d(1, get_visual),
    }, { condition = tex.in_mathzone })
  ),
  s(
    { trig = "tet", snippetType = "autosnippet" },
    fmta("\\text{<>}", {
      i(0),
    })
  ),
}
