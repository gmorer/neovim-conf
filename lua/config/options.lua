vim.opt.list = true
vim.opt.fillchars = {
	diff = "╱",
}

-- Disable mouse
vim.o.mouse = ""

-- vim.opt.list = false
-- vim.opt.listchars = {
	-- eol = "⏎",
	-- tab = "┊ ",
	-- trail = "●",
	-- nbsp = "⎵",
	-- extends = "…",
	-- precedes = "…",
-- }c

vim.opt.termguicolors = true

vim.o.background = "dark"

vim.cmd.colorscheme "catppuccin"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.relativenumber = true
vim.o.number = true

-- Theme fix
-- vim.api.nvim_set_hl(0, "TelescopeBorder", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePromptNormal", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopeNormal", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePromptTitle", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {link = "Normal"})
-- vim.api.nvim_set_hl(0, "TelescopePreviewLine", {link = "Normal"})
vim.opt.clipboard = "unnamedplus"
vim.o.belloff = "all"

vim.opt.foldmethod = "expr"
vim.opt.foldenable = false
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.pumblend = 10 -- Popup blend

