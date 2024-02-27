local phonetic_patterns = {
  "\\\\tipa{/\\zs[^}/]*\\ze/}",
  "\\\\begin{word}{[^}]*}{\\zs[^}]*\\ze}",
}
local phonetic_chars = {
  A = "𝘢",
}
for _, pattern in ipairs(phonetic_patterns) do
  print([[syntax match PHONETIC ']] .. pattern .. [[' contains=PHONETICCHAR]])
  vim.cmd([[syntax match PHONETIC ']] .. pattern .. [[' contains=PHONETICCHAR]])
end
for str, char in pairs(phonetic_chars) do
  print([[syntax match PHONETICCHAR ']] .. str .. [[' contained conceal cchar=]] .. char)
  vim.cmd([[syntax match PHONETICCHAR ']] .. str .. [[' contained conceal cchar=]] .. char)
end
