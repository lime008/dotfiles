local prettier = function()
	return {
		exe = "prettier",
		args = {
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


return require('formatter').setup({
	filetype = {
		javascript = { prettier },
		json = { prettier },
		go = { gofumpt, golines },
	},
})
