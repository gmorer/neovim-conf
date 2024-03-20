return {
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
  }
}
