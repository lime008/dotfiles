local cmp_nvim_lsp = require("cmp_nvim_lsp")

local servers = {
	"gopls",
	"golangci_lint_ls",
	"cssls",
	"terraformls",
	"svelte",
	"volar",
	"pyright",
	"clangd",
	"bashls",
	"yamlls",
	"dockerls",
	"rust_analyzer",
	"buf_ls",
	"lua_ls",
	"tsgo",
}

require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

vim.lsp.config("arduino_language_server", {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = {
		"arduino-language-server",
		"-fqbn",
		"esp32:esp32:pico32",
		"-cli-config",
		"$HOME/Arduino/arduino-cli.yaml",
	},
})

-- Treesitter configuration
require("nvim-treesitter").install("all")
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.cmd("normal zR")
	end,
})

-- Telescope
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".next" },
	},
	extensions = {
		media_files = {
			filetypes = { "png", "jpg", "jpeg", "webp", "webm", "mp4", "pdf" },
		},
	},
})
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")
