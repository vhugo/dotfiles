" Vim color file - pyte
" Generated by http://bytefluent.com/vivify 2016-03-26
set background=light
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "pyte"

"hi IncSearch -- no settings --
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#202020 guibg=#f0f0f0 guisp=#f0f0f0 gui=NONE ctermfg=234 ctermbg=255 cterm=NONE
"hi CTagsImport -- no settings --
"hi Search -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi ModeMsg -- no settings --
"hi FoldColumn -- no settings --
"hi EnumerationName -- no settings --
"hi Visual -- no settings --
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi Directory -- no settings --
"hi clear -- no settings --
"hi htmlitalic -- no settings --
"hi htmlboldunderlineitalic -- no settings --
"hi htmlbolditalic -- no settings --
"hi htmlunderlineitalic -- no settings --
"hi htmlbold -- no settings --
"hi htmlboldunderline -- no settings --
"hi htmlunderline -- no settings --
hi SpecialComment guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi Typedef guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi Title guifg=#202020 guibg=NONE guisp=NONE gui=bold ctermfg=234 ctermbg=NONE cterm=bold
hi Folded guifg=#708090 guibg=#c0d0e0 guisp=#c0d0e0 gui=NONE ctermfg=60 ctermbg=146 cterm=NONE
hi PreCondit guifg=#1060a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Include guifg=#1060a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#f0f0f0 guisp=#f0f0f0 gui=bold,italic ctermfg=NONE ctermbg=255 cterm=bold
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 guisp=#a0b0c0 gui=italic ctermfg=60 ctermbg=103 cterm=NONE
hi NonText guifg=#c0c0c0 guibg=#e0e0e0 guisp=#e0e0e0 gui=NONE ctermfg=7 ctermbg=254 cterm=NONE
hi DiffText guifg=NONE guibg=#f0c8c8 guisp=#f0c8c8 gui=bold,italic ctermfg=NONE ctermbg=224 cterm=bold
hi Debug guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#c0d0e0 guisp=#c0d0e0 gui=NONE ctermfg=NONE ctermbg=146 cterm=NONE
hi Identifier guifg=#5b3674 guibg=NONE guisp=NONE gui=italic ctermfg=96 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi Conditional guifg=#4c8f2f guibg=NONE guisp=NONE gui=bold ctermfg=28 ctermbg=NONE cterm=bold
hi StorageClass guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi Todo guifg=#a0b0c0 guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=103 ctermbg=NONE cterm=bold,underline
hi Special guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi LineNr guifg=#ffffff guibg=#c0d0e0 guisp=#c0d0e0 gui=NONE ctermfg=15 ctermbg=146 cterm=NONE
hi StatusLine guifg=#ffffff guibg=#8090a0 guisp=#8090a0 gui=bold,italic ctermfg=15 ctermbg=103 cterm=bold
hi Label guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#ffffff guibg=#8090a0 guisp=#8090a0 gui=NONE ctermfg=15 ctermbg=103 cterm=NONE
hi Delimiter guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi Statement guifg=#007020 guibg=NONE guisp=NONE gui=bold ctermfg=2 ctermbg=NONE cterm=bold
hi Comment guifg=#a0b0c0 guibg=NONE guisp=NONE gui=italic ctermfg=103 ctermbg=NONE cterm=NONE
hi Character guifg=#a07040 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi Float guifg=#70a040 guibg=NONE guisp=NONE gui=NONE ctermfg=107 ctermbg=NONE cterm=NONE
hi Number guifg=#40a070 guibg=NONE guisp=NONE gui=NONE ctermfg=72 ctermbg=NONE cterm=NONE
hi Boolean guifg=#007020 guibg=NONE guisp=NONE gui=bold ctermfg=2 ctermbg=NONE cterm=bold
hi Operator guifg=#408010 guibg=NONE guisp=NONE gui=NONE ctermfg=2 ctermbg=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#f6f6f6 guisp=#f6f6f6 gui=NONE ctermfg=NONE ctermbg=255 cterm=NONE
hi TabLineFill guifg=#9098a0 guibg=NONE guisp=NONE gui=NONE ctermfg=247 ctermbg=NONE cterm=NONE
hi DiffDelete guifg=NONE guibg=#f0e0b0 guisp=#f0e0b0 gui=bold,italic ctermfg=NONE ctermbg=223 cterm=bold
hi CursorColumn guifg=NONE guibg=#eaeaea guisp=#eaeaea gui=NONE ctermfg=NONE ctermbg=255 cterm=NONE
hi Define guifg=#1060a0 guibg=NONE guisp=NONE gui=bold ctermfg=25 ctermbg=NONE cterm=bold
hi Function guifg=#06287e guibg=NONE guisp=NONE gui=italic ctermfg=6 ctermbg=NONE cterm=NONE
hi PreProc guifg=#1060a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#a0b0c0 guibg=#a0b0c0 guisp=#a0b0c0 gui=NONE ctermfg=103 ctermbg=103 cterm=NONE
hi Exception guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi Keyword guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi Type guifg=#e5a00d guibg=NONE guisp=NONE gui=italic ctermfg=172 ctermbg=NONE cterm=NONE
hi DiffChange guifg=NONE guibg=#e0e0e0 guisp=#e0e0e0 gui=bold,italic ctermfg=NONE ctermbg=254 cterm=bold
hi Cursor guifg=#000000 guibg=#b0b4b8 guisp=#b0b4b8 gui=NONE ctermfg=NONE ctermbg=250 cterm=NONE
hi Error guifg=#ff0000 guibg=#ffffff guisp=#ffffff gui=bold,underline ctermfg=196 ctermbg=15 cterm=bold,underline
hi PMenu guifg=#ffffff guibg=#808080 guisp=#808080 gui=NONE ctermfg=15 ctermbg=8 cterm=NONE
hi SpecialKey guifg=#d8a080 guibg=#e8e8e8 guisp=#e8e8e8 gui=italic ctermfg=180 ctermbg=254 cterm=NONE
hi Constant guifg=#a07040 guibg=NONE guisp=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
hi Tag guifg=#70a0d0 guibg=NONE guisp=NONE gui=italic ctermfg=110 ctermbg=NONE cterm=NONE
hi String guifg=#4070a0 guibg=NONE guisp=NONE gui=NONE ctermfg=67 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=NONE ctermbg=15 cterm=NONE
hi MatchParen guifg=#ffffff guibg=#80a090 guisp=#80a090 gui=bold ctermfg=15 ctermbg=108 cterm=bold
hi Repeat guifg=#7fbf58 guibg=NONE guisp=NONE gui=bold ctermfg=107 ctermbg=NONE cterm=bold
hi Structure guifg=#007020 guibg=NONE guisp=NONE gui=italic ctermfg=2 ctermbg=NONE cterm=NONE
hi Macro guifg=#1060a0 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Underlined guifg=#202020 guibg=NONE guisp=NONE gui=underline ctermfg=234 ctermbg=NONE cterm=underline
hi DiffAdd guifg=NONE guibg=#c0e0d0 guisp=#c0e0d0 gui=bold,italic ctermfg=NONE ctermbg=151 cterm=bold
hi TabLine guifg=#000000 guibg=#b0b8c0 guisp=#b0b8c0 gui=italic ctermfg=NONE ctermbg=7 cterm=NONE
hi cursorim guifg=#242424 guibg=#96cdcd guisp=#96cdcd gui=NONE ctermfg=235 ctermbg=152 cterm=NONE
hi identifier guifg=#c9ceff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi string guifg=#cae682 guibg=NONE guisp=NONE gui=italic ctermfg=150 ctermbg=NONE cterm=NONE
hi lcursor guifg=#000000 guibg=#ffffff guisp=#ffffff gui=NONE ctermfg=NONE ctermbg=15 cterm=NONE
hi htmllink guifg=#abcdef guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi special guifg=#9ab2c8 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=152 ctermbg=236 cterm=NONE
hi preproc guifg=#d1d435 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=185 ctermbg=236 cterm=NONE
hi type guifg=#e6ac32 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=172 ctermbg=236 cterm=NONE
hi statement guifg=#62acce guibg=#2a2b2f guisp=#2a2b2f gui=bold ctermfg=74 ctermbg=236 cterm=bold
hi normal guifg=#e1e0e5 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=254 ctermbg=236 cterm=NONE
hi constant guifg=#d1c79e guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
hi underlined guifg=#e1e0e5 guibg=#2a2b2f guisp=#2a2b2f gui=underline ctermfg=254 ctermbg=236 cterm=underline