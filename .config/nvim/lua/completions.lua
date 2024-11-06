local cmp = require("cmp")

cmp.setup({
	select = false,
	preselect = cmp.PreselectMode.None,
	confirmation = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 30 },
		{ name = "luasnip", priority = 10 },
		{ name = "buffer", priority = 0 },
	}),
	mapping = {
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete()
			end
		end),
		["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
})
