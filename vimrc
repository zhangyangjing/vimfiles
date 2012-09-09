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

nnoremap <C-J> <C-F>
nnoremap <C-K> <C-B>

nmap <leader>g <C-]>
nmap <leader>b <C-O>
nmap <leader>d <C-I>

nnoremap <leader>ss :source ~/.vimrc<CR>
nnoremap <leader>erc :new ~/.vimrc<cr>
autocmd! bufwritepost *vimrc :source ~/.vimrc

"自动补全
"inoremap ( ()<ESC>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {<CR>}<ESC>O
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
"inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
"function! ClosePair(char)
"    if getline('.')[col('.') - 1] == a:char
"        return "\<Right>"
"    else
"        return a:char
"    endif
"endfunction
"
"inoremap ( ()<ESC>i
"inoremap ) <c-r>=ClosePair(')')<CR>
"inoremap { {<CR>}<ESC>O
"inoremap } <c-r>=ClosePair('}')<CR>
"inoremap [ []<ESC>i
"inoremap ] <c-r>=ClosePair(']')<CR>


"function! AutoLoadCTagsAndCScope()
"    let max = 6
"    let dir = './'
"    let i = 0
"    let break = 0
"    while isdirectory(dir) && i < max
"        if filereadable(dir . 'cscope.out') 
"            execute 'cs add ' . dir . 'cscope.out'
"            echo 'cs add ' . dir . 'cscope.out'
"            let break = 1
"        endif
"        if filereadable(dir . 'tags')
"            execute 'set tags =' . dir . 'tags'
"            let break = 1
"        endif
"        if break == 1
"            execute 'lcd ' . dir
"            break
"        endif
"        let dir = dir . '../'
"        let i = i + 1
"    endwhile
"endf
"nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
"autocmd FileType c,ch,cp call AutoLoadCTagsAndCScope()

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
