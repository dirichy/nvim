local Util = require("lazy.core.util")
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  branch = "v3.x",
  cmd = "Neotree",
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  -- init = function()
  --   if vim.fn.argc(-1) == 1 then
  --     local stat = vim.loop.fs_stat(vim.fn.argv(0))
  --     if stat and stat.type == "directory" then
  --       require("neo-tree")
  --     end
  --   end
  -- end,
  opts = {
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    sort_function = nil,
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "left",
      width = 30,
      -- mappings = {
      --   ["<space>"] = "none",
      --   ["Y"] = function(state)
      --     local node = state.tree:get_node()
      --     local path = node:get_id()
      --     vim.fn.setreg("+", path, "c")
      --   end,
      -- },
    },
    default_component_configs = {
      container = {
        enable_character_fade = false,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
        -- then these will never be used.
        default = "",
        highlight = "NeoTreeFileIcon",
      },
    },
  },
  config = function(_, opts)
    -- local function on_move(data)
    --   vim.lsp.on_rename(data.source, data.destination)
    -- end

    -- local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    -- vim.list_extend(opts.event_handlers, {
    --   { event = events.FILE_MOVED, handler = on_move },
    --   { event = events.FILE_RENAMED, handler = on_move },
    -- })
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
    require("nvim-web-devicons").setup({
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log",
        },
        ["m"] = {
          icon = "ℳ",
          color = "#ff8000",
          name = "Matlab",
        },
        ["fig"] = {
          icon = "",
          color = "#ff8000",
          name = "MatlabFig",
        },
        ["aux"] = {
          icon = "",
          color = "#006400",
          name = "Aux",
        },
      },
    })
  end,
}
