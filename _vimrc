set autoindent
syntax on
set number
set ts=3
set sts=3
set sw=3
set expandtab

set encoding=utf-8
set enc=utf-8
set fenc=utf-8
set tenc=utf-8

set incsearch
set ignorecase
set smartcase
set list
set listchars=trail:_,tab:>-

set cursorline

set relativenumber
set nocompatible
filetype off

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" buffer switch - allow wildcards bar and case insensitive search there
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,.git/*,node_modules
set wildignorecase

nnoremap <C-j> <C-W><C-j> "Ctrl-j to move down a split
nnoremap <C-k> <C-W><C-k> "Ctrl-k to move up a split
nnoremap <C-l> <C-W><C-l> "Ctrl-l to move right a split
nnoremap <C-h> <C-W><C-h> "Ctrl-h to move left a split
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Vundle setup
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " this plugin manager
Plugin 'tpope/vim-surround' "
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular' " GREAT plugin for auto - identation - :Tabularize /<pattern> , where pattern is a regex to match for alignemnt, e.g. = aligns equal signs
Plugin 'ervandew/supertab' " great intelligent completion - way better that <C-n>
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy finding
Plugin 'vim-airline/vim-airline' " great bottom line
Plugin 'vim-airline/vim-airline-themes' " ... and themes for it

call vundle#end()            " required
filetype plugin indent on    " required
