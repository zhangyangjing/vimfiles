"""""""""""""""""
"
" Bundle Manage
"
""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"	Bundle 'tpope/vim-fugitive'
" vim-scripts repos http://www.vim.org/scripts/index.php
"	Bundle 'L9'
" non github repos
"	Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdtree'
Bundle 'esukram/taglist.vim'
Bundle 'python.vim'
Bundle 'Pydiction'
Bundle 'vim-scripts/cscope.vim'

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

""""""""""""""""""
"
" Util
"
""""""""""""""""""
let mapleader=","
let g:mapleader=","

nnoremap <silent> <F2> :NERDTree<CR>
nnoremap <silent> <F3> :TlistOpen<CR>
map <F5> :!python %<CR>
map tl :Tlist<CR>

nmap <leader>a ggVG

nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l
nmap <leader>J <C-W>b
nmap <leader>K <C-W>t

nmap <leader>m <C-W>_
nmap <leader>nm <C-W>=

nmap <leader>tj <C-W>J
nmap <leader>tk <C-W>K
nmap <leader>th <C-W>H
nmap <leader>tl <C-W>L


map <leader>ss :source ~/.vimrc<CR>
map <leader>evrc :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on
filetype on
filetype plugin on
set nu    " show line number`
set fileencoding=utf-8
set encoding=utf-8
set tabstop=4
autocmd FileType python setlocal et sta sw=4 sts=4  " set auto tab intent 4 for python
set backspace=indent,eol,start  " set backup delete is tab type
set expandtab
set autoindent
set smartindent
set showmatch   " auto show { } when select one of two
set incsearch   " hilight hit word when type in search key work
set hlsearch    " hilight all matched word when searching(after type enter)
set nobackup
set noswapfile
colorscheme default


""""""""""""""""""
"
" Tag List
"
""""""""""""""""""
let Tlist_Ctag_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Left_Window = 1

""""""""""""""""""
"
" Pydictionary
"
""""""""""""""""""
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
