local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.gofumpt,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.prettier_d_slim,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.terraform_fmt,
		null_ls.builtins.formatting.rustfmt,
	},

	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
