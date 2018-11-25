set nocompatible
filetype off

"======[ Vundle Start ]======"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
"======[ Vundle End ]======"

filetype plugin on
filetype plugin indent on
autocmd FileType yaml setl indentkeys-=<:>

syntax on

" I like to use the spacebar as myleader key
" The default is \
let mapleader = "\<Space>"

set background=dark

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set number
set numberwidth=6

"set cursorline
set hlsearch
set incsearch
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

"===[ MAPPINGS ]===
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" CtrlP Stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim
nnoremap <Leader>rC :source $MYVIMRC<CR>
nnoremap <Leader>rc :edit $MYVIMRC<CR>

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

"== [ Turn off stupid JSON quotes hiding ]==
set conceallevel=0

"== [ Fugitive ]=="
" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gm :Gmove<Space>
