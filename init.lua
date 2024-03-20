require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.autocmds")
if vim.g.neovide then
	require("config.neovide")
end
