return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
  opts = {
    format = {
      timeout_ms = 1000,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      tex = { "latexindent" },
    },
    -- LazyVim will merge the options you set here with builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string,table>
    formatters = {
      injected = { options = { ignore_errors = true } },
      -- # Example of using dprint only when a dprint.json file is present
      dprint = {
        condition = function(ctx)
          return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
        end,
      },
      --
      -- Example of using shfmt with extra args
      latexindent = {
        prepend_args = { "-m", "-l", "~/.config/nvim/latexindent.yaml", "-" },
      },
    },
  },
}
