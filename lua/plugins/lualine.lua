return {
  "nvim-lualine/lualine.nvim",
  optional = true,
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 2, {
      function()
        return string.format(
          "%s%s%s",
          vim.g.curenv == "text" and "t" or "m",
          vim.g.mode == "i" and "i" or "n",
          vim.g.curlang == "zh" and "z" or "e"
        )
      end,
      icon_enabled = true,
      icon = "ㄓ",
      color = function()
        return {
          fg = string.format(
            "#%s%s%s",
            vim.g.curenv == "text" and "ff" or "33",
            vim.g.mode == "i" and "ff" or "33",
            vim.g.curlang == "zh" and "ff" or "33"
          ),
        }
      end,
    })
  end,
}
