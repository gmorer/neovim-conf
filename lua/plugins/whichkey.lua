return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	config = function()
		local wk = require("which-key")
		wk.register({
			["<space>"] = {
				f = { require("telescope.builtin").find_files, "Find file" },
				["/"] = { require("telescope.builtin").live_grep, "Global search" },
				["b"] = { require("telescope.builtin").buffers, "Show open buffers" },
				["d"] = { require("telescope.builtin").diagnostics, "Show LSP diagnostics" },
				["s"] = { require("telescope.builtin").lsp_document_symbols, "Show document's symbols" },
				["k"] = { vim.lsp.buf.hover, "Show definition" },
				-- ['?'] = { require'telescope.builtin'.keymaps, "Show help"},
				["?"] = { require("show_help"), "Show help" },
			},
			["g"] = {
				d = { require("telescope.builtin").lsp_definitions, "Go to definition" },
				i = { require("telescope.builtin").lsp_implementations, "Go to implementation" },
				t = { require("telescope.builtin").lsp_type_definitions, "Go to type" },
				r = { require("telescope.builtin").lsp_references, "List symbole references" },
				o = { "<C-t>", "Go back" },
			},
			["<c-n>"] = { ":Neotree toggle filesystem left reveal<CR>", "Open filesystem tree" },
			["<c-d>"] = { "<Plug>(VM-Find-Under)<cr>", "Find under" },
			["f"] = {
				function()
					require("leap").leap({ target_windows = { vim.fn.win_getid() } })
				end,
				"Switch to leap mode",
			},
			["U"] = { "<C-r>", "Redo" },
      ["t"] = {
				name = "terminal",
				t = { ":ToggleTerm direction=float<CR>", "Open a floating terminal" },
      },
			["\\"] = {
				["s"] = { require("gitsigns").blame_line, "Git blame" },
			},
		}, { mode = "n" })
	end,
}
