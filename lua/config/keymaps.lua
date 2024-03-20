local dfl_opt = { noremap = true, silent = true }

-- nnoremap <C-n> :NvimTreeToggle<CR>
-- vim.api.nvim_set_keymap('', '<C-n>', ':NvimTreeFindFileToggle<CR>', dfl_opt)

-- nnoremap <Leader>s :<C-u> :Git blame<CR>
-- vim.api.nvim_set_keymap('', '<Leader>s', ':lua require("gitsigns").blame_line()<CR>', dfl_opt)

-- vim.api.nvim_set_keymap('', '<C-/>', ':CommentToggle<CR>', dfl_opt)

vim.api.nvim_set_var("VM_maps", { ["Find Under"] = "<C-d>", ["Find Subword Under"] = "<C-d>" })

-- vim.api.nvim_set_keymap("n", "tt", ":ToggleTerm direction=float<CR>", dfl_opt)
vim.api.nvim_set_keymap("t", "<C-`>", "<C-\\><C-n>", dfl_opt)
vim.api.nvim_set_keymap("t", "<C-w>", "<C-\\><C-n><C-w>", dfl_opt)
vim.api.nvim_set_keymap("t", "<C-PageUp>", "<C-\\><C-n><C-PageUp>", dfl_opt)
vim.api.nvim_set_keymap("t", "<C-PageDown>", "<C-\\><C-n><C-PageDown>", dfl_opt)

-- vim.api.nvim_set_keymap('i', '<C-S-C>', '"+y', dfl_opt)
-- vim.api.nvim_set_keymap('i', '<C-S-V>', '"+p', dfl_opt)

vim.api.nvim_set_keymap("i", "<C-S-C>", '"*y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-S-V>", '"+p', { noremap = true, silent = true })

-- Leap the whole window


-- vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
