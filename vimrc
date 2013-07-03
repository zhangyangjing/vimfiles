""""""""""""""""""
"
" Util
"
""""""""""""""""""
set t_Co=256
colorscheme desert
syntax on
filetype on
filetype plugin indent on
set nu    " show line number`
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
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
autocmd FileType python set omnifunc=pythoncomplete#Complete

" os type
if(has("win32") || has("win64") || has("win95") || has("win16"))
	let g:iswindows = 1
else
	let g:iswindows = 0
endif

" vim type
if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
endif

if g:isGUI
    set go=c
end

if g:isGUI && g:iswindows
    let g:windowAlpha=255
    noremap <silent><F9> :call SetAlpha("down")<CR>
    noremap <silent><F10> :call SetAlpha("up")<CR>
    nnoremap <silent><F11> :call libcallnr("f", "ToggleFullScreen", 0)<CR>
    inoremap <silent><F11> <ESC>:call libcallnr("f", "ToggleFullScreen", 0)<CR>
endif

function! SetAlpha(alpha)
    if 'up' == a:alpha
        let g:windowAlpha += 10
        if 255 < g:windowAlpha
            let g:windowAlpha = 255
        endif
    elseif 'down' == a:alpha
        let g:windowAlpha -= 10
        if 0 > g:windowAlpha
            let g:windowAlpha = 0
        endif
    endif

    call libcallnr("f", "SetAlpha", g:windowAlpha)
endfunction


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

" htlf-auto paste mode
nnoremap <leader>x :set paste<CR>i
autocmd InsertLeave * :set nopaste

" quick to run
noremap <leader>r :!

" search show result in single window
nmap <Leader>/ :exec 'lvimgrep /' . input('>', expand('<cword>')) . '/j % <bar> lopen'<CR>

" auto load vimrc  config
if g:iswindows == 1
    nnoremap <leader>ss :source $HOME/_vimrc<CR>
    autocmd! bufwritepost *vimrc :source $HOME/_vimrc
    nnoremap <leader>erc :new $HOME/_vimrc<cr>
else
    nnoremap <leader>ss :source ~/.vimrc<CR>
    autocmd! bufwritepost *vimrc :source ~/.vimrc
    nnoremap <leader>erc :new ~/.vimrc<cr>
endif

" highlight space at the end of line
highlight whitespaceEOL ctermbg=1 guibg=red
highlight ColorColumn ctermbg=1 guibg=red
autocmd BufNewFile,BufRead * syntax match whitespaceEOL /\s\+$/
autocmd BufNewFile,BufRead * syntax match ColorColumn /\%>80v.\+/
syntax match whitespaceEOL /\s\+$/
syntax match ColorColumn /\%>80v.\+/

"d p u y

""""""""""""""""""
"
" Plugins
"
""""""""""""""""""
" NERDTree
nnoremap <leader>tr :NERDTree<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.sql']
let NERDTreeDirArrows = 0

" Tag List
set autochdir
"let Tlist_Ctag_Cmd="/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
nnoremap <leader>ta :Tlist<CR>

" pydictionary
map <F5> :!python %<CR>
if g:iswindows
    let g:pydiction_location = '$HOME\vimfiles\complete-dict'
else
    let g:pydiction_location = '~/.vim/complete-dict'
endif

" flake8
autocmd FileType python map <buffer> <F7> :call Flake8()<CR>
let g:flake8_ignore="F403"

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

