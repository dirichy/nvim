local M = {}
M.phone = {
  A = { tipa = "A", conceal = "𝘢", tirg = "a" },
  E = { tipa = "E", conceal = "ɛ" },
  I = { tipa = "I", conceal = "ɪ" },
  N = { tipa = "N", conceal = "ŋ", trig = "n" },
  O = { tipa = "O", conceal = "ɔ", trig = "o" },
  S = { tipa = "S", conceal = "ʃ", trig = "s" },
  T = { tipa = "T", conceal = "θ", trig = "st" },
  U = { tipa = "U", conceal = "ʊ", trig = "u" },
  Z = { tipa = "Z", conceal = "ʒ", trig = "r" },
  ["2"] = { tipa = "2", conceal = "ᴧ", trig = "a" },
  ["3"] = { tipa = "3", conceal = "ɜ", trig = "e" },
  [":"] = { tipa = ":", conceal = "ː" },
  ["@"] = { tipa = "@", conceal = "ə", trig = "e" },
  ['""'] = { tipa = '""', conceal = "ˌ" },
  ['"'] = { tipa = '"', conceal = "ˈ" },
  a = { tipa = "a", conceal = "𝖺" },
  b = { tipa = "b", conceal = "b" },
  c = { tipa = "c", conceal = "c" },
  d = { tipa = "d", conceal = "d" },
  e = { tipa = "e", conceal = "e" },
  f = { tipa = "f", conceal = "f" },
  g = { tipa = "g", conceal = "ɡ" },
  h = { tipa = "h", conceal = "h" },
  i = { tipa = "i", conceal = "i" },
  j = { tipa = "j", conceal = "j" },
  k = { tipa = "k", conceal = "k" },
  l = { tipa = "l", conceal = "l" },
  m = { tipa = "m", conceal = "m" },
  n = { tipa = "n", conceal = "n" },
  o = { tipa = "3", conceal = "ɜ", trig = "e" },
  p = { tipa = "p", conceal = "p" },
  q = { tipa = "\\dh ", conceal = "ð", trig = "zs" },
  r = { tipa = "r", conceal = "r" },
  s = { tipa = "s", conceal = "s" },
  t = { tipa = "t", conceal = "t" },
  u = { tipa = "u", conceal = "u" },
  v = { tipa = "v", conceal = "v" },
  w = { tipa = "w", conceal = "w" },
  x = { tipa = "\\ae ", conceal = "ᴂ", trig = "a" },
  y = { tipa = "2", conceal = "ᴧ", trig = "a" },
  z = { tipa = "z", conceal = "z" },
}
M.conceal = function()
  for k, v in pairs(M.phone) do
    if k == '"' then
      vim.cmd([[syntax match BWTIPA "\"" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
    elseif k == '""' then
      vim.cmd([[syntax match BWTIPA "\"\"" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
    else
      vim.cmd([[syntax match BWTIPA "]] .. k .. [[" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
    end
  end
end
return M
