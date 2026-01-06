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
local javascript = { "eslint_d", "eslint", unpack(prettier) }

require("conform").setup({
	formatters_by_ft = {
		go = { "gofumpt", "golines" },
		javascript = javascript,
		vue = javascript,
		html = prettier,
		json = prettier,
		markdown = prettier,
		typescript = javascript,
		typescriptreact = javascript,
		react = javascript,
		lua = { "stylua" },
		rust = { "rustfmt" },
		c = { "clang_format" },
		terraform = { "terraform_fmt" },
	},
	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		-- ...additional logic...
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})
