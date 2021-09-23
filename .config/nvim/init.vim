" #######################################
" #                VIMRC                #
" #                 BY                  #
" #               LIME008               #
" #######################################
let g:pymode_virtalenv=0
let g:pymode_init = 0
let g:pymode_linit = 0

" DEFINE PLUGINS --------------------------------
call plug#begin('~/.config/nvim/pluggs')

" navigation
Plug 'scrooloose/nerdtree' " file list side bar
Plug 'low-ghost/nerdtree-fugitive' " add files to commit from nerdtree

" common
Plug 'SirVer/ultisnips' " snippet support
Plug 'tpope/vim-commentary' " comment out lines
Plug 'tpope/vim-fugitive' " git commands for vim
Plug 'tpope/vim-rhubarb' " git browse
Plug 'Xuyuanp/nerdtree-git-plugin' " show git file status in nerdTree
Plug 'editorconfig/editorconfig-vim' " load the editorconfig for the project ( correct indentation rules etc. )
Plug 'vim-scripts/Vimchant' " spell checking
Plug 'nvim-lua/completion-nvim' " lsp completion

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" purely visual
Plug 'vim-airline/vim-airline' " fancier status line
Plug 'lime008/limetty-vim' " Limetty colorscheme
Plug 'airblade/vim-gitgutter' " show git diff status aside line numbers
Plug 'https://gitlab.com/gi1242/vim-emoji-ab.git'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" javascript
Plug 'pangloss/vim-javascript' " javascript support
Plug 'evanleck/vim-svelte' " svelte support
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" emmet plugin
Plug 'mattn/emmet-vim'

" handy tools - not mandatory
Plug 'christianrondeau/vim-base64' " encode and decode base64
Plug 'junegunn/goyo.vim' " hide everything but the current buffer ( helps to focus )
" Plug 'knubie/vim-kitty-navigator' " seemless navigation with the kitty terminal windows
Plug 'yegappan/grep' " quick grep in the current directory
Plug 'sk1418/HowMuch' " evaluate math formulas with visual selections

" LSP
Plug 'neovim/nvim-lspconfig'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" set the colorscheme
let base16colorspace=256
colorscheme limetty " base16-snazzy base16-porple base16-gruvbox-dark-hard just if I change my mind
set termguicolors

" fix gitgutter colors
" highlight GitGutterAdd guibg=NONE ctermbg=NONE
" highlight GitGutterDelete guibg=NONE ctermbg=NONE
" highlight GitGutterChange guibg=NONE ctermbg=NONE


" set the default encoding to utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

set nocompatible
set backspace=indent,eol,start
set history=1000

" map the leader key to comma
let mapleader=","

" turn on syntax highlighting
syntax on
highlight clear LineNr
highlight clear SignColumn
highlight LineNr ctermfg=gray ctermbg=black
highlight! link SignColumn LineNr


" set the tab width to 4 and force soft tabs
set tabstop=4
set shiftwidth=4

set ruler

set cursorline " enable the highlighting of the current line

" disable the bell and visual bell ---------------
set vb
set t_vb=
" ------------------------------------------------

"" searching
set hlsearch        " highlight search
set incsearch       " highlight search
set ignorecase
set smartcase

set showcmd         " show the typed keys for the command
set number          " show the line numbers
set relativenumber  " show relative linenumbers
set t_Co=256        " use 256 colors
set wrap            " enable soft line wrapping
set cc=81           " set the text margin highlight

" set the font
set guifont=Fira\ Code\ 8

" set list charracters
set listchars=tab:►\ ,space:·,nbsp:⎵


func! SetKeyMappings()
	" set the key to toggle the tag bar
	nmap <F8> :TagbarToggle<CR>

	" map the hjkl keys to navigate between splits ---
	nmap <silent> <c-k> :wincmd k<CR>
	nmap <silent> <c-j> :wincmd j<CR>
	nmap <silent> <c-h> :wincmd h<CR>
	nmap <silent> <c-l> :wincmd l<CR>
	" ------------------------------------------------

	noremap <Leader>h :<C-u>split<CR>
	noremap <Leader>v :<C-u>vsplit<CR>

	" map the jk keys to move lines ------------------
	nnoremap <^]-j> :m .+1<CR>==
	nnoremap <^]-k> :m .-2<CR>==
	inoremap <^]-j> <Esc>:m .+1<CR>==gi
	inoremap <^]-k> <Esc>:m .-2<CR>==gi
	vnoremap <^]-j> :m '>+1<CR>gv=gv
	vnoremap <^]-k> :m '<-2<CR>gv=gv
	" ------------------------------------------------
	
	" telescope 
	nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<cr>
	nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
	nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
	nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
	nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
endfunc

nnoremap <Leader>o :.Gbrowse<CR>

" NERDTree Settings ------------------------------
map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <Leader>cff :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" ------------------------------------------------

" UltiSnips settings -----------------------------
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" ------------------------------------------------

" vim-go settings --------------------------------
let g:go_fmt_command = 'gopls'
let g:go_gopls_gofumpt = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = 'camelcase'
" ------------------------------------------------

" vim-airline settings ---------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'limetty'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" prettier settings
let g:prettier#config#use_tabs = 'true'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#autoformat = 0
autocmd BufWritePre *.java,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync

" " grep.vim
nnoremap <silent> <leader>gf :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules .next'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
let g:completion_enable_snippet = 'UltiSnips'

" Avoid showing message extra message when using completion
set shortmess+=c

" LSP
lua << EOF
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
EOF

autocmd VimEnter * call SetKeyMappings()
