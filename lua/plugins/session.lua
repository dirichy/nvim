return {
  "rmagatti/auto-session",
  config = function()
    local function SessionRestore()
      require("auto-session").RestoreSession(vim.fn.getcwd())
    end
    require("auto-session").setup({
      log_level = "info",
      -- auto_save_enabled = true,
      -- auto_restore_enabled = true,
    })
    vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Save Session" })
    vim.keymap.set("n", "<leader>qc", SessionRestore, { desc = "Load Session of CWD" })
    vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Delete Session of CWD" })
    vim.keymap.set("n", "<leader>qs", "<cmd>Autosession search<cr>", { desc = "Search Session to Load" })
    vim.api.nvim_create_autocmd("VimLeavePre", {
      pattern = "*",
      callback = function()
        vim.cmd([[Neotree close]])
        vim.cmd([[SessionSave]])
      end,
    })
    --   vim.api.nvim_create_autocmd("CursorHold", {
    --     pattern = "*",
    --     callback = function()
    --       local bf = require("bufferline.commands")
    --       local buffers = bf.get_elements().elements
    --       vim.print(buffers)
    --       for _, buffer in ipairs(buffers) do
    --         print(buffer.name)
    --         if string.match(buffer.name, "/$") then
    --           bf.unpin_and_close(buffer.id)
    --         end
    --         if string.match(buffer.name, "No Name") then
    --           bf.unpin_and_close(buffer.id)
    --         end
    --       end
    --     end,
    --   })
  end,
}
