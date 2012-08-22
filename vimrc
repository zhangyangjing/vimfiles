""""""""""""""""""
"
" Util
"
""""""""""""""""""
syntax on
filetype on
filetype plugin indent on
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
set matchtime=2
set incsearch   " hilight hit word when type in search key work
set hlsearch    " hilight all matched word when searching(after type enter)
set nobackup
set noswapfile
colorscheme default
set nocompatible

let g:mapleader=","

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

nmap <leader>g <C-]>
nmap <leader>b <C-T>

map <leader>ss :source ~/.vimrc<CR>
map <leader>evrc :e ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

"自动补全
inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
set completeopt=longest,menu

function! AutoLoadCTagsAndCScope()
    let max = 6
    let dir = './'
    let i = 0
    let break = 0
    while isdirectory(dir) && i < max
        if filereadable(dir . 'cscope.out') 
            execute 'cs add ' . dir . 'cscope.out'
            let break = 1
        endif
        if filereadable(dir . 'tags')
            execute 'set tags =' . dir . 'tags'
            let break = 1
        endif
        if break == 1
            execute 'lcd ' . dir
            break
        endif
        let dir = dir . '../'
        let i = i + 1
    endwhile
endf
nmap <F7> :call AutoLoadCTagsAndCScope()<CR>
call AutoLoadCTagsAndCScope()

""""""""""""""""""
"
" Plugins
"
""""""""""""""""""
" NERDTree
nmap <leader>tr :NERDTree<CR>

" Tag List
set tags=tags;
set autochdir
let Tlist_Ctag_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Left_Window = 1
nmap <leader>tl :Tlist<CR>

" PyDictionary
map <F5> :!python %<CR>
let g:pydiction_location = '~/.vim/complete-dict'
