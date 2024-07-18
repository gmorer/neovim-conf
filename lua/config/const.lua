local M = {}

M.icons = {
  error = " ",
  warn  = " ",
  hint  = " ",
  info  = " ",
  vcs = {
    added     = " ",
    modified  = " ",
    removed   = " ",
    renamed   = "󰁕 ",
    untracked = " ",
    ignored   = " ",
    unstaged  = "󰄱 ",
    staged    = " ",
    conflict  = " ",
  },
  folder_closed = " ",
  folder_open   = " ",
  folder_empty  = "󰜌 ",
}

return M
