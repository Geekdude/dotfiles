" Vim color file
" Converted from Textmate theme Notepad++ using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Notepad++"

hi Cursor ctermfg=15 ctermbg=0 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=250 cterm=NONE guifg=NONE guibg=#c0c0c0 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=244 ctermbg=15 cterm=NONE guifg=#808080 guibg=#ffffff gui=NONE
hi VertSplit ctermfg=249 ctermbg=249 cterm=NONE guifg=#b5b5b5 guibg=#b5b5b5 gui=NONE
hi MatchParen ctermfg=0 ctermbg=NONE cterm=underline guifg=#000000 guibg=NONE gui=underline
hi StatusLine ctermfg=0 ctermbg=249 cterm=bold guifg=#000000 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE guifg=#000000 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=250 cterm=NONE guifg=NONE guibg=#c0c0c0 gui=NONE
" hi IncSearch ctermfg=15 ctermbg=93 cterm=NONE guifg=#ffffff guibg=#8000ff gui=NONE
" hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=58 ctermbg=NONE cterm=NONE guifg=#644511 guibg=NONE gui=NONE
hi Folded ctermfg=28 ctermbg=15 cterm=NONE guifg=#008000 guibg=#ffffff gui=NONE

hi Normal ctermfg=0 ctermbg=15 cterm=NONE guifg=#333333 guibg=#ffffff gui=NONE
hi Boolean ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi Character ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi Comment ctermfg=28 ctermbg=NONE cterm=NONE guifg=#008000 guibg=NONE gui=NONE
hi Conditional ctermfg=21 ctermbg=NONE cterm=bold guifg=#0000ff guibg=NONE gui=bold,italic
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi DiffAdd ctermfg=0 ctermbg=149 cterm=bold guifg=#000000 guibg=#a1e85d gui=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f25454 guibg=NONE gui=NONE
hi DiffChange ctermfg=0 ctermbg=152 cterm=NONE guifg=#000000 guibg=#b9cfe7 gui=NONE
hi DiffText ctermfg=0 ctermbg=74 cterm=bold guifg=#000000 guibg=#729fcf gui=bold
hi ErrorMsg ctermfg=160 ctermbg=NONE cterm=NONE guifg=#eb291c guibg=NONE gui=NONE
hi WarningMsg ctermfg=160 ctermbg=NONE cterm=NONE guifg=#eb291c guibg=NONE gui=NONE
hi Float ctermfg=196 ctermbg=NONE cterm=NONE guifg=#ff0000 guibg=NONE gui=NONE
hi Function ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi Identifier ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi Include ctermfg=21 ctermbg=NONE cterm=bold guifg=#0000ff guibg=NONE gui=bold,italic
hi Keyword ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi Label ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi NonText ctermfg=250 ctermbg=231 cterm=NONE guifg=#bfbfbf guibg=#f2f2f2 gui=NONE
hi Number ctermfg=196 ctermbg=NONE cterm=NONE guifg=#ff0000 guibg=NONE gui=NONE
hi Operator ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi PreProc ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=250 ctermbg=254 cterm=NONE guifg=#bfbfbf guibg=#e6e6e6 gui=NONE
hi Statement ctermfg=21 ctermbg=NONE cterm=bold guifg=#0000ff guibg=NONE gui=bold,italic
hi StorageClass ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi String ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi Structure ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi Tag ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=28 ctermbg=NONE cterm=inverse,bold guifg=#008000 guibg=NONE gui=inverse,bold
hi Type ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=21 ctermbg=NONE cterm=bold guifg=#0000ff guibg=NONE gui=bold,italic
hi rubyFunction ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=58 ctermbg=NONE cterm=NONE guifg=#644511 guibg=NONE gui=NONE
hi rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi rubyBlockParameter ctermfg=166 ctermbg=NONE cterm=NONE guifg=#c96916 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyInclude ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi rubyRegexpDelimiter ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi rubyEscape ctermfg=58 ctermbg=NONE cterm=NONE guifg=#644511 guibg=NONE gui=NONE
hi rubyControl ctermfg=21 ctermbg=NONE cterm=bold guifg=#0000ff guibg=NONE gui=bold,italic
hi rubyClassVariable ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyOperator ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi rubyException ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=196 ctermbg=NONE cterm=NONE guifg=#f02a1d guibg=NONE gui=NONE
hi erubyComment ctermfg=28 ctermbg=NONE cterm=NONE guifg=#008000 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=58 ctermbg=NONE cterm=NONE guifg=#644511 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=18 ctermbg=NONE cterm=bold guifg=#000080 guibg=NONE gui=bold,italic
hi javaScriptRailsFunction ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi yamlAnchor ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi yamlAlias ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=93 ctermbg=NONE cterm=bold guifg=#8000ff guibg=NONE gui=bold
hi cssURL ctermfg=166 ctermbg=NONE cterm=NONE guifg=#c96916 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi cssColor ctermfg=58 ctermbg=NONE cterm=NONE guifg=#644511 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=208 ctermbg=NONE cterm=bold guifg=#ff8000 guibg=NONE gui=bold
hi cssClassName ctermfg=196 ctermbg=NONE cterm=NONE guifg=#ff0000 guibg=NONE gui=NONE
hi cssValueLength ctermfg=196 ctermbg=NONE cterm=NONE guifg=#ff0000 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
