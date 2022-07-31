vim.opt.background = "dark"
vim.cmd("colorscheme limetty") -- base16-snazzy base16-porple base16-gruvbox-dark-hard just if I change my mind

-- markdown highlighting for code fences
vim.g.markdown_fenced_languages = {
	"bash=sh",
	"javascript",
	"js=javascript",
	"json=javascript",
	"typescript",
	"ts=typescript",
	"php",
	"html",
	"css",
	"rust",
	"go",
}

require("colorizer").setup()
