require'lspconfig'.gopls.setup{}
require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.cssls.setup{}
require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true
	}
}

-- Telescope
require('telescope').setup{
	defaults = {
		file_ignore_patterns = { "node_modules", ".next" }
	},
	extensions = {
		media_files = {
			filetypes = {"png", "jpg", "jpeg", "webp", "webm", "mp4", "pdf"}
		}
	}
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
