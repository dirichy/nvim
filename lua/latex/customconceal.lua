local phonetable = require("latex.phonetic")
local function conceal()
  for k, v in pairs(phonetable.phone) do
    if k == '"' then
      vim.cmd([[syntax match BWTIPA "\"" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
    else
      vim.cmd([[syntax match BWTIPA "]] .. k .. [[" containedin=texCMytipaArg contained conceal cchar=]] .. v.conceal)
    end
  end
  for k, v in pairs(phonetable.fphone) do
    if k == '"' then
      vim.cmd([[syntax match BWTIPA "\"" containedin=texCMyftipaArg contained conceal cchar=]] .. v.conceal)
    else
      vim.cmd([[syntax match BWTIPA "]] .. k .. [[" containedin=texCMyftipaArg contained conceal cchar=]] .. v.conceal)
    end
  end
  vim.cmd([[syntax match SpaceInMath "\s" containedin=texMath.* contained conceal]])
  vim.cmd([[syntax match IndentInMath "^\s*" containedin=texMath.* contained]])
end
return conceal
