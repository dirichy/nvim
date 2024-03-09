local M = {}
M.cmd = function(cmd, default)
  local handle = io.popen(cmd)
  local output = default
  if handle ~= nil then
    output = handle:read("*a")
    handle:close()
  end
  return output
end
return M
