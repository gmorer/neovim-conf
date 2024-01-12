return function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  -- print(telescope)

  telescope.setup({
    defaults = {
      layout_strategy = 'flex',
      scroll_strategy = 'cycle',
      file_ignore_patterns = {
          "target/.*",
          ".git/.*",
          "node_modules/.*",
          "vendor/.*",
      },
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        }
      }
    }
  })
  require("telescope").load_extension("ui-select")
  require('telescope').load_extension('media_files')
  require('telescope').load_extension('fzf')
end
