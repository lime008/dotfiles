return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	-- [NAVIGATION]

	-- use 'crooloose/nerdtree'
	-- use 'low-ghost/nerdtree-fugitive' -- add files to commit from nerdtree
	-- use 'Xuyuanp/nerdtree-git-plugin' -- show git file status in nerdTree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-media-files.nvim")

	-- [COMMON]
	use("L3MON4D3/LuaSnip") -- snippet support
	use("tpope/vim-commentary") -- comment out lines
	use("tpope/vim-fugitive") -- git commands for vim
	use("tpope/vim-rhubarb") -- git browse
	use("editorconfig/editorconfig-vim") -- load the editorconfig for the project ( correct indentation rules etc. )
	use("vim-scripts/Vimchant") -- spell checking

	-- [NVIM SPECIFIC]
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")

	-- LSP
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	use("jose-elias-alvarez/null-ls.nvim") -- lsp formatter

	-- completions with cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/cmp_luasnip")

	-- Github Copilot
	-- use("github/copilot.vim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")

	-- color highlight
	use("norcalli/nvim-colorizer.lua")

	-- purely visual
	use("lime008/limetty-vim") -- Limetty colorscheme
	use("vim-airline/vim-airline") -- fancier status line
	use("airblade/vim-gitgutter") -- show git diff status aside line numbers
	use("https://gitlab.com/gi1242/vim-emoji-ab.git") -- show emojis

	-- golang
	use({ "fatih/vim-go", run = ":GoUpdateBinaries" })

	-- javascript
	use("pangloss/vim-javascript") -- javascript support
	use("evanleck/vim-svelte") -- svelte support
	use({ "styled-components/vim-styled-components", branch = "main" })

	-- emmet plugin
	use("mattn/emmet-vim")

	-- handy tools - not mandatory
	use("christianrondeau/vim-base64") -- encode and decode base64
	use("junegunn/goyo.vim") -- hide everything but the current buffer ( helps to focus )
	use("yegappan/grep") -- quick grep in the current directory
	use("sk1418/HowMuch") -- evaluate math formulas with visual selections
	-- use 'knubie/vim-kitty-navigator' -- seemless navigation with the kitty terminal windows
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	}) -- markdown preview in browser
end)
