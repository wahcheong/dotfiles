" ==============================================================================
" ~/.vimrc
" A practical Vim config with vim-plug. Lean and fast — no bloat.
" Run :PlugInstall on first open to install plugins.
" ==============================================================================

" -- Pre-flight ----------------------------------------------------------------
set nocompatible               " must be first — disables Vi compatibility

" -- vim-plug plugin manager ---------------------------------------------------
" Install vim-plug if it does not exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Use vim-plug as plugin manager
call plug#begin()

" -- Plugins -------------------------------------------------------------------
" Fuzzy finder
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" AI code completion
" https://github.com/github/copilot.vim
Plug 'github/copilot.vim'

" File explorer
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" Tmux navigator, make vim and tmux splits feel seamless
" https://github.com/christoomey/vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" A better grep
" https://github.com/mileszs/ack.vim
Plug 'mileszs/ack.vim'

" Syntax and language packs
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

" Highlight other uses of the word under the cursor
" https://github.com/RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'

" Smooth scrolling
" https://github.com/psliwka/vim-smoothie
Plug 'psliwka/vim-smoothie'

" Commenting utility
" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

" Auto-completion for brackets, parens, quotes, etc.
" https://github.com/ervandew/supertab
Plug 'ervandew/supertab'

" Git integration
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" Git diff signs in the sign column
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" Status line
" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" OneDark colorscheme
" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

call plug#end()

" -- Colour scheme -------------------------------------------------------------
syntax on                          " Enable syntax highlighting.
set background=dark

if has('termguicolors')
  set termguicolors
endif

" Fallback to desert if onedark is not available
silent! colorscheme onedark
if !exists('g:colors_name') || g:colors_name !=# 'onedark'
  colorscheme desert
endif

" -- Basics --------------------------------------------------------------------
set encoding=utf-8                  " Set the character encoding used inside Vim.
set fileencoding=utf-8
set backspace=indent,eol,start      " Make backspace behave more reasonably.
set number                          " Show line number.
set relativenumber                  " This enables relative line numbering mode. With both number and
                                    " relativenumber enabled, the current line shows the true line number, while
                                    " all other lines (above and below) are numbered relative to the current line.
                                    " This is useful because you can tell, at a glance, what count is needed to
                                    " jump up or down to a particular line, by {count}k to go up or {count}j to go
                                    " down.

" Show absolute line number in insert mode, otherwise relative line number
augroup numbertoggle
  autocmd!
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END

set cursorline                      " Highlight current line.
set showmatch                       " Show matching parenthesis.
set noerrorbells                    " No annoying sound on errors.
set novisualbell
set signcolumn=auto                 " Draw signcolumn only when there is a sign to display.
set nowrap                          " No line wrapping.
set scrolloff=3                     " Minimal number of screen lines to keep above and below the cursor.
set laststatus=2                    " Always show the status line at the bottom, even if you only have one window open.
set noshowmode                      " Not show mode since we have a plugin to do it.
set timeoutlen=500                  " Faster leader key timeout response.
set updatetime=300                  " Faster diagnostic updates and cursorhold responsiveness.

set splitbelow                      " Open new horizontal splits below.
set splitright                      " Open new vertical splits to the right.

if has('clipboard')
  set clipboard=unnamed,unnamedplus " Use the system clipboard.
endif
set mouse=nv                        " Enables mouse support in Normal/Visual mode.

" -- Tabs / indentation --------------------------------------------------------
set expandtab                       " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set tabstop=2                       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2                    " Number of spaces to use for each step of (auto)indent.
                                    " Used for 'cindent', >>, <<, etc.
set softtabstop=2                   " Number of spaces that a <Tab> counts for while performing editing operations,
                                    " like inserting a <Tab> or using <BS>.
set smartindent                     " Do smart autoindenting when starting a new line.
set autoindent                      " Copy indent from current line when starting a new line.

" -- Search --------------------------------------------------------------------
set hlsearch                        " Highlight search items.
set incsearch                       " Incremental search, show search matches as you type in each character.
set ignorecase                      " Ignore case in search patterns.
set smartcase                       " Smart case sensitive.
                                    " Override the 'ignorecase' option if the search pattern contains upper case
                                    " characters.
                                    " This setting makes search case-insensitive when all characters in the string
                                    " being searched are lowercase. However, the search becomes case-sensitive if
                                    " it contains any capital letters. This makes searching more convenient.

" -- Files & buffers -----------------------------------------------------------
set hidden                          " Allow background buffers without saving.
set noswapfile                      " Avoid creating a swapfile.
set nobackup
set nowritebackup
set autoread                        " When a file has been detected to have been changed outside of Vim and
                                    " it has not been changed inside of Vim, automatically read it again.
set list                            " Show "invisible" characters.
set listchars=tab:➜·,trail:·
set wildmenu                        " Let the command-line completion operates in an enhanced mode.
set wildmode=longest:full,full      " When typing a command, the first tab press completes to the longest common string of all matches.
                                    " The second tab press lists all the matches, and the third tab press completes to the first match.

" -- Leader key ----------------------------------------------------------------
let mapleader = ","                 " With a map leader it's possible to do extra key combinations like <leader>w saves the current file.

" -- Key mappings --------------------------------------------------------------
" Reload vimrc, useful for testing changes to this file without restarting Vim.
nnoremap <leader>r :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

" Clear search highlight
nnoremap <leader><space> :noh<CR>

" Save file with <leader>w
nnoremap <leader>w :w<CR>
" Quit file with <leader>q
nnoremap <leader>q :q<CR>
" Quit all files with <leader>Q
nnoremap <leader>Q :qa!<CR>

" Go to next item in quickfix window.
nnoremap <leader>n :cn<CR>
" Go to previous item in quickfix window.
nnoremap <leader>p :cp<CR>

" Split window vertically and horizontally
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" -- Plugin settings -----------------------------------------------------------
" Fzf
" Fuzzy-find files with fzf and open the selection.
nnoremap <C-p> :Files<CR>
" Search file contents with ripgrep and pick a match via fzf.
nnoremap <leader>f :Rg<CR>
" Fuzzy-find among open buffers and switch to the selection.
nnoremap <leader>b :Buffers<CR>
" Fuzzy-find files with uncommitted git changes and open the selection.
nnoremap <leader>gc :GFiles?<CR>

" Ack
" Faster search with ripgrep.
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case --no-column'
endif
" Use this option to highlight the searched term.
let g:ackhighlight=1
" Enable blank searches to run against the word under the cursor.
" When this option is not set, blank searches will only output an error message.
let g:ack_use_cword_for_empty_search=1
" Fast search against the word under the cursor.
nnoremap <leader>g :Ack!<CR>

" NERDTree
" Show hidden files in NERDTree.
let g:NERDTreeShowHidden = 1
" Toggle the NERDTree file explorer sidebar
nnoremap <leader>e :NERDTreeToggle<CR>
" Open the NERDTree file explorer and focus on the current file
nnoremap <leader>fe :NERDTreeFind<CR>

" Git (fugitive)
nnoremap <leader>G :G<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gd :Gdiffsplit<CR>

" Lightline
let g:lightline = { 'colorscheme': 'onedark' }

" Copilot
" Disable tab mapping for copilot, so that it doesn't interfere with other tab mappings.
let g:copilot_no_tab_map = v:true
" Use <C-J> to accept copilot suggestion.
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
