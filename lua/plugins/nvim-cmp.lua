return {
	"hrsh7th/nvim-cmp",
  event = "InsertEnter",
  version = false,
  enabled = false,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
	opts = function()
    local cmp = require("cmp")
    return {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
		-- mapping = {
		-- 	["<Tab>"] = function(fallback)
		--       print("from within the mapping")
		-- 		local cmp = require("cmp")
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	["<S-Tab>"] = function(fallback)
		-- 		local cmp = require("cmp")
		-- 		if cmp.visible() then
		-- 			cmp.select_prev_item()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- },
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "luasnip", keyword_length = 2 },
      },
      preselect = "none", -- cmp.PreselectMode.None
    }
  end,
  config = function(_, opts)
    print("Initialieiung cmk...")
    require("cmp").setup(opts)
  end,
}
