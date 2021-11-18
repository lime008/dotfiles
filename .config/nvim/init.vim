" #######################################
" #                VIMRC                #
" #                 BY                  #
" #               LIME008               #
" #######################################
"
"
lua require('plugins')

" map the leader key to comma
let mapleader=","

let g:pymode_virtalenv=0
let g:pymode_init = 0
let g:pymode_linit = 0

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


" turn on syntax highlighting
syntax on

" set the tab width to 4 and force soft tabs
set tabstop=4
set shiftwidth=4

set ruler
set scrolloff=8

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
	"nnoremap <leader>bm <cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>

	" lsp
	nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
	nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
	nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
	nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
	nnoremap <Leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
	nnoremap <Leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>


	nnoremap <Leader>o :.Gbrowse<CR>

	" nvim mappings
	map <C-n> :NvimTreeToggle<CR>

	" nerdtree mappings
	nnoremap <silent> <Leader>cff :NERDTreeFind<CR>
	nnoremap <silent> <F3> :NERDTreeToggle<CR>

	" Grep vim
	nnoremap <silent> <leader>gf :Rgrep<CR>
endfunc




" NERDTree Settings ------------------------------

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
let g:go_doc_keywordprg_enabled = 0
" ------------------------------------------------

" vim-airline settings ---------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme = 'limetty'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" " grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules .next'

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'go']

lua require('lsp-config')
lua require('formatters')
lua require('nvim-tree-config')
lua require('completions')

autocmd VimEnter * call SetKeyMappings()
