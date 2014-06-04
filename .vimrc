" ==========================================================
" Pathogen 
" ==========================================================
execute pathogen#infect()

" ==========================================================
" Vundle
" ==========================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Bundles here:
"
" original repos on github
" I'm going to bite the bullet and use NERDTree
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
" Awesome plugin.. this creates the bar at the bottom.
Plugin 'bling/vim-airline'
" Similar functionality to the multiple cursors in SublimeText.
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'msanders/snipmate.vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

call vundle#end()
filetype plugin indent on

" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Allow pasting blocks of code without indenting
set pastetoggle=<F2>

"Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" Let me save files with sudo
cmap w!! w !sudo tee % >/dev/null

set tw=0
set wm=0
set nowrap
set linebreak

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set showcmd

set colorcolumn=80

" don't bell or blink
"set noerrorbells
"set vb t_vb=


" don't outdent hashes
inoremap # #

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a


set ls=2  "Always show status line"


set ruler

set hidden

set nolazyredraw
set showmatch
set encoding=utf8

set backspace=indent,eol,start

set nobackup
set noswapfile

set undodir=~/.vim_runtime/undodir
set undofile

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>.,trail:.,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    colorscheme desert
    " Remove menu bar
    set guioptions-=m
    set guifont=Menlo:h14
    "set guifont=Monaco:h14

    " Remove toolbar
    set guioptions-=T
else
    colorscheme zellner
endif



