local cmp = require("cmp")

cmp.setup({
	select = false,
	confirmation = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.bodj)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})
