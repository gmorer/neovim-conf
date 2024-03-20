return {
	-- { "Exafunction/codeium.nvim", enabled = false },
	-- { "nvimdev/dashboard-nvim", enabled = false },
	-- { "rcarriga/nvim-notify", enabled = false },
	-- { "folke/flash.nvim", enabled = false },
	-- { "folke/persistence.nvim", enabled = false },
	-- { "nvim-pack/nvim-spectre", enabled = false },
	-- { "nvim-treesitter-context", enabled = false },

	{ "folke/todo-comments.nvim", keys = false },

	-- "nyoom-engineering/oxocarbon.nvim",
	-- Configure LazyVim to load kanagawa
	-- {
	-- 	"LazyVim/LazyVim",
	-- 	opts = {
	-- 		colorscheme = "catppuccin",
	-- 	},
	-- },

	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		init = function()
			require("leap").add_default_mappings({})
		end,
	},

  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },


	-- lsp stuff

	{
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
    end,
  },
	{ "neovim/nvim-lspconfig" },
	{
    "williamboman/mason.nvim",
    config = true,
  },
	{
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "rust_analyzer",
        },
        handlers = {
          require("lsp-zero").default_setup,
        },
      })
  end
  },


	-- "nvim-lua/lsp_extensions.nvim",

	-- lsp loading
	{
		"j-hui/fidget.nvim",
		config = true,
		-- opts = { text = { spinner = "dots_negative" }}
	},

	-- git
	-- gitdiff
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true,
	},

	-- MultiCursor
  { "mg979/vim-visual-multi" },

	-- Pretty symbols
	"nvim-tree/nvim-web-devicons",

	-- zen mode
	-- {
	--   "Pocco81/true-zen.nvim",
	--   cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist", "TZNarrow"},
	--   opts = {
	--     integrations = {
	--       lualine = true,
	--       kitty = {
	--         enabled = true,
	--         font = "+3",
	--       },
	--     },
	--     modes = {
	--       narrow = {
	--         folds_style = "invisible",
	--       },
	--     },
	--   }
	-- },

	-- topbar
	{
		"akinsho/bufferline.nvim",
		-- tag = "v2.*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				-- modified_icon = "●",
				always_show_bufferline = false,
				mode = "tabs",
				indicator = {
					style = "underline",
				},
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", text_align = "left", padding = 1 },
					{ filetype = "neo-tree", text = "File Explorer", text_align = "left" },
				},
			},
		},
	},

	{
		"echasnovski/mini.comment",
		opts = {
			mappings = {
				comment_line = "<c-c>",
				comment_visual = "<c-c>",
			},
		},
	},

  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    opts = {
      -- symbol = "▏",
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  { 'echasnovski/mini.cursorword', version = false, config = true },

	{
		"akinsho/toggleterm.nvim",
		-- cmd = { "ToggleTerm" },
		version = "*",
		config = true,
	},
}
