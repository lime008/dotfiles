local prettier = function()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

local prettierSvg = function()
	return {
		exe = "prettier",
		args = {
			"--parser html",
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			"--single-quote",
			"--use-tabs",
			"--trailing-comma=all",
			"--no-semi",
		},
		stdin = true,
	}
end

local gofumpt = function()
	return {
		exe = "gofumpt",
		args = {
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

local golines = function()
	return {
		exe = "golines",
		args = {
			"-m 80",
			"--reformat-tags",
			"--shorten-comments",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

local stylua = function()
	return {
		exe = "stylua",
		args = {
			"-",
		},
		stdin = true,
	}
end

local terraform = function()
	return {
		exe = "terraform fmt",
		args = {
			"-",
		},
		stdin = true,
	}
end

require("formatter").setup({
	filetype = {
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { prettier },
		typescriptreact = { prettier },
		json = { prettier },
		yaml = { prettier },
		markdown = { prettier },
		html = { prettier },
		svg = { prettierSvg },
		go = { gofumpt },
		lua = { stylua },
		terraform = { terraform },
	},
})

vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.json,*.ts,*.tsx,*.lua,*.md,*.go FormatWrite
augroup END
]],
	true
)
