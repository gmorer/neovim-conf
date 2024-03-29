return {
  "nvim-lua/plenary.nvim",

  -- "nyoom-engineering/oxocarbon.nvim",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      integrations = {
        neotree = true,
        leap = true,
        gitsigns = true,
        noice = true,
        cmp = true,
        treesitter = true,
        telescope = true,
        lsp_trouble = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
  },

  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    },
    init = function() require("leap").add_default_mappings() end
  },

  {
    "nvim-telescope/telescope.nvim",
    config = require("config.telescope"),
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' },
      "nvim-web-devicons",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },

  "folke/neodev.nvim",


  -- Completion and linting
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = {"TSInstall", "TSUpdate", "TSInstallInfo"},
    opts = require("config.treesitter"),
    event = "bufEnter",
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
  -- "neovim/nvim-lspconfig",

  -- lsp stuff

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  },

  {
    "folke/lsp-trouble.nvim",
    -- Can use P to toggle auto movement
    opts = {
      auto_preview = false,
      auto_fold = true,
    },
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
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = {"DiffviewFileHistory", "DiffviewOpen"}
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
  },

  -- MultiCursor
  "mg979/vim-visual-multi",

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

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        config = true,
        opts = require("config.window-picker")
      },
    },
    opts = require("config.tree"),
    cmd = "Neotree",
  },

  -- bottom bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      {"nvim-tree/nvim-web-devicons" }
    },
    opts = { options = { theme = "catppuccin" }}
  },

  -- Floating file name
  {
    "b0o/incline.nvim",
    opts = require("config.incline"),
  },

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
          {filetype = "NvimTree", text = "File Explorer", text_align = "left", padding = 1},
          {filetype = "neo-tree", text = "File Explorer", text_align = "left"},
        },
      }
    }
  },

  "Yggdroot/indentLine",

  -- Comments
  {
    "terrortylor/nvim-comment",
    cmd = "CommentToggle",
    init = function ()
      require('nvim_comment').setup({
        create_mappings = false,
      })
    end
  },

  -- Command line
  {
    "folke/noice.nvim",
    event = "VimEnter",
    -- enabled = vim.g.neovide == nil,
    init = function()
      require("telescope").load_extension("noice")
    end,
    opts = require("config.noice"),
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'akinsho/toggleterm.nvim',
    cmd = { "ToggleTerm" },
    version = "*",
    config = true
  },

  -- KeyBindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 100
    end,
    config = require("config.bindings").wk,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
