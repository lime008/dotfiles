local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local ts = require("nvim-treesitter.configs")

local servers = { "gopls", "tsserver", "cssls", "terraformls" }

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Treesitter configuration
ts.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
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
