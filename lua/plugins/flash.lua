return {
  {
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    lazy = true,
    config = function()
      local map = vim.keymap.set
      local keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            if vim.g.curlang == "zh" then
              require("flash-zh").jump({
                chinese_only = false,
              })
            else
              require("flash").jump()
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
      }
      for _, key in ipairs(keys) do
        map(key.mode, key[1], key[2], { desc = key.desc })
      end
    end,
  },
}
