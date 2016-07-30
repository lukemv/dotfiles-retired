execute pathogen#infect()

syntax on

" I like to use the spacebar as myleader key
" The default is \
let mapleader = "\<Space>"

set background=dark
colorscheme solarized

" try <http://bytefluent.com/vivify/> to test colorschemes
set guifont=Monaco:h18

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set number
set numberwidth=6

"set cursorline
set hlsearch
set incsearch               " Incrementally search while typing a /regex
set ignorecase

set backspace=indent,eol,start
set autoindent

set smartindent
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set noswapfile
" swap buffers without saving the current buffer.
set hidden

" unhighlight by pressing enter
nnoremap <silent> <CR> :nohl<CR><CR>

" use Ctrl and hjkl to navigate between split screen 'windows'
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <silent> <Leader>j :exe "resize -2"<CR>
nnoremap <silent> <Leader>k :exe "resize +2"<CR>
nnoremap <silent> <Leader>h :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>l :exe "vertical resize +5"<CR>

" Map 'jj' to the escape key in insert mode
inoremap jj <ESC>

" NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Set laststatus in order to show airline status bar.
set laststatus=2

" Save files using sudo
cmap w!! w !sudo tee % >/dev/null

" Special characters
set list
set listchars=tab:▸\ ,eol:¬

autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

map <Leader>nt :NERDTreeToggle<CR>
