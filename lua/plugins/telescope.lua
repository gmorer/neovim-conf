return {
	"nvim-telescope/telescope.nvim",
	keys = false,
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-web-devicons",
		"nvim-telescope/telescope-media-files.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		-- print(telescope)

		telescope.setup({
			defaults = {
				layout_config = {
					vertical = {
						-- width = 0.5,
					},
				},
				layout_strategy = "flex",
				scroll_strategy = "cycle",
				file_ignore_patterns = {
					"target/.*",
					".git/.*",
					"node_modules/.*",
					"vendor/.*",
				},
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				diagnostics = {
					layout_strategy = "vertical",
				},
			},
		})
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("fzf")
		-- require("telescope").load_extension("noice")
	end,
}
