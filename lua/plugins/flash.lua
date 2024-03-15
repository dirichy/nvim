return {
  {
    "dirichy/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    lazy = true,
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          if vim.g.curlang == "zh" then
            require("flash-zh").jump()
          end
        end,
        desc = "Flash between Chinese",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
}
