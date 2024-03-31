local M = require("latex.phonetic")
for k, v in pairs(M.phone) do
  if k == '"' then
    vim.cmd([[syntax match BWTIPA "\"" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
  else
    vim.cmd([[syntax match BWTIPA "]] .. k .. [[" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
  end
end
for k, v in pairs(M.fphone) do
  if k == '"' then
    vim.cmd([[syntax match BWTIPA "\"" containedin=texCMyftipaArg contained conceal cchar=]] .. v.conceal)
  else
    vim.cmd([[syntax match BWTIPA "]] .. k .. [[" containedin=texCMyftipaArg contained conceal cchar=]] .. v.conceal)
  end
end
vim.cmd([[syntax match SpaceInMath " " containedin=texMathZoneLI contained conceal]])
vim.cmd([[syntax match SpaceInMath " " containedin=texMathZoneEnv contained conceal]])
vim.cmd([[syntax match SpaceInMath " " containedin=texMathZoneLD contained conceal]])
