" BUNDLES:

" Automatically install vimplug if missing
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'vim-python/python-syntax'
Plug 'professor-l/hecked-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" GLOABL SETTINGS:

" Comma as leader key
let mapleader = ","

set encoding=utf-8

" Visual/cosmetic

syntax on
" Display cursor location in bottom right
set ruler
" Always show status line
set laststatus=2

" Show line number of current line but relative
" number of all other lines
set number
set relativenumber
autocmd BufEnter * set relativenumber
autocmd BufLeave * set norelativenumber


" Weird tmux color crap
 if exists('$TMUX')
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 endif

" Color preferences
colorscheme hecked
set t_Co=256

" Please don't collapse my code blocks thx
set nofoldenable

" Show me matching brackets, braces, parens, etc
set showmatch

" Python settings
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1


" Self explanatory
set lazyredraw

" Beep beep go bye bye
set visualbell
set t_vb=

" Insert mode changes cursor to bar
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Helps deleting whitespace
set backspace=indent,start,eol

" :spl and :vspl open on right and bottom respectively
set splitright
set splitbelow

" WHITESPACE
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set list
set listchars=tab:>\ ,trail:·

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase

" GLOABL BINDINGS:
nnoremap <leader>f :set foldenable<cr>
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" MOVEMENT
set mouse=a

" Same bindings in insert mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" Panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <C-f>f :Files<CR>

" jk rather than escape because easier
inoremap jk <esc>

" Filetype Settings:

function! Syn()
    let s = synID(line('.'), col('.'), 1)
    echo synIDattr(s, 'name') . ' -> ' . synIDattr(synIDtrans(s), 'name')
endfunc

nmap <C-p> :call Syn()<CR>
