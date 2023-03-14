-- Set leader to <space>
vim.g.mapleader = " "

-- Syntax highlighting
vim.opt.syntax = "on"
vim.opt.termguicolors = true

-- Encoding to utf8
local enc = "utf-8"
vim.opt.encoding = enc
vim.opt.fileencoding = enc
vim.opt.fileencodings = enc

vim.opt.ttyfast = true

vim.opt.backspace = "indent,eol,start"
vim.opt.history = 1000

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.ruler = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- searching
vim.opt.hlsearch = true -- highlight search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- all lowercase -> case insensitive

vim.opt.showcmd = true -- show the typed keys for the command
vim.opt.number = true -- show the line numbers
vim.opt.relativenumber = true -- show relative linenumbers
vim.opt.wrap = true -- enable soft line wrapping
vim.opt.cc = "81" -- set the text margin highlight

vim.g.pymode_virtalenv = true
vim.g.pymode_init = true
vim.g.pymode_linit = true

-- disable bell
vim.opt.belloff = "all"

-- list charracters
vim.opt.listchars = { tab = "►-", space = "·", nbsp = "⎵" }

vim.opt.splitright = true
vim.opt.wildignore:append({ "*/tmp/*", "*.so", "*.swp", "*.zip", "*.pyc", "*.db", "*.sqlite" })

-- Avoid showing message extra message when using completion
vim.opt.shortmess:append("c")

-- vim-go --
vim.g.go_fmt_command = "gopls"
vim.g.go_fmt_autosave = 0
vim.g.go_gopls_gofumpt = 1
vim.g.go_auto_type_info = 1
vim.g.go_addtags_transform = "camelcase"
vim.g.go_doc_keywordprg_enabled = 0
------------
