-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local null_ls = require("null-ls")

-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.formatting.gofumpt,
-- 		null_ls.builtins.formatting.golines,
-- 		null_ls.builtins.formatting.prettierd,
-- 		null_ls.builtins.formatting.stylua,
-- 		null_ls.builtins.formatting.terraform_fmt,
-- 		null_ls.builtins.formatting.rustfmt,
-- 		null_ls.builtins.formatting.clang_format,
-- 	},

-- 	on_attach = function(client, bufnr)
-- 		if client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ bufnr = bufnr })
-- 				end,
-- 			})
-- 		end
-- 	end,
-- })
--
require("mason-conform").setup()

local prettier = { "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters_by_ft = {
		go = { "gofumpt", "golines" },
		javascript = prettier,
		html = prettier,
		json = prettier,
		markdown = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		react = prettier,
		lua = { "stylua" },
		rust = { "rustfmt" },
		c = { "clang_format" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
