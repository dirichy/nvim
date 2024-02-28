return {
  "jbyuki/nabla.nvim",
  ft = "*.tex",
  keys = {
    { "<leader>v", [[<cmd>lua require("nabla").popup()<cr>]], desc = "Nabla POP" },
    {
      "<leader>uv",
      function()
        vim.cmd([[:%s/[ ]*\\\[/\\\[/ge]])
        vim.cmd([[lua require("nabla").toggle_virt()]])
      end,
      desc = "Togglt Nabla",
    },
  },
}
