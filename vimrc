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

" window switch
nnoremap <leader>k <C-W>k
nnoremap <leader>j <C-W>j
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>J <C-W>b
nnoremap <leader>K <C-W>t

" window resize
nnoremap <leader>vm <C-W>_
nnoremap <leader>sm <C-W>\|
nnoremap <leader>m <C-W>\|<C-W>_
nnoremap <leader>nm <C-W>=

" window move
nnoremap <leader>tj <C-W>J
nnoremap <leader>tk <C-W>K
nnoremap <leader>th <C-W>H
nnoremap <leader>tl <C-W>L

" tab switch
nnoremap <silent><C-H> :tabp<CR>
nnoremap <silent><C-L> :tabn<CR>
nnoremap <silent><leader>ttl :call TableMove('forward')<CR>
nnoremap <silent><leader>tth :call TableMove('backward')<CR>

" include header switch
nmap <silent><leader>ii :A<CR>
nmap <silent><leader>iv :AV<CR>
nmap <silent><leader>is :AS<CR>
nmap <silent><leader>it :AT<CR>

" open new file
noremap <leader>oo :new 
noremap <leader>os :split 
noremap <leader>ov :vnew 
noremap <leader>ot :tabnew 

" next/last page
nnoremap <C-J> <C-F>
nnoremap <C-K> <C-B>

" link jump
nmap <leader>g <C-]>
nmap <leader>b <C-O>
nnoremap <leader>p <C-I>

" auto load vimrc  config
nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>erc :new ~/.vimrc<cr>
autocmd! bufwritepost *vimrc :source ~/.vimrc

" set 80 charact limit for c code file
autocmd BufRead *.c,*.h setlocal cc=80

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
    
    if 'forward' == a:direction
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
