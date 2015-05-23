execute pathogen#infect()

set nocompatible
filetype plugin indent off
syntax off

"----------------- Vundle Start -----------------------"
set rtp+=~/.vim/bundle/Vundle.vim

" start vundle environment
" the default is ~/.vim/bundle
call vundle#begin()

" list of plugins {{{2
" let Vundle manage Vundle (this is required)
Plugin 'gmarik/Vundle.vim'

" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean

" clang_complete bug workaround:
"   cd to clang_complete
"   $  git checkout 6a7ad82
"Plugin 'Rip-Rip/clang_complete'
"Plugin 'vim-scripts/CRefVim'
"Plugin 'sjl/gundo.vim'
"Plugin 'jondkinney/dragvisuals.vim'
Plugin 'bling/vim-airline'
"Plugin 'scrooloose/syntastic'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'
Plugin 'flazz/vim-colorschemes'
"Plugin 'davidhalter/jedi-vim'

" add plugins before this
call vundle#end()
"----------------- Vundle end ------------------------"

syntax on

" I like to use the spacebar as myleader key
" The default is \
let mapleader = "\<Space>"

" colors {{{1
"enable 256 colors when in gnome-terminal (my debian machine)
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
  colorscheme default"
  "colorscheme google
else
  if has("gui_running")
    colorscheme jelleybeans  " looks nice in gui.
  else
    colorscheme default
  endif
endif
" try <http://bytefluent.com/vivify/> to test colorschemes

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

" Save files using sudo
cmap w!! w !sudo tee % >/dev/null

" Special characters
set list
set listchars=tab:▸\ ,eol:¬
