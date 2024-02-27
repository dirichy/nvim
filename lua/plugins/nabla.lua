return {
  "jbyuki/nabla.nvim",
  ft = "*.tex",
  keys = {
    { "<leader>v", [[<cmd>lua require("nabla").popup()<cr>]], desc = "Nabla POP" },
  },
}
