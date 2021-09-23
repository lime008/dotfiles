" #######################################
" #                VIMRC                #
" #                 BY                  #
" #               LIME008               #
" #######################################
let g:pymode_virtalenv=0
let g:pymode_init = 0
let g:pymode_linit = 0

packloadall

" DEFINE PLUGINS --------------------------------
call plug#begin('~/.vim/pluggs')

" navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " fuzzy finder
Plug 'junegunn/fzf.vim'
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

" completion
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'dense-analysis/ale' " linting
Plug 'maralla/completor.vim', { 'do': 'make js' }

" purely visual
Plug 'vim-airline/vim-airline' " fancier status line
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim' " base16 colorschemes
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'airblade/vim-gitgutter' " show git diff status aside line numbers
Plug 'arcticicestudio/nord-vim'
Plug 'https://gitlab.com/gi1242/vim-emoji-ab.git'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" javascript
Plug 'pangloss/vim-javascript' " javascript support
Plug 'ternjs/tern_for_vim', {'do': 'yarn install'} " javascript autocompletion
Plug 'evanleck/vim-svelte' " svelte support
Plug 'styled-components/vim-styled-components', {'branch': 'main'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" css
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" typescript
Plug 'HerringtonDarkholme/yats.vim'

" emmet plugin
Plug 'mattn/emmet-vim'

" handy tools - not mandatory
Plug 'christianrondeau/vim-base64' " encode and decode base64
Plug 'junegunn/goyo.vim' " hide everything but the current buffer ( helps to focus )
Plug 'knubie/vim-kitty-navigator' " seemless navigation with the kitty terminal windows
Plug 'yegappan/grep' " quick grep in the current directory
Plug 'sk1418/HowMuch' " evaluate math formulas with visual selections

call plug#end()

" set the colorscheme
let base16colorspace=256
colorscheme base16-limetty " base16-snazzy base16-porple base16-gruvbox-dark-hard just if I change my mind
set termguicolors

" fix gitgutter colors
" highlight GitGutterAdd guibg=NONE ctermbg=NONE
" highlight GitGutterDelete guibg=NONE ctermbg=NONE
" highlight GitGutterChange guibg=NONE ctermbg=NONE

" fzf
nnoremap <C-p> :<C-u>FZF<CR>

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

" set the key to toggle the tag bar
nmap <F8> :TagbarToggle<CR>

" map the hjkl keys to navigate between splits ---
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
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

" Completor Settings -----------------------------

let g:completor_filetype_map = {
	\ 'go': {'ft': 'lsp', 'cmd': 'gopls'}
	\}

" ------------------------------------------------

" UltiSnips settings -----------------------------
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
" ------------------------------------------------

" vim-go settings --------------------------------
let g:go_fmt_command = 'gopls'
let g:go_gopls_gofumpt = 1
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_code_completion_enabled = 1
let g:go_addtags_transform = 'camelcase'
" ------------------------------------------------

" vim-airline settings ---------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_limetty'
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

" CSS settings
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" ALE settings
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_fix_on_save = 1
nmap gd :ALEGoToDefinition<CR> " enable the vim gd command for ALE

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules .next'
