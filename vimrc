""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
scriptencoding utf-8
set nocompatible               " get rid of Vi compatibility mode. SET FIRST!
execute pathogen#infect()
set backspace=indent,eol,start " Backspace behaviour
set history=1000               " Increase the size of the history
set hidden                     " Allow buffers to be hidden without a message
set noreadonly                 " Do not open diff files in read only.

if !has("win32")
   " Don't use fish for the shell
   if &shell =~# 'fish$'
      set shell=bash
   endif
endif

" Path settings
if has("win32")
   set path+=.\**
else
   set path+=$PWD/**
endif

" Auto complete settings
set complete-=i

" Setup files
if has("win32")
   " Set the directory to store swap files
   set backupdir=~/vimfiles/backup//
   set directory=~/vimfiles/swap//
   set undodir=~/vimfiles/undo//
else
   " Set the directory to store swap files
   set backupdir=~/.vim/backup//
   set directory=~/.vim/swap//
   set undodir=~/.vim/undo//
endif

" Set up undo
set undofile
set undolevels=1000
set undoreload=10000

" Regenerate the spell file if it has changed
if !has("win32")
   for d in glob('~/.vim/spell/*.add', 1, 1)
      if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
         silent exec 'mkspell! ' . fnameescape(d)
      endif
   endfor
endif

" Ctags search
set tags=./.tags;$HOME

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do C-style auto indentation on C/C++/Perl files only
filetype plugin indent on
" enable matchit
runtime macros/matchit.vim
augroup FileEvents
   autocmd! FileEvents
   autocmd Filetype c,cpp,perl setlocal cindent
   " In diff files do not removed trailing white spaces.
   autocmd FileType diff let b:noStripWhitespace=1
   " In Makefiles DO NOT use spaces instead of tabs
   autocmd FileType make setlocal noexpandtab
   " In Ruby files, use 2 spaces instead of 4 for tabs
   autocmd FileType ruby setlocal sw=2 ts=2 sts=2
   " In python files, use 4 spaces
   autocmd FileType python setlocal sw=4 ts=4 sts=4
   " In php and html files use 4 spaces for tabs
   autocmd FileType php,html setlocal sw=4 ts=4 sts=4
   " In latex files, use 2 spaces instead of 4 for tabs
   autocmd FileType tex setlocal sw=2 ts=2 sts=2 "fo+=aw
   " In vhdl files, use 4 spaces
   autocmd FileType vhdl setlocal sw=4 ts=4 sts=4 commentstring=--\ %s
   let g:vhdl_indent_genportmap = 0
   autocmd FileType conf setlocal commentstring=#\ %s
   " In markdown files, use 4 spaces for tabs
   autocmd FileType vimwiki setlocal sw=2 ts=2 sts=2 nowrap fo+=w list
   autocmd FileType vimwiki let b:noStripWhitespace=1
   autocmd FileType markdown setlocal sw=4 ts=4 sts=4 fo+=w list
   autocmd FileType markdown let b:noStripWhitespace=1
   autocmd FileType yaml setlocal sw=2 ts=2 sts=2
   autocmd FileType yaml let b:did_indent = 1
   autocmd FileType yaml setlocal indentexpr=
   autocmd FileType gdscript3 setlocal noexpandtab sw=4 ts=4 sts=4
augroup end

" Enable man page plugin
runtime! ftplugin/man.vim
set keywordprg=:Man

" file is large from 10mb
augroup LargeFile
   let g:large_file = 10485760 " 10MB

   " Set options:
   "   eventignore+=FileType (no syntax highlighting etc
   "   assumes FileType always on)
   "   noswapfile (save copy of file)
   "   bufhidden=unload (save memory when other file is viewed)
   "   buftype=nowritefile (is read-only)
   "   undolevels=-1 (no undo possible)
   au BufReadPre *
            \ let f=expand("<afile>") |
            \ if getfsize(f) > g:large_file |
            \ set eventignore+=FileType |
            \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
            \ else |
            \ set eventignore-=FileType |
            \ endif
augroup END

" Automatically strip training white space in files.
function! <SID>StripTrailingWhitespaces()
    " Only strip if the b:noStripWhitespace variable is not set
    if exists('b:noStripWhitespace')
       return
    endif

    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
augroup StripTrailing
   autocmd! StripTrailing
   autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()  " Remove trailing whitespace on save
augroup end

" Set up some settings for vim-latex
let g:tex_flavor='latex'
" Disable all that folding nonsense
" let Tex_FoldedSections=""
" let Tex_FoldedEnvironments=""
" let Tex_FoldedMisc=""

" Checktime used to detect file changes on disk
set autoread
au CursorHold * checktime

" " Save and restore file views to maintain manual folds.
" autocmd BufWinLeave *.* mkview!
" autocmd BufWinEnter *.* silent loadview

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
if has("gui_running")
   if has("win32")
      set guifont=Ubuntu_Mono:h9:cANSI:qDRAFT
   else
      set guifont=Ubuntu\ Mono\ 10
   endif
else
   " Enable true terminal colors, if supported.
   if (has("termguicolors"))
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
   endif
end

colorscheme aaron

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set incsearch             " But do highlight as you type your search.
set hlsearch              " Highlight found items in the search
set ruler                 " Always show info along bottom.
set visualbell            " Visual bell instead of beeping
set t_vb=                 " Turn off visual bell
set showmode              " Tell you if you are in insert mode
set showmatch             " Match parenthesis
set report=0              " Tell you how many lines have been changed
set display+=lastline     " Do not show @ for lines that will not all fit on a page
set mouse=a               " Enable the mouse
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
" set ignorecase            " Ignore case in search
set smartcase             " Be smart about case.
" set cursorline            " Turn on the cursorline.
if &diff
   set nospell            " Turn spelling off
else
   set spell              " Turn spelling on
end
set colorcolumn=80        " Turn on vertical rule
set laststatus=1          " Show status line with multiple windows.

" Gui Specific Settings
if has("gui_running")
   set guioptions+=c " Use console dialogs instead of popup dialogs.
   " set guioptions-=m " Menu bar is present.
   " set guioptions-=r " Right-hand scrollbar is always present.
   " set guioptions+=b " Bottom scrollbar is always present.
   set guioptions-=T " Include toolbar.
   " set guioptions-=R " Right-hand scrollbar is present when their is a vertical split.
   " set guioptions-=L " Left-hand scrollbar is present when their is a vertical split.
   " set guioptions+=e " Add tab pages.
   augroup Gui
      autocmd! Gui
      autocmd GuiEnter * setlocal visualbell t_vb=
   augroup end
end

" Have netrw ignore .swp files
let g:netrw_list_hide= '.*\.swp$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set tabstop=3             " tab spacing
set softtabstop=3         " unify
set shiftwidth=3          " indent/outdent by 3 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
"set smartindent           " automatically insert one extra level of indentation
"set smarttab              " use tabs at the start of a line, spaces elsewhere
set wrap linebreak        " Wrap at word boundries.
set breakindent           " Continue indention with linebreak
set splitright            " New buffer on right of current
set splitbelow            " New buffer below current
set listchars=trail:·     " Show trailing white spaces with list.
set nojoinspaces          " Do not add an extra space with joining a line that ends with a .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Custom Commands                                                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 50, 1)<CR>
" noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 50, 1)<CR>
" nnoremap <C-e> :Lexplore<CR>
" map <A-h> <C-w>h
" map <A-j> <C-w>j
" map <A-k> <C-w>k
" map <A-l> <C-w>l

"" Fix the & command to call :&&
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Keep cursor in same position after yank
vmap y ygv<Esc>

" Set f2 to toggle paste mode.
set pastetoggle=<F2>

" Set f5 to generate tags for non-latex files
augroup TexTags
   autocmd! TexTags
   autocmd FileType tex let b:latex=1
augroup end
if !exists("b:latex")
   nnoremap <f5> :!ctags -R<CR>
endif

" Set Control C to copy text to system clipboard
" Vim can distiguish between <C-S-v> and <C-v>
" vmap <C-S-c> "+y
" vmap <C-S-x> "+d
" map! <C-S-v> <C-r>+

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" centers the current pane as the middle 2 of 4 imaginary columns
" should be called in a window with a single pane
function CenterPane()
  lefta vnew
  wincmd w
  exec 'vertical resize '. string(&columns * 0.75)
endfunction

" optionally map it to a key:
nnoremap <leader>m :call CenterPane()<cr>

" Search for paragraphs that do no end in a newline.
nnoremap <leader>l<space> /[.!?]'\?'\?\zs\s\+\ze\(\w\\|\\\)<cr>
" Join lines and add a newline at the ends of sentences.
vnoremap <leader>l<space> :s/[.!?]'\?'\?\zs\s\+\ze\(\w\\|\\\)/\r/g<cr>

" Visual-at.vim use @ to apply macro to visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Add ctrl-w m to maximize panel.
nnoremap <C-W>m <C-W>\| <C-W>_

" Duplicate the current tab pane
command! -bar DuplicateTabpane
         \ let s:sessionoptions = &sessionoptions |
         \ try |
         \   let &sessionoptions = 'blank,help,folds,winsize,localoptions' |
         \   let s:file = tempname() |
         \   execute 'mksession ' . s:file |
         \   tabnew |
         \   execute 'source ' . s:file |
         \ finally |
         \   silent call delete(s:file) |
         \   let &sessionoptions = s:sessionoptions |
         \   unlet! s:file s:sessionoptions |
         \ endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 07. Add-on Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CtrlP
let g:ctrlp_map = '<c-p>'
"" For tags use CtrlPTag
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Ignore line to long for python checker
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'
let g:syntastic_python_flake8_args = "--max-line-length=160"
let g:flake8_show_in_gutter=1

"" gitgutter
set updatetime=250

"" Tagbar
nnoremap <silent> <Leader>cc :TagbarOpen fj<CR>
nnoremap <silent> <Leader>cx :TagbarClose<CR>

"" Vim Wiki
let wiki = {}
let wiki.path = '~/Data/vimwiki/wiki/'
let wiki.path_html = '~/Data/vimwiki/html/'
let wiki.template_path = '~/Data/vimwiki/templates/'
let wiki.template_default = 'default'
let wiki.template_ext = '.html'
let wiki.auto_tags = 1
let wiki.auto_toc = 1
let wiki.auto_export = 1
let wiki.list_margin = 0

let g:vimwiki_list = [wiki]

let g:vimwiki_use_mouse = 1
let g:vimwiki_table_mappings = 1
let g:vimwiki_hl_headers = 1
let g:vimwiki_html_header_numbering = 0
let g:vimwiki_global_ext = 0

" Change list behavior for Vimwiki to work how I would like. Enter always
" opens a new line. Shift Enter always creates a bullet.
augroup vimwikibindings
   autocmd! vimwikibindings
   autocmd Filetype vimwiki inoremap <buffer> <CR> <Esc>:VimwikiReturn 4 5<CR>
   autocmd Filetype vimwiki inoremap <buffer> <S-CR> <Esc>:VimwikiReturn 3 2<CR>
augroup end

let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/dotfiles/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }

"" Add vlocal and vfile link types to open in vim.
function! VimwikiLinkHandler(link)
   " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
   "   1) [[vfile:~/Code/PythonProject/abc123.py]]
   "   2) [[vfile:./|Wiki Home]]
   let link = a:link
   if link =~# '^vfile:'
      let link = link[1:]
   else
      return 0
   endif
   let link_infos = vimwiki#base#resolve_link(link)
   if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
   else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
   endif
endfunction

"" vim-zettel
" Filename format. The filename is created using strftime() function
let g:zettel_format = "%Y-%m-%d-%H%M"
" Disable default keymappings
let g:zettel_default_mappings = 0
" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki nmap <leader>zs <Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap <leader>zy <Plug>ZettelYankNameMap
  autocmd FileType vimwiki xmap <leader>z  <Plug>ZettelNewSelectedMap
augroup END

"" notational-fzf-vim
let g:nv_search_paths = ['~/wiki/z']
let g:nv_default_extension = '.wiki'
nnoremap <silent> <leader>nv :NV<CR>

"" Vim Latex
let g:vimtex_imaps_enabled = 0

"" Jedi vim
" let g:jedi#force_py_version = 3
" autocmd FileType python setlocal completeopt-=preview

"" You Complete Me
" let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_auto_trigger = 0
let g:ycm_filetype_whitelist = { 'python': 1 }
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"" Instant Markdown
" Slow down update rate
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"" Language Tool
let g:languagetool_jar = '~/LanguageTool-4.0/languagetool-commandline.jar'

"" fzf
set rtp+=~/.fzf

"" Load autocorrect mappings. This takes a while to load so if vim is too slow
"" comment out this line.
source ~/.vim/bundle/vim-autocorrect/plugin/autocorrect.vim
call AutoCorrect()

"" Do not autoexpand on split for buffergator. This fixes window size
"" changing when using buffergator.
let g:buffergator_autoexpand_on_split = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 08. Set up tab bar in gui
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

" set up tab tooltips with every buffer name
function! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= " \n "
    endif
    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endfunction
set guitabtooltip=%{GuiTabToolTip()}
end
