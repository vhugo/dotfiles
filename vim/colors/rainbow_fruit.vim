" Vim color file - rainbow_fruit
" Generated by http://bytefluent.com/vivify 2016-03-26
set background=light
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "rainbow_fruit"

"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi PMenuSbar -- no settings --
hi Normal guifg=#404040 guibg=#f8f8f8 guisp=#f8f8f8 gui=NONE ctermfg=238 ctermbg=15 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi Float -- no settings --
"hi CursorLine -- no settings --
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi VisualNOS -- no settings --
"hi CursorColumn -- no settings --
"hi EnumerationName -- no settings --
"hi SpellCap -- no settings --
"hi SpellLocal -- no settings --
"hi DefinedName -- no settings --
"hi MatchParen -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi TabLine -- no settings --
"hi clear -- no settings --
"hi htmlitalic -- no settings --
"hi htmlboldunderlineitalic -- no settings --
"hi htmlbolditalic -- no settings --
"hi htmlunderlineitalic -- no settings --
"hi htmlbold -- no settings --
"hi htmlboldunderline -- no settings --
"hi htmlunderline -- no settings --
hi IncSearch guifg=#404040 guibg=#40ffff guisp=#40ffff gui=NONE ctermfg=238 ctermbg=87 cterm=NONE
hi WildMenu guifg=#f8f8f8 guibg=#ff4080 guisp=#ff4080 gui=NONE ctermfg=15 ctermbg=13 cterm=NONE
hi SpecialComment guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi Typedef guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Title guifg=#0050a0 guibg=#c0e8ff guisp=#c0e8ff gui=NONE ctermfg=25 ctermbg=153 cterm=NONE
hi Folded guifg=#20605c guibg=#b8e8dc guisp=#b8e8dc gui=NONE ctermfg=23 ctermbg=152 cterm=NONE
hi PreCondit guifg=#e06800 guibg=NONE guisp=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi Include guifg=#e06800 guibg=NONE guisp=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#a4a4a4 guibg=#404040 guisp=#404040 gui=NONE ctermfg=248 ctermbg=238 cterm=NONE
hi NonText guifg=#00a0c0 guibg=#ececec guisp=#ececec gui=NONE ctermfg=4 ctermbg=255 cterm=NONE
hi DiffText guifg=#e04040 guibg=#ffd8d8 guisp=#ffd8d8 gui=NONE ctermfg=167 ctermbg=224 cterm=NONE
hi ErrorMsg guifg=#ff0000 guibg=#ffe4e4 guisp=#ffe4e4 gui=NONE ctermfg=196 ctermbg=224 cterm=NONE
hi Ignore guifg=#f8f8f8 guibg=NONE guisp=NONE gui=NONE ctermfg=15 ctermbg=NONE cterm=NONE
hi Debug guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi Identifier guifg=#008888 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi Conditional guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Todo guifg=#ff0070 guibg=#ffe0f4 guisp=#ffe0f4 gui=NONE ctermfg=197 ctermbg=225 cterm=NONE
hi Special guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi LineNr guifg=#acacac guibg=NONE guisp=NONE gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#f8f8f8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
hi Label guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#f8f8f8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
hi Search guifg=#404040 guibg=#ffff60 guisp=#ffff60 gui=NONE ctermfg=238 ctermbg=227 cterm=NONE
hi Delimiter guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi Statement guifg=#f030d0 guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Comment guifg=#ff4080 guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Character guifg=#8016ff guibg=NONE guisp=NONE gui=NONE ctermfg=93 ctermbg=NONE cterm=NONE
hi Number guifg=#8016ff guibg=NONE guisp=NONE gui=NONE ctermfg=93 ctermbg=NONE cterm=NONE
hi Boolean guifg=#f030d0 guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Operator guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Question guifg=#f030d0 guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#ff0000 guibg=#ffe4e4 guisp=#ffe4e4 gui=NONE ctermfg=196 ctermbg=224 cterm=NONE
hi DiffDelete guifg=#4848ff guibg=#ffd0ff guisp=#ffd0ff gui=NONE ctermfg=63 ctermbg=225 cterm=NONE
hi ModeMsg guifg=#ff4080 guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Define guifg=#e06800 guibg=NONE guisp=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi Function guifg=#008888 guibg=NONE guisp=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#40a098 guibg=#f0f0f0 guisp=#f0f0f0 gui=NONE ctermfg=73 ctermbg=255 cterm=NONE
hi PreProc guifg=#e06800 guibg=NONE guisp=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi Visual guifg=#484848 guibg=#e0e0e0 guisp=#e0e0e0 gui=NONE ctermfg=238 ctermbg=254 cterm=NONE
hi MoreMsg guifg=#009070 guibg=NONE guisp=NONE gui=NONE ctermfg=29 ctermbg=NONE cterm=NONE
hi VertSplit guifg=#f8f8f8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
hi Exception guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Keyword guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Type guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#408040 guibg=#d0f0d0 guisp=#d0f0d0 gui=NONE ctermfg=65 ctermbg=194 cterm=NONE
hi Cursor guifg=#0000ff guibg=#00e0ff guisp=#00e0ff gui=NONE ctermfg=21 ctermbg=45 cterm=NONE
hi Error guifg=#ffffff guibg=#ff4080 guisp=#ff4080 gui=NONE ctermfg=15 ctermbg=13 cterm=NONE
hi PMenu guifg=#a4a4a4 guibg=#404040 guisp=#404040 gui=NONE ctermfg=248 ctermbg=238 cterm=NONE
hi SpecialKey guifg=#4040ff guibg=NONE guisp=NONE gui=NONE ctermfg=13 ctermbg=NONE cterm=NONE
hi Constant guifg=#8016ff guibg=NONE guisp=NONE gui=NONE ctermfg=93 ctermbg=NONE cterm=NONE
hi Tag guifg=#4a9400 guibg=NONE guisp=NONE gui=NONE ctermfg=64 ctermbg=NONE cterm=NONE
hi String guifg=#8016ff guibg=NONE guisp=NONE gui=NONE ctermfg=93 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#acacac guisp=#acacac gui=NONE ctermfg=NONE ctermbg=145 cterm=NONE
hi Repeat guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Directory guifg=#0070b8 guibg=NONE guisp=NONE gui=NONE ctermfg=25 ctermbg=NONE cterm=NONE
hi Structure guifg=#0070e6 guibg=NONE guisp=NONE gui=NONE ctermfg=26 ctermbg=NONE cterm=NONE
hi Macro guifg=#e06800 guibg=NONE guisp=NONE gui=NONE ctermfg=166 ctermbg=NONE cterm=NONE
hi Underlined guifg=#404040 guibg=NONE guisp=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
hi DiffAdd guifg=#4848ff guibg=#ffd0ff guisp=#ffd0ff gui=NONE ctermfg=63 ctermbg=225 cterm=NONE
hi cursorim guifg=#f8f8f8 guibg=#8000ff guisp=#8000ff gui=NONE ctermfg=15 ctermbg=93 cterm=NONE
hi identifier guifg=#c9ceff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi string guifg=#cae682 guibg=NONE guisp=NONE gui=italic ctermfg=150 ctermbg=NONE cterm=NONE
hi lcursor guifg=#f8f8f8 guibg=#8000ff guisp=#8000ff gui=NONE ctermfg=15 ctermbg=93 cterm=NONE
hi htmllink guifg=#abcdef guibg=NONE guisp=NONE gui=NONE ctermfg=153 ctermbg=NONE cterm=NONE
hi special guifg=#9ab2c8 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=152 ctermbg=236 cterm=NONE
hi preproc guifg=#d1d435 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=185 ctermbg=236 cterm=NONE
hi type guifg=#e6ac32 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=172 ctermbg=236 cterm=NONE
hi statement guifg=#62acce guibg=#2a2b2f guisp=#2a2b2f gui=bold ctermfg=74 ctermbg=236 cterm=bold
hi normal guifg=#e1e0e5 guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=254 ctermbg=236 cterm=NONE
hi constant guifg=#d1c79e guibg=#2a2b2f guisp=#2a2b2f gui=NONE ctermfg=187 ctermbg=236 cterm=NONE
hi underlined guifg=#e1e0e5 guibg=#2a2b2f guisp=#2a2b2f gui=underline ctermfg=254 ctermbg=236 cterm=underline
