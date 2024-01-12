return {
  wk = function ()
  local wk = require("which-key")
  wk.register({
      ["<space>"] = {
        f = { require'telescope.builtin'.find_files, "Find file"},
        ['/'] = { require'telescope.builtin'.live_grep, "Global search"},
        ['b'] = { require'telescope.builtin'.buffers, "Show open buffers"},
        ['d'] = { require'telescope.builtin'.diagnostics, "Show LSP diagnostics"},
        ['s'] = { require'telescope.builtin'.lsp_document_symbols, "Show document's symbols"},
        -- ['?'] = { require'telescope.builtin'.keymaps, "Show help"},
        ['?'] = { require('show_help'), "Show help"},
      },
      ["g"] = {
        d = {  require'telescope.builtin'.lsp_definitions ,"Go to definition"},
        i = {  require'telescope.builtin'.lsp_implementations ,"Go to implementation"},
        t = {  require'telescope.builtin'.lsp_type_definitions ,"Go to type"},
        o = {  "<C-t>","Go back"},
      },
      ["<c-c>"] = { ":CommentToggle<CR>", "Comment"},
      ["<c-n>"] = { ":Neotree toggle filesystem left reveal<CR>", "Open filesystem tree"},
      ["f"] = { function() require('leap').leap { target_windows = { vim.fn.win_getid() } } end, "Switch to leap mode"},
      ["U"] = { "<C-r>", "Redo"}
  }, { mode = "n" })

  wk.register({
      ["<c-c>"] = { ":'<,'>CommentToggle<CR>", "Comment"}
  }, { mode = "v" })


  end,
  default = function()
      local dfl_opt = { noremap = true, silent = true }

      -- nnoremap <C-n> :NvimTreeToggle<CR>
      -- vim.api.nvim_set_keymap('', '<C-n>', ':NvimTreeFindFileToggle<CR>', dfl_opt)

      -- nnoremap <Leader>s :<C-u> :Git blame<CR>
      vim.api.nvim_set_keymap('', '<Leader>s', ':lua require("gitsigns").blame_line()<CR>', dfl_opt)

      -- vim.api.nvim_set_keymap('', '<C-/>', ':CommentToggle<CR>', dfl_opt)

      vim.api.nvim_set_var('VM_maps', {['Find Under'] = '<C-d>', ['Find Subword Under'] = '<C-d>'})

      vim.api.nvim_set_keymap('n', 'tt', ':ToggleTerm direction=float<CR>', dfl_opt)
      vim.api.nvim_set_keymap('t', '<C-`>', '<C-\\><C-n>', dfl_opt)
      vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>', dfl_opt)
      vim.api.nvim_set_keymap('t', '<C-PageUp>', '<C-\\><C-n><C-PageUp>', dfl_opt)
      vim.api.nvim_set_keymap('t', '<C-PageDown>', '<C-\\><C-n><C-PageDown>', dfl_opt)

      -- vim.api.nvim_set_keymap('i', '<C-S-C>', '"+y', dfl_opt)
      -- vim.api.nvim_set_keymap('i', '<C-S-V>', '"+p', dfl_opt)

      vim.api.nvim_set_keymap("i", "<C-S-C>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
      vim.api.nvim_set_keymap("i", "<C-S-V>", '"+p', {noremap=true, silent=true})

      -- Leap the whole window

      vim.opt.clipboard = "unnamedplus"

      -- vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

      vim.o.belloff = 'all'

      vim.opt.foldmethod = "expr"
      vim.opt.foldenable = false
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end

}
