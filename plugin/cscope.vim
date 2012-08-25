set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
let s:loaded_dbs = []
let s:cscope_db_name = 'cscope.out'

" s: Find this C symbol
map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>


function! CscopeFind(action, word)
    let r = <SID>AutoloadCscopeDB()
    if r
        exe 'lcs f '.a:action.' '.a:word
        lw
    endif
endfunction

function! s:AutoloadCscopeDB()
    let p = expand('%:p:h')
    let f = substitute(p,'\\','/','g')
    for d in s:loaded_dbs
        if f =~ d.'.*$'
            return 1
        endif
    endfor

    if 0 == <SID>FindAndLoadCscopeDb()
        echohl WarningMsg | echo "Can not find proper cscope db, please input a path to generate cscope db for." | echohl None
        let target_dir = input("", p, 'dir')
        if target_dir != ''
            let target_dir = <SID>CheckAbsolutePath(target_dir, p)
            if ! filereadable(target_dir.s:cscope_db_name)
                call <SID>CreateCscopeDb(target_dir)
                let r = <SID>FindAndLoadCscopeDb()
                if 0 == r
                    echo 'error occured'
                    return 0
                endif
            endif
        else
            return 0 
        endif
    endif

    return 1
endfunction

function! s:FindAndLoadCscopeDb()
    let max = 10
    let dir = './'

    for i in range(max)
        let cscopefile = dir.s:cscope_db_name
        if filereadable(cscopefile)
            exe 'cs add '.cscopefile
            call add(s:loaded_dbs, cscopefile)
            return 1
        endif
        let dir = dir.'../'
    endfor

    return 0 
endfunction

function! s:CreateCscopeDb(target_dir)
    echom a:target_dir
    let cscope_files = a:target_dir.'cscope.tmp'

    let files = <SID>ListFiles(a:target_dir)
    call writefile(files, cscope_files)
    exe '!cscope -bkq -i '.cscope_files
    call rename('cscope.out', a:target_dir.s:cscope_db_name)
    call rename('cscope.in.out', a:target_dir.'cscope.in.out')
    call rename('cscope.po.out', a:target_dir.'cscope.po.out')
    call delete(cscope_files)
endfunction

function! s:CheckAbsolutePath(dir, defaultPath)
    let d = a:dir
    while 1
        if !isdirectory(d)
            echohl WarningMsg | echo "Please input a valid path." | echohl None
            let d = input("", a:defaultPath, 'dir')
        elseif (len(d) < 2 || (d[0] != '/' && d[1] != ':'))
            echohl WarningMsg | echo "Please input an absolute path." | echohl None
            let d = input("", a:defaultPath, 'dir')
        else
            break
        endif
    endwhile
    let d = substitute(d,'\\','/','g')

    if '/' != d[len(d)-1]
        let d = d.'/'
    endif

    return d
endfunction

function! s:ListFiles(dir)
    let d = []
    let f = []
    let cwd = a:dir
    let sl = &l:stl
    while cwd != ''
        let a = split(globpath(cwd, "*"), "\n")
        for fn in a
            if getftype(fn) == 'dir'
                call add(d, fn)
            elseif getftype(fn) != 'file'
                continue
            elseif stridx(fn, '.') == -1
                continue
            else
                if stridx(fn, ' ') != -1
                    let fn = '"'.fn.'"'
                endif
                call add(f, fn)
            endif
        endfor
        let cwd = len(d) ? remove(d, 0) : ''
        sleep 1m | let &l:stl = 'Found '.len(f).' files, finding in '.cwd | redrawstatus
    endwhile
    sleep 1m | let &l:stl = sl | redrawstatus
    return f
endfunction
