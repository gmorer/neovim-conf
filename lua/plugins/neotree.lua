return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      config = true,
      opts = {
        hint = "floating-big-letter",
        filter_rules = {
          bo = {
            filetype = { 'neo-tree-popup', 'quickfix', 'incline' },
            buftype = { 'terminal', 'quickfix', 'nofile' },
          }
        },
      }
    },
  },
  opts = {
    close_if_last_window = true,
    window = {
      mappings = {
        ["<tab>"] = "open",
      },
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      }
    }
  },
  cmd = "Neotree",
}
