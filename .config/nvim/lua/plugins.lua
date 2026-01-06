local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- [NAVIGATION]
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
	},

	-- [COMMON]
	{
		"L3MON4D3/LuaSnip",
		version = "v2 .*",
		build = "make install_jsregexp",
	}, -- snippet support

	"tpope/vim-commentary", -- comment out lines
	"tpope/vim-fugitive", -- git commands for vim
	"tpope/vim-rhubarb", -- git browse
	"editorconfig/editorconfig-vim", -- load the editorconfig for the project ( correct indentation rules etc. )
	"vim-scripts/Vimchant", -- spell checking

	-- [NVIM SPECIFIC]
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"stevearc/conform.nvim",
	"zapling/mason-conform.nvim",

	-- completions with cmp
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/cmp_luasnip",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	-- color highlight
	"norcalli/nvim-colorizer.lua",

	-- purely visual
	"lime008/limetty-vim", -- Limetty colorscheme
	-- use("vim-airline/vim-airline") -- fancier status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", optonal = true },
	},
	"lewis6991/gitsigns.nvim", -- show git diff status aside line numbers
	"https://gitlab.com/gi1242/vim-emoji-ab.git", -- show emojis

	-- golang
	{ "fatih/vim-go", build = ":GoUpdateBinaries" },

	-- javascript
	"pangloss/vim-javascript", -- javascript support
	"evanleck/vim-svelte", -- svelte support
	{ "styled-components/vim-styled-components", branch = "main" },

	-- emmet plugin
	"mattn/emmet-vim",

	-- handy tools - not mandatory
	"christianrondeau/vim-base64", -- encode and decode base64
	"junegunn/goyo.vim", -- hide everything but the current buffer ( helps to focus )
	"yegappan/grep", -- quick grep in the current directory
	"sk1418/HowMuch", -- evaluate math formulas with visual selections
	-- use 'knubie/vim-kitty-navigator' -- seemless navigation with the kitty terminal windows
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	}, -- markdown preview in browser

	-- TinyGo
	"sago35/tinygo.vim",
})
