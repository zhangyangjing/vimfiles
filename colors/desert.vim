" Vim color file

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="desert"


hi Normal	        ctermfg=249 ctermbg=235 guifg=White guibg=grey20

hi Cursor           ctermfg=1    ctermbg=1 guibg=khaki guifg=slategrey
hi CursorColumn     cterm=none  ctermbg=237
hi CursorLine       cterm=none  ctermbg=237
hi ColorColumn      ctermbg=1
hi ColorLine        ctermbg=1

hi StatusLine	    ctermfg=250 ctermbg=233 guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC     ctermfg=244 ctermbg=233 guibg=#c2bfa5 guifg=grey50 gui=none
hi VertSplit	    ctermfg=244 ctermbg=237 guibg=#c2bfa5 guifg=grey50 gui=none
hi LineNr	        ctermfg=66  ctermbg=237 guibg=grey30  guifg=#3a69b7

hi Title	        cterm=none ctermfg=124  gui=none guifg=indianred
hi TabLineFill      cterm=none ctermbg=244  gui=none guibg=#c2bfa5
hi TabLine          cterm=none ctermfg=247  ctermbg=243 gui=none
hi TabLineNum       cterm=none ctermfg=124  ctermbg=243 gui=none
hi TabLineSel       cterm=none ctermfg=250  ctermbg=235 gui=none
hi TabLineSelNum    cterm=none ctermfg=124  ctermbg=235 gui=none

hi ErrorMsg	        cterm=bold ctermfg=7 ctermbg=1
hi ModeMsg	        guifg=goldenrod
hi MoreMsg	        guifg=SeaGreen
hi Question	        guifg=springgreen
hi WarningMsg	    guifg=salmon

hi NonText	        ctermfg=66 guifg=LightBlue
hi IncSearch	    ctermfg=70 ctermbg=232 guifg=slategrey guibg=khaki
hi Search	        ctermfg=232 ctermbg=70 guibg=peru guifg=wheat
hi MatchParen       ctermbg=196
hi SpecialKey	    guifg=yellowgreen

hi Visual	        ctermfg=235 ctermbg=248 gui=none guifg=khaki guibg=olivedrab
hi VisualNOS	    cterm=bold,underline

hi Pmenu            ctermfg=0   ctermbg=246
hi PmenuSel         ctermfg=248   ctermbg=243

hi Directory        cterm=Bold ctermfg=70
hi Folded	        guibg=grey30 guifg=gold
hi FoldColumn	    guibg=grey30 guifg=tan

hi Comment          ctermfg=58 guifg=SkyBlue
hi Constant	        ctermfg=64 guifg=#ffa0a0
hi String           ctermfg=70
hi Character        ctermfg=72
hi Number           ctermfg=124
hi Boolean          ctermfg=64
hi Identifier	    guifg=palegreen
hi Statement	    guifg=khaki
hi PreProc	        guifg=indianred
hi Special	        guifg=navajowhite
hi Ignore	        guifg=grey40
hi Type	            ctermfg=64  guifg=darkkhaki
hi Todo             ctermbg=1   ctermfg=255 guifg=orangered guibg=yellow2
hi Error	        cterm=bold ctermfg=7 ctermbg=1
