set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "aaron"

" Make sure the background is black
hi Normal ctermfg=White ctermbg=Black guifg=White guibg=Black

" Changes to default color scheme.
highlight ColorColumn ctermbg=8    guibg=#4e4e4e   " Set vertical rule color
highlight SpellBad    ctermbg=237  cterm=underline " Set bad spelling color
highlight SpellRare   ctermbg=237  cterm=underline " Set rare spelling color
highlight CursorLine  cterm=NONE   ctermbg=236     " Set cursor line color
highlight SpecialKey  ctermfg=240  guifg=#585858   " Set the color for special white space characters
highlight Conceal     ctermbg=NONE guibg=NONE      " Do not highlight concealed text.
highlight! link SignColumn LineNr                  " Set the line color for gitgutter.

" Diff changes to the default color scheme.
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=NONE guibg=#103500
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=NONE guibg=#420000
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=NONE guibg=#001250
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=NONE guibg=#4c4c00

