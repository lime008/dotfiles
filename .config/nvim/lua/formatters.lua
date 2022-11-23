-- local prettier = function()
-- 	return {
-- 		exe = "prettier",
-- 		args = {
-- 			"--stdin-filepath",
-- 			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- local prettierSvg = function()
-- 	return {
-- 		exe = "prettier",
-- 		args = {
-- 			"--parser html",
-- 			"--stdin-filepath",
-- 			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
-- 			"--single-quote",
-- 			"--use-tabs",
-- 			"--trailing-comma=all",
-- 			"--no-semi",
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- local gofumpt = function()
-- 	return {
-- 		exe = "gofumpt",
-- 		args = {
-- 			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- local golines = function()
-- 	return {
-- 		exe = "golines",
-- 		args = {
-- 			"-m 80",
-- 			"--reformat-tags",
-- 			"--shorten-comments",
-- 			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- local stylua = function()
-- 	return {
-- 		exe = "stylua",
-- 		args = {
-- 			"-",
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- local terraform = function()
-- 	return {
-- 		exe = "terraform fmt",
-- 		args = {
-- 			"-",
-- 		},
-- 		stdin = true,
-- 	}
-- end

-- require("formatter").setup({
-- 	filetype = {
-- 		vue = { prettier },
-- 		javascript = { prettier },
-- 		javascriptreact = { prettier },
-- 		typescript = { prettier },
-- 		typescriptreact = { prettier },
-- 		json = { prettier },
-- 		yaml = { prettier },
-- 		markdown = { prettier },
-- 		html = { prettier },
-- 		svg = { prettierSvg },
-- 		go = { gofumpt, golines },
-- 		lua = { stylua },
-- 		terraform = { terraform },
-- 	},
-- })

-- vim.api.nvim_exec(
-- 	[[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx,*.lua,*.md,*.go FormatWrite
-- augroup END
-- ]],
-- 	true
-- )

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
