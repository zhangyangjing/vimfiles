""""""""""""""""""
"
" Util
"
""""""""""""""""""
colorscheme desert
syntax on
filetype on
filetype plugin indent on
set nu    " show line number`
set fileencoding=utf-8
set encoding=utf-8
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start  " set backup delete is tab type
set expandtab
set smartindent
set showmatch   " auto show { } when select one of two
set matchtime=2
set incsearch   " hilight hit word when type in search key work
set hlsearch    " hilight all matched word when searching(after type enter)
set nobackup
set nowrap
set noswapfile
set nocompatible
set completeopt=longest,menu
autocmd FileType c,ch,cpp,java setlocal cindent

let g:mapleader=","

nnoremap <leader>a ggVG
nnoremap <leader>w :w<CR>
inoremap <leader>w <ESC>:w<CR>
nnoremap <leader>q :q<CR>

nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>J <C-W>b
nnoremap <leader>K <C-W>t

nnoremap <leader>vm <C-W>_
nnoremap <leader>sm <C-W>\|
nnoremap <leader>m <C-W>\|<C-W>_
nnoremap <leader>nm <C-W>=

nnoremap <leader>tj <C-W>J
nnoremap <leader>tk <C-W>K
nnoremap <leader>th <C-W>H
nnoremap <leader>tl <C-W>L

nnoremap <C-H> :tabp<CR>
nnoremap <C-L> :tabn<CR>
nnoremap <leader>ttl :call TableMove('forwart')<CR>
nnoremap <leader>tth :call TableMove('backwart')<CR>

nmap <leader>ii :A<CR> 
nmap <leader>iv :AV<CR>
nmap <leader>is :AS<CR>
nmap <leader>it :AT<CR>

noremap <leader>oo :new 
noremap <leader>os :split 
noremap <leader>ov :vnew 
noremap <leader>ot :tabnew 

nnoremap <C-J> <C-F>
nnoremap <C-K> <C-B>

nmap <leader>g <C-]>
nmap <leader>b <C-O>
nnoremap <leader>p <C-I>

nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>erc :new ~/.vimrc<cr>
autocmd! bufwritepost *vimrc :source ~/.vimrc

"d p r u x y

""""""""""""""""""
"
" Plugins
"
""""""""""""""""""
" NERDTree
nnoremap <leader>tr :NERDTree<CR>

" Tag List
set autochdir
"let Tlist_Ctag_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Left_Window = 1
nnoremap <leader>ta :Tlist<CR>

" PyDictionary
map <F5> :!python %<CR>
let g:pydiction_location = '~/.vim/pydiction'

" Comments
map  <leader>cc <C-C>
map  <leader>cx <C-X>

" Table
function! TableMove(direction)
    let tableCount = tabpagenr('$')
    let tableIndex = tabpagenr()
    
    if 'forwart' == a:direction
        let tableIndex += 1
    else
        let tableIndex -= 1 
    endif
    
    if tableIndex > tableCount
        let tableIndex = 1
    endif
    if tableIndex < 1
        let tableIndex = tableCount
    endif

    let tableIndex -= 1

    execute 'tabm '.tableIndex
endfunction
