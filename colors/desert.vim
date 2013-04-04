" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2004/06/13 19:30:30 $
" Last Change:	$Date: 2004/06/13 19:30:30 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.1 2004/06/13 19:30:30 vimboss Exp $

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

"hi Normal	guifg=White guibg=grey20

"" highlight groups
"hi Cursor	guibg=khaki guifg=slategrey
""hi CursorIM
""hi Directory
""hi DiffAdd
""hi DiffChange
""hi DiffDelete
""hi DiffText
""hi ErrorMsg
"hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
"hi Folded	guibg=grey30 guifg=gold
"hi FoldColumn	guibg=grey30 guifg=tan
"hi IncSearch	guifg=slategrey guibg=khaki
""hi LineNr
"hi ModeMsg	guifg=goldenrod
"hi MoreMsg	guifg=SeaGreen
"hi NonText	guifg=LightBlue guibg=grey30
"hi Question	guifg=springgreen
"hi Search	guibg=peru guifg=wheat
"hi SpecialKey	guifg=yellowgreen
"hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
"hi Title	guifg=indianred
"hi Visual	gui=none guifg=khaki guibg=olivedrab
""hi VisualNOS
"hi WarningMsg	guifg=salmon
""hi WildMenu
""hi Menu
""hi Scrollbar
""hi Tooltip

"" syntax highlighting groups
"hi Comment	guifg=SkyBlue
"hi Constant	guifg=#ffa0a0
"hi Identifier	guifg=palegreen
"hi Statement	guifg=khaki
"hi PreProc	guifg=indianred
"hi Type		guifg=darkkhaki
"hi Special	guifg=navajowhite
""hi Underlined
"hi Ignore	guifg=grey40
""hi Error
"hi Todo		guifg=orangered guibg=yellow2

"" color terminal definitions
"hi SpecialKey	ctermfg=darkgreen
"hi NonText	cterm=bold ctermfg=darkblue
"hi Directory	ctermfg=darkcyan
"hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
"hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
"hi Search	cterm=NONE ctermfg=grey ctermbg=blue
"hi MoreMsg	ctermfg=darkgreen
"hi ModeMsg	cterm=NONE ctermfg=brown
"hi Question	ctermfg=green
"hi WarningMsg	ctermfg=1
"hi WildMenu	ctermfg=0 ctermbg=3
"hi Folded	ctermfg=darkgrey ctermbg=NONE
"hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
"hi DiffAdd	ctermbg=4
"hi DiffChange	ctermbg=5
"hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
"hi DiffText	cterm=bold ctermbg=1
"hi Special	ctermfg=5
"hi Identifier	ctermfg=6
"hi Statement	ctermfg=3
"hi PreProc	ctermfg=5
"hi Underlined	cterm=underline ctermfg=5
"hi Ignore	cterm=bold ctermfg=7
"hi Ignore	ctermfg=darkgrey
"hi Error	cterm=bold ctermfg=7 ctermbg=1


hi MatchParen       ctermbg=196

hi Visual	        ctermfg=235 ctermbg=248
hi VisualNOS	    cterm=bold,underline
hi Function         ctermfg=105
hi Comment          ctermfg=58
hi Constant	        ctermfg=64
hi String           ctermfg=70
hi Character        ctermfg=72
hi Number           ctermfg=124
hi Boolean          ctermfg=64

hi Error	cterm=bold ctermfg=7 ctermbg=1
hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1

hi Type	            ctermfg=64
hi Todo             ctermbg=1   ctermfg=255

hi Pmenu            ctermfg=0   ctermbg=246
hi PmenuSel         ctermfg=248   ctermbg=243

hi Directory        cterm=Bold ctermfg=70

hi Normal	        ctermfg=249 ctermbg=234
hi LineNr	        ctermfg=66  ctermbg=235
hi NonText	        ctermfg=66
hi IncSearch	    ctermfg=70 ctermbg=232
hi Search	        ctermfg=232 ctermbg=70


hi StatusLine	    ctermfg=250 ctermbg=233
hi StatusLineNC     ctermfg=244 ctermbg=233
hi VertSplit	    ctermfg=244 ctermbg=237

hi Title	        ctermfg=124
hi TabLineFill      ctermbg=244
hi TabLine          ctermfg=247  ctermbg=243
hi TabLineSel       ctermfg=250  ctermbg=237


hi Cursor           ctermfg=1    ctermbg=1
hi CursorColumn     ctermbg=237
hi CursorLine       ctermbg=237
hi ColorColumn      ctermbg=1
hi ColorLine        ctermbg=1
