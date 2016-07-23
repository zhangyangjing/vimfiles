"shove this in ~/.vim/nerdtree_plugin/grep_menuitem.vim
"
"A really rough integration of :grep with nerdtree. Adds a 'g' menu item that
"prompts the user for a search pattern to use with :grep. :grep is run on the
"selected dir (using the parent if a file is selected)
"
" Originally written by scrooloose
" (http://gist.github.com/205807)

if exists("g:loaded_nerdtree_find_menuitem")
    finish
endif
let g:loaded_nerdtree_find_menuitem = 1

call NERDTreeAddMenuItem({
            \ 'text': '(f)ind directory',
            \ 'shortcut': 'f',
            \ 'callback': 'NERDTreeFind' })

function! NERDTreeFind()
    let dirnode = g:NERDTreeDirNode.GetSelected()

    let pattern = input("Enter the find pattern: ")
    if pattern == ''
        echo 'Aborted'
        return
    endif

    "use the previous window to jump to the first search result
    wincmd w

    "a hack for *nix to make sure the output of "grep" isnt echoed in vim
    let old_shellpipe = &shellpipe
    let &shellpipe='&>'

    try
        exec 'silent cd ' . dirnode.path.str()
        call setqflist([])
        let find_out = system('find . -type file -name "' . pattern . '"')
    finally
        let &shellpipe = old_shellpipe
    endtry

    redraw!

    let find_out_lines = split(find_out)
    let quickfix_list = []
    for file_name in find_out_lines
        call add(quickfix_list, {'filename': file_name})
    endfor
    call setqflist(quickfix_list)

    let hits = len(getqflist())
    if hits == 0
        echom "No hits"
    elseif hits > 0
        copen
    endif
endfunction
