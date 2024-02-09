local find = function(envnames)
  local document = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local output = {}
  local temp = ""
  local flag = false
  for j, envname in ipairs(envnames) do
    output[envname] = {}
    for i, line in ipairs(document) do
      if flag then
        temp = temp .. line .. "\n"
      end
      if string.match(line, "\\begin{" .. envname .. "}") then
        temp = line .. "\n"
        flag = true
      end
      if string.match(line, "\\end{" .. envname .. "}") then
        flag = false
        temp = temp .. line
        table.insert(output[envname], temp)
      end
    end
  end
  return output
end
return find
