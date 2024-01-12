-- merge of both telescope keymaps and telescope commands

return function()
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local utils = require "telescope.utils"
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local conf = require("telescope.config").values
  local make_entry = require "telescope.make_entry"
  local modes = { "n", "i", "c", "x" }

  local keymap_encountered = {} -- used to make sure no duplicates are inserted into keymaps_table
  local keymaps_table = {}
  local max_len_lhs = 0

  -- helper function to populate keymaps_table and determine max_len_lhs
  local function extract_keymaps(keymaps)
    for _, keymap in pairs(keymaps) do
      local keymap_key = keymap.buffer .. keymap.mode .. keymap.lhs -- should be distinct for every keymap
      if not keymap_encountered[keymap_key] then
        keymap_encountered[keymap_key] = true
        -- if
          -- (opts.show_plug or not string.find(keymap.lhs, "<Plug>"))
          -- and (not opts.lhs_filter or opts.lhs_filter(keymap.lhs))
          -- and (not opts.filter or opts.filter(keymap))
        -- then
          table.insert(keymaps_table, keymap)
          max_len_lhs = math.max(max_len_lhs, #utils.display_termcodes(keymap.lhs))
        -- end
      end
    end
  end

  for _, mode in pairs(modes) do
    local global = vim.api.nvim_get_keymap(mode)
    local buf_local = vim.api.nvim_buf_get_keymap(0, mode)
      extract_keymaps(global)
    extract_keymaps(buf_local)
  end

  local command_iter = vim.api.nvim_get_commands {}
  -- local commands = {}

  for _, cmd in pairs(command_iter) do
    -- table.insert(commands, cmd)
    cmd.desc = cmd.definition:gsub("\n", " ")
    cmd.lhs = cmd.name
    cmd.mode = " "
    cmd.buffer = 0
    cmd.noremap = 0
    table.insert(keymaps_table, cmd)
  end


  local buf_command_iter = vim.api.nvim_buf_get_commands(0, {})
  buf_command_iter[true] = nil -- remove the redundant entry
  for _, cmd in pairs(buf_command_iter) do
    cmd.desc = cmd.definition:gsub("\n", " ")
    cmd.lhs = cmd.name
    cmd.mode = " "
    cmd.buffer = 0
    cmd.noremap = 0
    table.insert(keymaps_table, cmd)
    -- table.insert(commands, cmd)
  end
  local opts =  { width_lhs = max_len_lhs + 1 }

  pickers
    .new(opts, {
      prompt_title = "Key Maps",
      finder = finders.new_table {
        results = keymaps_table,
        entry_maker = opts.entry_maker or make_entry.gen_from_keymaps(opts),
      },
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()

          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(selection.value.lhs, true, false, true), "t", true)
          return actions.close(prompt_bufnr)
        end)
        return true
      end,
    })
    :find()
end


