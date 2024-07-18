return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  -- init = function()
    -- vim.o.timeout = true
    -- vim.o.timeoutlen = 100
  -- end,
  keys = {
    mode = { "n" },
    { "<space>f", require("telescope.builtin").find_files, desc = "Find file" },
    { "<space>/", require("telescope.builtin").live_grep, desc = "Global search" },
    { "<space>b", require("telescope.builtin").buffers, desc = "Show open buffers" },
    { "<space>d", function() require("trouble").toggle("diagnostics") end, desc = "Diagnostic"},
    { "<space>s", require("telescope.builtin").lsp_document_symbols, desc = "Show document's symbols" },
    { "<space>k", vim.lsp.buf.hover, desc = "Show definition" },
    { "<space>r", vim.lsp.buf.rename, desc = "Rename symbol" },
    { "<space>a", vim.lsp.buf.code_action, desc = "Execute code action" },
    -- ['?'] = { require'telescope.builtin'.keymaps, "Show help"},
    { "<space>?", require("show_help"), desc = "Show help" },
    {"]d", function() require("trouble").next({skip_groups = true, jump = true}) end, desc = "Next diagnostic"},
    {"[d", function() require("trouble").previous({skip_groups = true, jump = true}) end, desc = "Previous diagnostic"},
    { "g", group = "GoTo" },
    { "gd", require("telescope.builtin").lsp_definitions, desc = "Go to definition" },
    { "gi", require("telescope.builtin").lsp_implementations, desc = "Go to implementation" },
    { "gt", require("telescope.builtin").lsp_type_definitions, desc = "Go to type" },
    { "gr", require("telescope.builtin").lsp_references, desc = "List symbole references" },
    { "go", "<C-t>", "Go back" },
    {"<c-n>", ":Neotree toggle filesystem left reveal<CR>", desc = "Open filesystem tree" },
    {"<c-d>", "<Plug>(VM-Find-Under)<cr>", desc = "Find under" },
    {"f", function()
      require("leap").leap({ target_windows = { vim.fn.win_getid() } })
    end, desc = "Switch to leap mode" },
    {"U", "<C-r>", desc = "Redo" },
    { "t", group = "terminal" },
    {"tt", ":ToggleTerm direction=float<CR>", desc = "Open a floating terminal" },
    {"\\s", require("gitsigns").blame_line, desc = "Git blame" },
  }
}
