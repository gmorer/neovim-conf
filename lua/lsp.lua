require("neodev").setup({})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- If i want to skip a server
-- lsp.skip_server_setup({'eslint'})

--[[
lsp.format_on_save({
  servers = {
    ['lua_ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'},
  }
})
--]]

--[[
lsp.configure('tsserver', {
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  }
})
--]]


lsp.setup()

-- Make sure you setup `cmp` after lsp-zero

local cmp = require('cmp')
-- local cmp_action = require('lsp-zero').cmp_action()

cmp.setup(require("config/cmp"))
