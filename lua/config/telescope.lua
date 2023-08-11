local M = {}
M.config = function()
  local map = require('config.utils').lua_map
  local builtin = require('telescope.builtin')
  -- print(telescope)

  local silent = {silent = true}
  -- Navigate buffers and repos
  map('n', '<c-p>', builtin.find_files, silent)
  map('n', '<c-o>', builtin.live_grep, silent)
  map('n', '<c-b>', builtin.buffers, silent)
end

-- require("telescope").load_extension("noice")

M.opts = {
    defaults = {
        layout_strategy = 'flex',
        scroll_strategy = 'cycle',
        file_ignore_patterns = {
            "target/.*",
            ".git/.*",
            "node_modules/.*",
            "vendor/.*",
        },
    }
}

return M
