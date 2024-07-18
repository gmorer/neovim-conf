local icons = require("config.const").icons;

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
            error = icons.error,
            warn = icons.warn,
            info = icons.info,
            hint = icons.hint,
          },
        },
      },
      lualine_x = {
        {
          "diff",
          symbols = {
            added = icons.vcs.added,
            modified = icons.vcs.modified,
            removed = icons.vcs.removed,
          },
          source = icons.vcs
        }
      },
      lualine_y = {
        { "progress", padding = { left = 1, right = 1 }, separator = "  " },
        -- { "location", padding = { left = 0, right = 1 } },
      },
    },
  }
}
