autocmd FileType c,ch,cpp nnoremap <C-]> :call <SID>JumpToTag()<CR>

let s:ctags_filename = 'ctags'
let s:loaded_ctags_db = []

function! s:JumpToTag()
    let r = <SID>FindAndLoadCtagsDb()
    if 1 == r
        execute '<C-]>'
    else
        let p = expand('%:P:h')
        echohl WarningMsg | echo "Can not find ctags db file, please input a path to generate:" | echohl None
        let target_dir = input("", p, 'dir')
        if '' != target_dir
            let target_dir = <SID>CheckAbsolutePath(target_dir, p)
            call CreateCtagsDb()
            if 1 == <SID>FindAndLoadCtagsDb()
                excute '<C-]>'
            else
                echo 'error occured'
        endif
    endif
endfunction

function! s:FindAndLoadCtagsDb()
    " first to check is db is already loaded
    let p = expand('%:P:h')
    let f = substitute(p,'\\','/','g')
    for loaded_db in s:loaded_ctags_db
        if f =~ loaded_db.'*$'
            return 1
        endif
    endfor

    " try to load db
    let max = 10
    let dir = './'
    for i in range(10)
        let ctagfile = dir.s:ctags_filename
        if filereadable(ctagfile)
            execute 'set ctags = '.ctagfile
            call add(s:loaded_ctags_db, ctagfile)
            return 1
        endif
    endfor

    return 0
endfunction
