-- -- set guifont=JetBrains\ Mono:h11
vim.o.winblend=30
vim.o.pumblend=30


-- -- Fonts
-- vim.g.gui_font_default_size = 10
-- vim.g.gui_font_size = vim.g.gui_font_default_size
-- vim.opt.guifont = {"JetBrains Mono", "h:10"}
-- vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h11" }
vim.opt.guifont = { "Fira Code", ":h11" }

-- RefreshGuiFont = function()
--   vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
-- end
--
-- ResizeGuiFont = function(delta)
--   vim.g.gui_font_size = vim.g.gui_font_size + delta
--   RefreshGuiFont()
-- end

-- ResetGuiFont = function()
  -- vim.g.gui_font_size = vim.g.gui_font_default_size
  -- RefreshGuiFont()
-- end

-- -- Call function on startup to set default value
-- ResetGuiFont()

-- -- Keymaps

-- local opts = { noremap = true, silent = true }

-- vim.keymap.set({'n', 'i'}, "<C-S-_>", function() ResizeGuiFont(-1)  end, opts)
-- vim.keymap.set({'n', 'i'}, "<C-S-+>", function() ResizeGuiFont(1) end, opts)
