local icons = {
  diagnostics = {
    Error = " ",
    Warn  = " ",
    Hint  = " ",
    Info  = " ",
  },
  git = {
    added    = " ",
    modified = " ",
    removed  = " ",
  },
}

local filename = function()
  return {
    function()
      local pwd = vim.api.nvim_buf_get_name(0)
      local home = os.getenv("HOME")
      if home ~= nil and string.find(pwd, home) then
        return '~' .. string.sub(pwd, string.len(home) + 1)
      end
      return pwd
    end,
  }
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "arkav/lualine-lsp-progress" },
  opts = {
    options = {
      globalstatus = true,
      component_separators = '',
      section_separators = '',
      theme = 'catppuccin',
      ignore_focus = { 'NvimTree' },
    },
    disabled_filetypes = {
      'NvimTrees',
      'NvimTree',
    },
    extensions = {
      'neo-tree',
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        filename(),
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },
      lualine_x = {
        {
          "diff",
          symbols = {
            added = icons.git.added,
            modified = icons.git.modified,
            removed = icons.git.removed,
          },
          source = icons.git
        }
      },
      lualine_y = {
        { "progress", padding = { left = 1, right = 1 }, separator = "  " },
        -- { "location", padding = { left = 0, right = 1 } },
      },
    },
  }
}
