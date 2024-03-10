return {
  "rmagatti/auto-session",
  config = function()
    vim.o.sessionoptions = "folds"
    require("auto-session").setup({
      log_level = "info",
      auto_save_enabled = true,
      auto_restore_enabled = true,
    })
    vim.keymap.set("n", "<leader>qs", "<cmd>SessionSave<cr>", { desc = "Save Session" })
    vim.keymap.set("n", "<leader>qc", "<cmd>SessionRestore<cr>", { desc = "Load Session of CWD" })
    vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<cr>", { desc = "Delete Session of CWD" })
    vim.keymap.set("n", "<leader>qs", "<cmd>Autosession search<cr>", { desc = "Search Session to Load" })
    vim.api.nvim_create_autocmd("VimLeavePre", {
      pattern = "*",
      callback = function()
        vim.cmd([[Neotree close]])
        vim.cmd([[SessionSave]])
      end,
    })
  end,
}
