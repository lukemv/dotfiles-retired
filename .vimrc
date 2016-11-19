set nocompatible
filetype off

"======[ Vundle Start ]======"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'

call vundle#end()
"======[ Vundle End ]======"

filetype plugin on
filetype plugin indent on
autocmd FileType yaml setl indentkeys-=<:>

syntax on

" I like to use the spacebar as myleader key
" The default is \
let mapleader = "\<Space>"

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme hybrid 

" try <http://bytefluent.com/vivify/> to test colorschemes
set guifont=Monaco:h12

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
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set noswapfile
" swap buffers without saving the current buffer.
set hidden

" unhighlight by pressing enter
nnoremap <silent> <CR> :nohl<CR><CR>

"===[ MAPPINGS ]===
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap <silent> <Leader>rj :exe "resize -2"<CR>
nnoremap <silent> <Leader>rk :exe "resize +2"<CR>
nnoremap <silent> <Leader>rh :exe "vertical resize -5"<CR>
nnoremap <silent> <Leader>rl :exe "vertical resize +5"<CR>

" CtrlP Stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>p :CtrlPBuffer<CR>

nnoremap <Leader>rs :%s/\s\+$//<CR>
" Map 'jj' to the escape key in insert mode
inoremap jj <ESC>
" Turn off the stupid bell
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

" NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Set relative numbers to make jumping easier
set relativenumber

" cd to current file path
nnoremap ,cd :cd %:p:h<CR>
" Set laststatus in order to show airline status bar.
set laststatus=2

" Save files using sudo
cmap w!! w !sudo tee % >/dev/null

" Special characters
set list
set listchars=tab:·\ ,eol:¬,trail:­

autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=


"===[ PLUGINS ]===
map <Leader>nt :NERDTreeToggle<CR>

"===[ vim easy motion keybindings ]=== 
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Vim
let g:indentLine_color_term = 239

"GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

"===[ CtrlP find everything ]===
map <Leader>p :CtrlPMixed<CR>

set visualbell
set noerrorbells
