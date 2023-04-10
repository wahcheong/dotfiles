" Use vim-plug as plugin manager
call plug#begin()

" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

Plug 'psliwka/vim-smoothie'

" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" https://github.com/ervandew/supertab
Plug 'ervandew/supertab'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/sainnhe/everforest
Plug 'sainnhe/everforest'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"********************** VIM SETTINGS **********************"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file.
let mapleader = ","

" Save file.
nmap <leader>w :w!<CR>
" Exit file.
nmap <leader>q :q!<CR>

" Go to next item in quickfix window.
nmap <leader>n :cn<CR>

" Go to previous item in quickfix window.
nmap <leader>p :cp<CR>

" Splict window vertically.
map <leader>sv :<C-w>v

" Splict window horizontally.
map <leader>sh :<C-w>s

" Set the character encoding used inside Vim.
set encoding=utf-8

" Enables mouse support in Normal/Visual mode.
set mouse=nv

" Let the command-line completion operates in an enhanced mode.
set wildmenu

" Not show mode since we have a plugin to do it.
set noshowmode

" Use the system clipboard.
set clipboard^=unnamed,unnamedplus

" Avoid creating a swapfile.
set noswapfile

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" Show "invisible" characters.
set list
set listchars=tab:➜·,trail:·

" Make backspace behave more reasonably.
set backspace=indent,eol,start

" Syntax highlighting.
syntax on

set background=dark

if has('termguicolors')
  set termguicolors
endif

" No annoying sound on errors.
set noerrorbells
set novisualbell

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Number of spaces to use for each step of (auto)indent.
" Used for 'cindent', >>, <<, etc.
set shiftwidth=2

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commnds and
" when 'autoindent' is on.
set expandtab

" Number of spaces that a <Tab> counts for while performing editing operations,
" like inserting a <Tab> or using <BS>.
set softtabstop=2

" Show line number.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Show absolute line number in insert mode, otherwise relative line number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Draw signcolumn only when there is a sign to display.
set signcolumn=auto

" Highlight current line.
set cursorline

" Minimal number of screen lines to keep above and below the cursor.
" Keep 3 lines off the edges of the screen when scrolling.
set scrolloff=3

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Highlight search items.
set hlsearch
" Incremental search, show search matches as you type in each character.
set incsearch
" Smart case sensitive.
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Show matching parenthesis.
set showmatch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"******************** PLUGINS SETTINGS ********************"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Everforest
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:everforest_background = 'hard'
colorscheme everforest

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin FzF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :Files<CR>
nmap <leader>b :Buffers<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>g :Ack!<CR>
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
" Use this option to highlight the searched term.
let g:ackhightlight=1
" Enable blank searches to run against the word under the cursor.
" When this option is not set, blank searches will only output an error message.
let g:ack_use_cword_for_empty_search=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Do not show hidden files
let NERDTreeShowHidden=0

