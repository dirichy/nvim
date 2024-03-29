return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = ".",
        link_roots = true,
        keep_roots = true,
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
      local auto_expand = require("luasnip").expand_auto
      require("luasnip").expand_auto = function(...)
        vim.o.undolevels = vim.o.undolevels
        auto_expand(...)
      end
      -- local types = require("luasnip.util.types")
      -- require("luasnip").config.setup({
      --   ext_opts = {
      --     [types.choiceNode] = {
      --       active = {
      --         virt_text = { { "●", "GruvboxOrange" } },
      --       },
      --     },
      --     [types.insertNode] = {
      --       active = {
      --         virt_text = { { "●", "GruvboxBlue" } },
      --       },
      --     },
      --   },
      -- })
    end,
    keys = function()
      return {
        {
          "<Tab>",
          function()
            return require("luasnip").expand_or_locally_jumpable() and "<Plug>luasnip-jump-next" or "<Tab>"
            -- or "<c-\\><c-n>:call searchpair('[([{<|]', '', '[)\\]}>|]', 'W')<cr>a"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          "jj",
          function()
            return require("luasnip").jump(1)
          end,
          mode = "s",
        },
        {
          "<c-p>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "s", "i" },
        },
        {
          "<c-j>",
          "<Plug>luasnip-next-choice",
          mode = { "i", "s" },
        },
        {
          "<c-k>",
          "<Plug>luasnip-prev-choice",
          mode = { "i", "s" },
        },
      }
    end,
  },
}
