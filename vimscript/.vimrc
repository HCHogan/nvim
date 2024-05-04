"  _   _  ____ _   _                         _
" | | | |/ ___| | | | ___   __ _  __ _ _ __ ( )___
" | |_| | |   | |_| |/ _ \ / _` |/ _` | '_ \|// __|
" |  _  | |___|  _  | (_) | (_| | (_| | | | | \__ \
" |_| |_|\____|_| |_|\___/ \__, |\__,_|_| |_| |___/
"                           |___/
"  _   ___     _____ __  __ ____   ____
" | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" |  \| |\ \ / / | || |\/| | |_) | |
" | |\  | \ V /  | || |  | |  _ <| |___
" |_| \_|  \_/  |___|_|  |_|_| \_\\____|
"
" Author: @HCHogan

" ===core settings===
set nocp
set encoding=utf-8
set guicursor=n-v-c-i:block-Cursor
let mapleader=" "
exec "nohlsearch"

syntax on
filetype plugin indent on

set number
set mouse=a
set showcmd
set path+=**
set wildmenu
set relativenumber
set hlsearch
set title
set showcmd
set showmode
set termguicolors

set incsearch
set ignorecase
set smartcase
set cursorline

set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=5
set laststatus=2

" mappings
noremap J 5gj
noremap K 5gk
noremap H 5h
noremap L 5l

nmap ; :
nmap j gj
nmap k gk
"nmap <LEADER>e :Vex<CR>

map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

map <LEADER>n :tabnew<CR>
map <LEADER>c :tabclose<CR>
map <LEADER>w :w<CR>
map <LEADER>q :q<CR>
map <LEADER>Q :q!<CR>

map <LEADER>uw :set wrap!<CR>
map <LEADER>ui4 :set tabstop=4<CR>:set softtabstop=4<CR>:set shiftwidth=4<CR>
map <LEADER>ui2 :set tabstop=2<CR>:set softtabstop=2<CR>:set shiftwidth=2<CR>

map [b :tabnext<CR>
map ]b :tabprev<CR>

" ===catppuccin_mocha===
set background=dark
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='catppuccin_mocha'
set t_Co=256

let s:rosewater = "#F5E0DC"
let s:flamingo = "#F2CDCD"
let s:pink = "#F5C2E7"
let s:mauve = "#CBA6F7"
let s:red = "#F38BA8"
let s:maroon = "#EBA0AC"
let s:peach = "#FAB387"
let s:yellow = "#F9E2AF"
let s:green = "#A6E3A1"
let s:teal = "#94E2D5"
let s:sky = "#89DCEB"
let s:sapphire = "#74C7EC"
let s:blue = "#89B4FA"
let s:lavender = "#B4BEFE"

let s:text = "#CDD6F4"
let s:subtext1 = "#BAC2DE"
let s:subtext0 = "#A6ADC8"
let s:overlay2 = "#9399B2"
let s:overlay1 = "#7F849C"
let s:overlay0 = "#6C7086"
let s:surface2 = "#585B70"
let s:surface1 = "#45475A"
let s:surface0 = "#313244"

let s:base = "#1E1E2E"
let s:mantle = "#181825"
let s:crust = "#11111B"

function! s:hi(group, guisp, guifg, guibg, gui, cterm)
  let cmd = ""
  if a:guisp != ""
    let cmd = cmd . " guisp=" . a:guisp
  endif
  if a:guifg != ""
    let cmd = cmd . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    let cmd = cmd . " guibg=" . a:guibg
  endif
  if a:gui != ""
    let cmd = cmd . " gui=" . a:gui
  endif
  if a:cterm != ""
    let cmd = cmd . " cterm=" . a:cterm
  endif
  if cmd != ""
    exec "hi " . a:group . cmd
  endif
endfunction



call s:hi("Normal", "NONE", s:text, s:base, "NONE", "NONE")
call s:hi("Visual", "NONE", "NONE", s:surface1,"bold", "bold")
call s:hi("Conceal", "NONE", s:overlay1, "NONE", "NONE", "NONE")
call s:hi("ColorColumn", "NONE", "NONE", s:surface0, "NONE", "NONE")
call s:hi("Cursor", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("lCursor", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("CursorIM", "NONE", s:base, s:text, "NONE", "NONE")
call s:hi("CursorColumn", "NONE", "NONE", s:mantle, "NONE", "NONE")
call s:hi("CursorLine", "NONE", "NONE", s:surface0, "NONE", "NONE")
call s:hi("Directory", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("DiffAdd", "NONE", s:base, s:green, "NONE", "NONE")
call s:hi("DiffChange", "NONE", s:base, s:yellow, "NONE", "NONE")
call s:hi("DiffDelete", "NONE", s:base, s:red, "NONE", "NONE")
call s:hi("DiffText", "NONE", s:base, s:blue, "NONE", "NONE")
call s:hi("EndOfBuffer", "NONE", "NONE", "NONE", "NONE", "NONE")
call s:hi("ErrorMsg", "NONE", s:red, "NONE", "bolditalic"    , "bold,italic")
call s:hi("VertSplit", "NONE", s:crust, "NONE", "NONE", "NONE")
call s:hi("Folded", "NONE", s:blue, s:surface1, "NONE", "NONE")
call s:hi("FoldColumn", "NONE", s:overlay0, s:base, "NONE", "NONE")
call s:hi("SignColumn", "NONE", s:surface1, s:base, "NONE", "NONE")
call s:hi("IncSearch", "NONE", s:surface1, s:pink, "NONE", "NONE")
call s:hi("CursorLineNR", "NONE", s:lavender, "NONE", "NONE", "NONE")
call s:hi("LineNr", "NONE", s:surface1, "NONE", "NONE", "NONE")
call s:hi("MatchParen", "NONE", s:peach, "NONE", "bold", "bold")
call s:hi("ModeMsg", "NONE", s:text, "NONE", "bold", "bold")
call s:hi("MoreMsg", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("NonText", "NONE", s:overlay0, "NONE", "NONE", "NONE")
call s:hi("Pmenu", "NONE", s:overlay2, s:surface0, "NONE", "NONE")
call s:hi("PmenuSel", "NONE", s:text, s:surface1, "bold", "bold")
call s:hi("PmenuSbar", "NONE", "NONE", s:surface1, "NONE", "NONE")
call s:hi("PmenuThumb", "NONE", "NONE", s:overlay0, "NONE", "NONE")
call s:hi("Question", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("QuickFixLine", "NONE", "NONE", s:surface1, "bold", "bold")
call s:hi("Search", "NONE", s:pink, s:surface1, "bold", "bold")
call s:hi("SpecialKey", "NONE", s:subtext0, "NONE", "NONE", "NONE")
call s:hi("SpellBad", s:red, "NONE", "NONE", "underline", "underline")
call s:hi("SpellCap", s:yellow, "NONE", "NONE", "underline", "underline")
call s:hi("SpellLocal", s:blue, "NONE", "NONE", "underline", "underline")
call s:hi("SpellRare", s:green, "NONE", "NONE", "underline", "underline")
call s:hi("StatusLine", "NONE", s:text, s:mantle, "NONE", "NONE")
call s:hi("StatusLineNC", "NONE", s:surface1, s:mantle, "NONE", "NONE")
call s:hi("TabLine", "NONE", s:surface1, s:mantle, "NONE", "NONE")
call s:hi("TabLineFill", "NONE", "NONE", s:mantle, "NONE", "NONE")
call s:hi("TabLineSel", "NONE", s:green, s:surface1, "NONE", "NONE")
call s:hi("Title", "NONE", s:blue, "NONE", "bold", "bold")
call s:hi("VisualNOS", "NONE", "NONE", s:surface1, "bold", "bold")
call s:hi("WarningMsg", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("WildMenu", "NONE", "NONE", s:overlay0, "NONE", "NONE")
call s:hi("Comment", "NONE", s:surface2, "NONE", "NONE", "NONE")
call s:hi("Constant", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Identifier", "NONE", s:flamingo, "NONE", "NONE", "NONE")
call s:hi("Statement", "NONE", s:mauve, "NONE", "NONE", "NONE")
call s:hi("PreProc", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Type", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Special", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Underlined", "NONE", s:text, s:base, "underline", "underline")
call s:hi("Error", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Todo", "NONE", s:base, s:yellow, "bold", "bold")

call s:hi("String", "NONE", s:green, "NONE", "NONE", "NONE")
call s:hi("Character", "NONE", s:teal, "NONE", "NONE", "NONE")
call s:hi("Number", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Boolean", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Float", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Function", "NONE", s:blue, "NONE", "NONE", "NONE")
call s:hi("Conditional", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Repeat", "NONE", s:red, "NONE", "NONE", "NONE")
call s:hi("Label", "NONE", s:peach, "NONE", "NONE", "NONE")
call s:hi("Operator", "NONE", s:sky, "NONE", "NONE", "NONE")
call s:hi("Keyword", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("Include", "NONE", s:pink, "NONE", "NONE", "NONE")
call s:hi("StorageClass", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Structure", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("Typedef", "NONE", s:yellow, "NONE", "NONE", "NONE")
call s:hi("debugPC", "NONE", "NONE", s:crust, "NONE", "NONE")
call s:hi("debugBreakpoint", "NONE", s:overlay0, s:base, "NONE", "NONE")

hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc
hi link SpecialChar Special
hi link Tag Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug Special
hi link Exception Error
hi link StatusLineTerm StatusLine
hi link StatusLineTermNC StatusLineNC
hi link Terminal Normal
hi link Ignore Comment

" Set terminal colors for playing well with plugins like fzf
let g:terminal_ansi_colors = [
  \ s:surface1, s:red, s:green, s:yellow, s:blue, s:pink, s:teal, s:subtext1,
  \ s:surface2, s:red, s:green, s:yellow, s:blue, s:pink, s:teal, s:subtext0
\ ]

" ===transparent background===
hi Normal guibg=NONE ctermbg=NONE

" ===Status line===
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

" ===Vim-Commentor===
" AUTHOR: Manas Thakur (manasthakur17@gmail.com)
" VERSION: 1.1
" LICENSE: MIT
"
function! CommentToggle(type, ...)
  " Get the list of comment-markers
  let cmt_markers = split(substitute(substitute(&commentstring, '\S\zs%s', ' %s', ''), '%s\ze\S', '%s ', ''), '%s', 1)

  " Get space-trimmed LHS and RHS comment-markers
  let lhs_cmt_marker = escape(substitute(cmt_markers[0], ' ', '', ''), '*')
  let rhs_cmt_marker = escape(substitute(cmt_markers[1], ' ', '', ''), '*')

  " Check if the first line is commented
  if match(getline('.'), lhs_cmt_marker) == 0
    " Yes ==> uncomment
    if a:0
      " Visual mode
      silent execute "normal! :'<,'>s]^" . lhs_cmt_marker . "]\<CR>`<"
      silent execute "normal! :'<,'>s]" . rhs_cmt_marker . "$]]\<CR>`<"
    else
      " Normal mode
      silent execute "normal! :'[,']s]^" . lhs_cmt_marker . "]\<CR>`["
      silent execute "normal! :'[,']s]" . rhs_cmt_marker . "$]]\<CR>`["
    endif
  else
    " No ==> comment
    if a:0
      " Visual mode
      silent execute "normal! :'<,'>s]^]" . lhs_cmt_marker . "\<CR>`<"
      silent execute "normal! :'<,'>s]$]" . rhs_cmt_marker . "\<CR>`<"
    else
      " Normal mode
      silent execute "normal! :'[,']s]^]" . lhs_cmt_marker . "\<CR>`["
      silent execute "normal! :'[,']s]$]" . rhs_cmt_marker . "\<CR>`["
    endif
  endif
endfunction

nnoremap <silent> <Plug>Commentor :<C-u>set opfunc=CommentToggle<CR>g@
xnoremap <silent> <Plug>Commentor :<C-u>call CommentToggle(visualmode(), 1)<CR>
nnoremap <silent> <Plug>CommentorLine :<C-u>set opfunc=CommentToggle<bar>execute "normal! " . v:count1 . "g@_"<CR>

" Default mappings
if !hasmapto('<Plug>Commentor')
"  nmap <LEADER>/ <Plug>Commentor
  xmap <LEADER>/ <Plug>Commentor
endif
if !hasmapto('<Plug>CommentorLine')
  nmap <LEADER>/ <Plug>CommentorLine
endif

" ===filetree sidebar===
if !exists('g:native_sidebar_shortcut') | let g:native_sidebar_shortcut = '<LEADER>e' | en

exe 'nnoremap <silent> ' g:native_sidebar_shortcut ' :Lexplore %:p:h<cr>'
exe 'vnoremap <silent> ' g:native_sidebar_shortcut ' :Lexplore %:p:h<cr>'
"exe 'inoremap <silent> ' g:native_sidebar_shortcut ' <esc>:Lexplore %:p:h<cr>'

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
  nmap <buffer> <c-l> <c-w>l
endfunction

let g:netrw_altv=1
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=0
let g:netrw_browse_split=0
let g:netrw_list_hide='.*\.git/$,'.netrw_gitignore#Hide()

" ===surround.vim - Surroundings===
" Author:       Tim Pope <http://tpo.pe/>
" Version:      2.2
" GetLatestVimScripts: 1697 1 :AutoInstall: surround.vim

if exists("g:loaded_surround") || &cp || v:version < 700
  finish
endif
let g:loaded_surround = 1

" Input functions {{{1

function! s:getchar()
  let c = getchar()
  if c =~ '^\d\+$'
    let c = nr2char(c)
  endif
  return c
endfunction

function! s:inputtarget()
  let c = s:getchar()
  while c =~ '^\d\+$'
    let c .= s:getchar()
  endwhile
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>\|\<C-C>\|\0"
    return ""
  else
    return c
  endif
endfunction

function! s:inputreplacement()
  let c = s:getchar()
  if c == " "
    let c .= s:getchar()
  endif
  if c =~ "\<Esc>" || c =~ "\<C-C>"
    return ""
  else
    return c
  endif
endfunction

function! s:beep()
  exe "norm! \<Esc>"
  return ""
endfunction

function! s:redraw()
  redraw
  return ""
endfunction

" }}}1

" Wrapping functions {{{1

function! s:extractbefore(str)
  if a:str =~ '\r'
    return matchstr(a:str,'.*\ze\r')
  else
    return matchstr(a:str,'.*\ze\n')
  endif
endfunction

function! s:extractafter(str)
  if a:str =~ '\r'
    return matchstr(a:str,'\r\zs.*')
  else
    return matchstr(a:str,'\n\zs.*')
  endif
endfunction

function! s:fixindent(str,spc)
  let str = substitute(a:str,'\t',repeat(' ',&sw),'g')
  let spc = substitute(a:spc,'\t',repeat(' ',&sw),'g')
  let str = substitute(str,'\(\n\|\%^\).\@=','\1'.spc,'g')
  if ! &et
    let str = substitute(str,'\s\{'.&ts.'\}',"\t",'g')
  endif
  return str
endfunction

function! s:process(string)
  let i = 0
  for i in range(7)
    let repl_{i} = ''
    let m = matchstr(a:string,nr2char(i).'.\{-\}\ze'.nr2char(i))
    if m != ''
      let m = substitute(strpart(m,1),'\r.*','','')
      let repl_{i} = input(match(m,'\w\+$') >= 0 ? m.': ' : m)
    endif
  endfor
  let s = ""
  let i = 0
  while i < strlen(a:string)
    let char = strpart(a:string,i,1)
    if char2nr(char) < 8
      let next = stridx(a:string,char,i+1)
      if next == -1
        let s .= char
      else
        let insertion = repl_{char2nr(char)}
        let subs = strpart(a:string,i+1,next-i-1)
        let subs = matchstr(subs,'\r.*')
        while subs =~ '^\r.*\r'
          let sub = matchstr(subs,"^\r\\zs[^\r]*\r[^\r]*")
          let subs = strpart(subs,strlen(sub)+1)
          let r = stridx(sub,"\r")
          let insertion = substitute(insertion,strpart(sub,0,r),strpart(sub,r+1),'')
        endwhile
        let s .= insertion
        let i = next
      endif
    else
      let s .= char
    endif
    let i += 1
  endwhile
  return s
endfunction

function! s:wrap(string,char,type,removed,special)
  let keeper = a:string
  let newchar = a:char
  let s:input = ""
  let type = a:type
  let linemode = type ==# 'V' ? 1 : 0
  let before = ""
  let after  = ""
  if type ==# "V"
    let initspaces = matchstr(keeper,'\%^\s*')
  else
    let initspaces = matchstr(getline('.'),'\%^\s*')
  endif
  let pairs = "b()B{}r[]a<>"
  let extraspace = ""
  if newchar =~ '^ '
    let newchar = strpart(newchar,1)
    let extraspace = ' '
  endif
  let idx = stridx(pairs,newchar)
  if newchar == ' '
    let before = ''
    let after  = ''
  elseif exists("b:surround_".char2nr(newchar))
    let all    = s:process(b:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif exists("g:surround_".char2nr(newchar))
    let all    = s:process(g:surround_{char2nr(newchar)})
    let before = s:extractbefore(all)
    let after  =  s:extractafter(all)
  elseif newchar ==# "p"
    let before = "\n"
    let after  = "\n\n"
  elseif newchar ==# 's'
    let before = ' '
    let after  = ''
  elseif newchar ==# ':'
    let before = ':'
    let after = ''
  elseif newchar =~# "[tT\<C-T><]"
    let dounmapp = 0
    let dounmapb = 0
    if !maparg(">","c")
      let dounmapb = 1
      " Hide from AsNeeded
      exe "cn"."oremap > ><CR>"
    endif
    let default = ""
    if newchar ==# "T"
      if !exists("s:lastdel")
        let s:lastdel = ""
      endif
      let default = matchstr(s:lastdel,'<\zs.\{-\}\ze>')
    endif
    let tag = input("<",default)
    if dounmapb
      silent! cunmap >
    endif
    let s:input = tag
    if tag != ""
      let keepAttributes = ( match(tag, ">$") == -1 )
      let tag = substitute(tag,'>*$','','')
      let attributes = ""
      if keepAttributes
        let attributes = matchstr(a:removed, '<[^ \t\n]\+\zs\_.\{-\}\ze>')
      endif
      let s:input = tag . '>'
      if tag =~ '/$'
        let tag = substitute(tag, '/$', '', '')
        let before = '<'.tag.attributes.' />'
        let after = ''
      else
        let before = '<'.tag.attributes.'>'
        let after  = '</'.substitute(tag,' .*','','').'>'
      endif
      if newchar == "\<C-T>"
        if type ==# "v" || type ==# "V"
          let before .= "\n\t"
        endif
        if type ==# "v"
          let after  = "\n". after
        endif
      endif
    endif
  elseif newchar ==# 'l' || newchar == '\'
    " LaTeX
    let env = input('\begin{')
    if env != ""
      let s:input = env."\<CR>"
      let env = '{' . env
      let env .= s:closematch(env)
      echo '\begin'.env
      let before = '\begin'.env
      let after  = '\end'.matchstr(env,'[^}]*').'}'
    endif
  elseif newchar ==# 'f' || newchar ==# 'F'
    let fnc = input('function: ')
    if fnc != ""
      let s:input = fnc."\<CR>"
      let before = substitute(fnc,'($','','').'('
      let after  = ')'
      if newchar ==# 'F'
        let before .= ' '
        let after = ' ' . after
      endif
    endif
  elseif newchar ==# "\<C-F>"
    let fnc = input('function: ')
    let s:input = fnc."\<CR>"
    let before = '('.fnc.' '
    let after = ')'
  elseif idx >= 0
    let spc = (idx % 3) == 1 ? " " : ""
    let idx = idx / 3 * 3
    let before = strpart(pairs,idx+1,1) . spc
    let after  = spc . strpart(pairs,idx+2,1)
  elseif newchar == "\<C-[>" || newchar == "\<C-]>"
    let before = "{\n\t"
    let after  = "\n}"
  elseif newchar !~ '\a'
    let before = newchar
    let after  = newchar
  else
    let before = ''
    let after  = ''
  endif
  let after  = substitute(after ,'\n','\n'.initspaces,'g')
  if type ==# 'V' || (a:special && type ==# "v")
    let before = substitute(before,' \+$','','')
    let after  = substitute(after ,'^ \+','','')
    if after !~ '^\n'
      let after  = initspaces.after
    endif
    if keeper !~ '\n$' && after !~ '^\n'
      let keeper .= "\n"
    elseif keeper =~ '\n$' && after =~ '^\n'
      let after = strpart(after,1)
    endif
    if keeper !~ '^\n' && before !~ '\n\s*$'
      let before .= "\n"
      if a:special
        let before .= "\t"
      endif
    elseif keeper =~ '^\n' && before =~ '\n\s*$'
      let keeper = strcharpart(keeper,1)
    endif
    if type ==# 'V' && keeper =~ '\n\s*\n$'
      let keeper = strcharpart(keeper,0,strchars(keeper) - 1)
    endif
  endif
  if type ==# 'V'
    let before = initspaces.before
  endif
  if before =~ '\n\s*\%$'
    if type ==# 'v'
      let keeper = initspaces.keeper
    endif
    let padding = matchstr(before,'\n\zs\s\+\%$')
    let before  = substitute(before,'\n\s\+\%$','\n','')
    let keeper = s:fixindent(keeper,padding)
  endif
  if type ==# 'V'
    let keeper = before.keeper.after
  elseif type =~ "^\<C-V>"
    " Really we should be iterating over the buffer
    let repl = substitute(before,'[\\~]','\\&','g').'\1'.substitute(after,'[\\~]','\\&','g')
    let repl = substitute(repl,'\n',' ','g')
    let keeper = substitute(keeper."\n",'\(.\{-\}\)\(\n\)',repl.'\n','g')
    let keeper = substitute(keeper,'\n\%$','','')
  else
    let keeper = before.extraspace.keeper.extraspace.after
  endif
  return keeper
endfunction

function! s:wrapreg(reg,char,removed,special)
  let orig = getreg(a:reg)
  let type = substitute(getregtype(a:reg),'\d\+$','','')
  let new = s:wrap(orig,a:char,type,a:removed,a:special)
  call setreg(a:reg,new,type)
endfunction
" }}}1

function! s:insert(...) " {{{1
  " Optional argument causes the result to appear on 3 lines, not 1
  let linemode = a:0 ? a:1 : 0
  let char = s:inputreplacement()
  while char == "\<CR>" || char == "\<C-S>"
    " TODO: use total count for additional blank lines
    let linemode += 1
    let char = s:inputreplacement()
  endwhile
  if char == ""
    return ""
  endif
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let reg_save = @@
  call setreg('"',"\032",'v')
  call s:wrapreg('"',char,"",linemode)
  " If line mode is used and the surrounding consists solely of a suffix,
  " remove the initial newline.  This fits a use case of mine but is a
  " little inconsistent.  Is there anyone that would prefer the simpler
  " behavior of just inserting the newline?
  if linemode && match(getreg('"'),'^\n\s*\zs.*') == 0
    call setreg('"',matchstr(getreg('"'),'^\n\s*\zs.*'),getregtype('"'))
  endif
  " This can be used to append a placeholder to the end
  if exists("g:surround_insert_tail")
    call setreg('"',g:surround_insert_tail,"a".getregtype('"'))
  endif
  if &ve != 'all' && col('.') >= col('$')
    if &ve == 'insert'
      let extra_cols = virtcol('.') - virtcol('$')
      if extra_cols > 0
        let [regval,regtype] = [getreg('"',1,1),getregtype('"')]
        call setreg('"',join(map(range(extra_cols),'" "'),''),'v')
        norm! ""p
        call setreg('"',regval,regtype)
      endif
    endif
    norm! ""p
  else
    norm! ""P
  endif
  if linemode
    call s:reindent()
  endif
  norm! `]
  call search("\032",'bW')
  let @@ = reg_save
  let &clipboard = cb_save
  return "\<Del>"
endfunction " }}}1

function! s:reindent() abort " {{{1
  if get(b:, 'surround_indent', get(g:, 'surround_indent', 1)) && (!empty(&equalprg) || !empty(&indentexpr) || &cindent || &smartindent || &lisp)
    silent norm! '[=']
  endif
endfunction " }}}1

function! s:dosurround(...) " {{{1
  let sol_save = &startofline
  set startofline
  let scount = v:count1
  let char = (a:0 ? a:1 : s:inputtarget())
  let spc = ""
  if char =~ '^\d\+'
    let scount = scount * matchstr(char,'^\d\+')
    let char = substitute(char,'^\d\+','','')
  endif
  if char =~ '^ '
    let char = strpart(char,1)
    let spc = 1
  endif
  if char == 'a'
    let char = '>'
  endif
  if char == 'r'
    let char = ']'
  endif
  let newchar = ""
  if a:0 > 1
    let newchar = a:2
    if newchar == "\<Esc>" || newchar == "\<C-C>" || newchar == ""
      if !sol_save
        set nostartofline
      endif
      return s:beep()
    endif
  endif
  let cb_save = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let append = ""
  let original = getreg('"')
  let otype = getregtype('"')
  call setreg('"',"")
  let strcount = (scount == 1 ? "" : scount)
  if char == '/'
    exe 'norm! '.strcount.'[/d'.strcount.']/'
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>"''`]'
    exe 'norm! T'.char
    if getline('.')[col('.')-1] == char
      exe 'norm! l'
    endif
    exe 'norm! dt'.char
  else
    exe 'norm! d'.strcount.'i'.char
  endif
  let keeper = getreg('"')
  let okeeper = keeper " for reindent below
  if keeper == ""
    call setreg('"',original,otype)
    let &clipboard = cb_save
    if !sol_save
      set nostartofline
    endif
    return ""
  endif
  let oldline = getline('.')
  let oldlnum = line('.')
  if char ==# "p"
    call setreg('"','','V')
  elseif char ==# "s" || char ==# "w" || char ==# "W"
    " Do nothing
    call setreg('"','')
  elseif char =~ "[\"'`]"
    exe "norm! i \<Esc>d2i".char
    call setreg('"',substitute(getreg('"'),' ','',''))
  elseif char == '/'
    norm! "_x
    call setreg('"','/**/',"c")
    let keeper = substitute(substitute(keeper,'^/\*\s\=','',''),'\s\=\*$','','')
  elseif char =~# '[[:punct:][:space:]]' && char !~# '[][(){}<>]'
    exe 'norm! F'.char
    exe 'norm! df'.char
  else
    " One character backwards
    call search('\m.', 'bW')
    exe "norm! da".char
  endif
  let removed = getreg('"')
  let rem2 = substitute(removed,'\n.*','','')
  let oldhead = strpart(oldline,0,strlen(oldline)-strlen(rem2))
  let oldtail = strpart(oldline,  strlen(oldline)-strlen(rem2))
  let regtype = getregtype('"')
  if char =~# '[\[({<T]' || spc
    let keeper = substitute(keeper,'^\s\+','','')
    let keeper = substitute(keeper,'\s\+$','','')
  endif
  if col("']") == col("$") && virtcol('.') + 1 == virtcol('$')
    if oldhead =~# '^\s*$' && a:0 < 2
      let keeper = substitute(keeper,'\%^\n'.oldhead.'\(\s*.\{-\}\)\n\s*\%$','\1','')
    endif
    let pcmd = "p"
  else
    let pcmd = "P"
  endif
  if line('.') + 1 < oldlnum && regtype ==# "V"
    let pcmd = "p"
  endif
  call setreg('"',keeper,regtype)
  if newchar != ""
    let special = a:0 > 2 ? a:3 : 0
    call s:wrapreg('"',newchar,removed,special)
  endif
  silent exe 'norm! ""'.pcmd.'`['
  if removed =~ '\n' || okeeper =~ '\n' || getreg('"') =~ '\n'
    call s:reindent()
  endif
  if getline('.') =~ '^\s\+$' && keeper =~ '^\s*\n'
    silent norm! cc
  endif
  call setreg('"',original,otype)
  let s:lastdel = removed
  let &clipboard = cb_save
  if newchar == ""
    silent! call repeat#set("\<Plug>Dsurround".char,scount)
  else
    silent! call repeat#set("\<Plug>C".(a:0 > 2 && a:3 ? "S" : "s")."urround".char.newchar.s:input,scount)
  endif
  if !sol_save
    set nostartofline
  endif
endfunction " }}}1

function! s:changesurround(...) " {{{1
  let a = s:inputtarget()
  if a == ""
    return s:beep()
  endif
  let b = s:inputreplacement()
  if b == ""
    return s:beep()
  endif
  call s:dosurround(a,b,a:0 && a:1)
endfunction " }}}1

function! s:opfunc(type, ...) abort " {{{1
  if a:type ==# 'setup'
    let &opfunc = matchstr(expand('<sfile>'), '<SNR>\w\+$')
    return 'g@'
  endif
  let char = s:inputreplacement()
  if char == ""
    return s:beep()
  endif
  let reg = '"'
  let sel_save = &selection
  let &selection = "inclusive"
  let cb_save  = &clipboard
  set clipboard-=unnamed clipboard-=unnamedplus
  let reg_save = getreg(reg)
  let reg_type = getregtype(reg)
  let type = a:type
  if a:type == "char"
    silent exe 'norm! v`[o`]"'.reg.'y'
    let type = 'v'
  elseif a:type == "line"
    silent exe 'norm! `[V`]"'.reg.'y'
    let type = 'V'
  elseif a:type ==# "v" || a:type ==# "V" || a:type ==# "\<C-V>"
    let &selection = sel_save
    let ve = &virtualedit
    if !(a:0 && a:1)
      set virtualedit=
    endif
    silent exe 'norm! gv"'.reg.'y'
    let &virtualedit = ve
  elseif a:type =~ '^\d\+$'
    let type = 'v'
    silent exe 'norm! ^v'.a:type.'$h"'.reg.'y'
    if mode() ==# 'v'
      norm! v
      return s:beep()
    endif
  else
    let &selection = sel_save
    let &clipboard = cb_save
    return s:beep()
  endif
  let keeper = getreg(reg)
  if type ==# "v" && a:type !=# "v"
    let append = matchstr(keeper,'\_s\@<!\s*$')
    let keeper = substitute(keeper,'\_s\@<!\s*$','','')
  endif
  call setreg(reg,keeper,type)
  call s:wrapreg(reg,char,"",a:0 && a:1)
  if type ==# "v" && a:type !=# "v" && append != ""
    call setreg(reg,append,"ac")
  endif
  silent exe 'norm! gv'.(reg == '"' ? '' : '"' . reg).'p`['
  if type ==# 'V' || (getreg(reg) =~ '\n' && type ==# 'v')
    call s:reindent()
  endif
  call setreg(reg,reg_save,reg_type)
  let &selection = sel_save
  let &clipboard = cb_save
  if a:type =~ '^\d\+$'
    silent! call repeat#set("\<Plug>Y".(a:0 && a:1 ? "S" : "s")."surround".char.s:input,a:type)
  else
    silent! call repeat#set("\<Plug>SurroundRepeat".char.s:input)
  endif
endfunction

function! s:opfunc2(...) abort
  if !a:0 || a:1 ==# 'setup'
    let &opfunc = matchstr(expand('<sfile>'), '<SNR>\w\+$')
    return 'g@'
  endif
  call s:opfunc(a:1, 1)
endfunction " }}}1

function! s:closematch(str) " {{{1
  " Close an open (, {, [, or < on the command line.
  let tail = matchstr(a:str,'.[^\[\](){}<>]*$')
  if tail =~ '^\[.\+'
    return "]"
  elseif tail =~ '^(.\+'
    return ")"
  elseif tail =~ '^{.\+'
    return "}"
  elseif tail =~ '^<.+'
    return ">"
  else
    return ""
  endif
endfunction " }}}1

nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <Plug>Dsurround  :<C-U>call <SID>dosurround(<SID>inputtarget())<CR>
nnoremap <silent> <Plug>Csurround  :<C-U>call <SID>changesurround()<CR>
nnoremap <silent> <Plug>CSurround  :<C-U>call <SID>changesurround(1)<CR>
nnoremap <expr>   <Plug>Yssurround '^'.v:count1.<SID>opfunc('setup').'g_'
nnoremap <expr>   <Plug>YSsurround <SID>opfunc2('setup').'_'
nnoremap <expr>   <Plug>Ysurround  <SID>opfunc('setup')
nnoremap <expr>   <Plug>YSurround  <SID>opfunc2('setup')
vnoremap <silent> <Plug>VSurround  :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 1 : 0)<CR>
vnoremap <silent> <Plug>VgSurround :<C-U>call <SID>opfunc(visualmode(),visualmode() ==# 'V' ? 0 : 1)<CR>
inoremap <silent> <Plug>Isurround  <C-R>=<SID>insert()<CR>
inoremap <silent> <Plug>ISurround  <C-R>=<SID>insert(1)<CR>

if !exists("g:surround_no_mappings") || ! g:surround_no_mappings
  nmap ds  <Plug>Dsurround
  nmap cs  <Plug>Csurround
  nmap cS  <Plug>CSurround
  nmap ys  <Plug>Ysurround
  nmap yS  <Plug>YSurround
  nmap yss <Plug>Yssurround
  nmap ySs <Plug>YSsurround
  nmap ySS <Plug>YSsurround
  xmap S   <Plug>VSurround
  xmap gS  <Plug>VgSurround
  if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
    if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
      imap    <C-S> <Plug>Isurround
    endif
    imap      <C-G>s <Plug>Isurround
    imap      <C-G>S <Plug>ISurround
  endif
endif

" ===wildfire===

let s:triggers = []

fu! All()
    return s:triggers
endfu

fu! Add(trigger, objects)
    let s:triggers = add(s:triggers, a:trigger)
    let objects = substitute(string(a:objects), "|", '\\|', "g")
    exe "nnoremap <silent>" a:trigger ":<C-U>call Start(v:count1, ". objects .")<CR>"
    exe "onoremap <silent>" a:trigger ":<C-U>call Start(v:count1, ". objects .")<CR>"
    exe "vnoremap <silent>" a:trigger ":<C-U>call Fuel(v:count1)<CR>"
endfu

fu! AddQs(trigger, objects)
    let s:triggers = add(s:triggers, a:trigger)
    let objects = substitute(string(a:objects), "|", '\\|', "g")
    exe "nnoremap <silent>" a:trigger ":<C-U>call QuickSelect(". objects .")<CR>"
    exe "onoremap <silent>" a:trigger ":<C-U>call QuickSelect(". objects .")<CR>"
endfu

" =============================================================================
" File: wildfire.vim
" Description: Smart selection of the closest text object
" Mantainer: Giacomo Comitti (https://github.com/gcmt)
" Url: https://github.com/gcmt/wildfire.vim
" License: MIT
" =============================================================================


let s:save_cpo = &cpo
set cpo&vim


" Internal variables
" =============================================================================

let s:cannot_be_nested = {"iw" : 1, "aw" : 1, "iW" : 1, "aW": 1}

let s:vim_text_objects = {}
for s:char in split("(){}[]<>'`\"bBwWpst", "\\zs")
    let s:vim_text_objects = extend(s:vim_text_objects, {"a".s:char : 1, "i".s:char : 1})
endfor

let s:counts = {}
let s:history = []
let s:origin = []


" Functions
" =============================================================================

fu! Start(repeat, objects)
    cal s:init(a:objects)
    cal Fuel(a:repeat)
endfu

fu! Fuel(repeat)
    for i in range(a:repeat)
        cal s:select_text_object()
    endfor
endfu

fu! Water(repeat)
    for i in range(a:repeat)
        cal setpos(".", s:origin)
        if len(s:history) > 1
            let s:counts[remove(s:history, -1).selection.object] -= 1
            cal winrestview(get(s:history, -1).view)
            cal s:select(get(s:history, -1).selection)
        endif
    endfor
endfu

fu! s:init(objects)
    let s:origin = getpos(".")
    let s:history = []
    let s:counts = {}
    let _objects = s:load_objects(a:objects)
    for object in get(_objects, &ft, get(_objects, "*", []))
        let s:counts[object] = 1
    endfor
endfu

fu! s:load_objects(objects)
    " force `a:objects` to be a dictionary
    let _objects = type(a:objects) == type([]) ? {"*": a:objects} : a:objects
    " split filetypes that share the same text objects
    for [ftypes, objs] in items(_objects)
        for ft in split(ftypes, ",")
            let _objects[ft] = objs
        endfor
    endfor
    return _objects
endfu

fu! s:select_text_object()

    cal setpos(".", s:origin)

    let view = winsaveview()

    let candidates = {}
    for object in keys(s:counts)

        let selection = {"object": object, "count": s:counts[object]}

        let [startline, startcol, endline, endcol] = s:edges(selection)
        let selection = extend(selection,
            \ {"startline": startline, "startcol": startcol, "endline": endline, "endcol": endcol })

        cal winrestview(view)

        " Some text object cannot be nested. This avoids unwanted behavior.
        if get(s:cannot_be_nested, selection.object) && selection.count > 1
            continue
        endif

        " The selection failed with the candidate text object
        if selection.startline == selection.endline && selection.startcol == selection.endcol
            continue
        endif

        " Sometimes Vim selects text objects even if the cursor is outside the
        " them (e.g. `it`, `i"`, etc). We don't want this.
        if selection.startline == selection.endline
            if s:origin[2] < selection.startcol - 1 || s:origin[2] > selection.endcol + 1
                let s:counts[object] += 1
                continue
            endif
        endif

        " Check if the cursor is even within selection. If not, we obviously
        " don't want that
        if s:origin[1] < selection.startline || s:origin[1] > selection.endline
            let s:counts[object] += 1
            continue
        endif

        let size = s:size(selection)

        " This happens when the _count is incremented but the selection remains still
        let _selection = extend(copy(selection), {"count": selection.count-1})
        if s:already_selected(_selection)
            continue
        endif

        " Special case
        if object =~ "a\"\\|i\"\\|a'\\|i'" && startline == endline
            let _selection = extend(copy(selection),
                \ {"count": selection.count-1, "startcol": selection.startcol+1, "endcol": selection.endcol-1})
            if s:already_selected(_selection)
                " When there is no more string to select on the same line, vim
                " selects the outer string text object. This is far from the
                " desired behavior
                continue
            endif
            let _selection = extend(copy(selection),
                \ {"count": selection.count-1, "startcol": selection.startcol+1})
            if s:already_selected(_selection)
                " This follows the previous check. When the string ends the
                " line, the size of the text object is just one character less
                continue
            endif
            let line = getline("'<")
            let quote = strpart(object, 1)
            let [before, after] = [line[:selection.startcol-3], line[selection.endcol+1:]]
            if s:odd_quotes(quote, before) || s:odd_quotes(quote, after)
                continue
            endif
        endif

        let candidates[size] = selection

    endfor

    cal s:select_best_candidate(candidates)

endfu

" To select the closest text object among the candidates
fu! s:select_best_candidate(candidates)
    if len(a:candidates)
        " select the closest text object (the one with the smaller size)
        " skip same size text-objects
        let lastsize = 0
        if len(s:history)
            let lastsize = s:size(get(s:history, -1).selection)
        endif
        let m = -1
        for ss in keys(a:candidates)
            let s = str2nr(ss)
            if s > lastsize && (m == -1 || s < m)
                let m = s
            endif
        endfor
        if m > -1
            let selection = a:candidates[m]
            let s:history = add(s:history, {"selection": selection, "view": winsaveview()})
            let s:counts[selection.object] += 1
            cal s:select(selection)
        else
            cal s:select_best_candidate_fallback()
        endif
    else
        cal s:select_best_candidate_fallback()
    endif
endfu

" Select best candidate fallback
fu! s:select_best_candidate_fallback()
    if len(s:history)
        " get stuck on the last selection
        cal s:select(get(s:history, -1).selection)
    else
        " do nothing
        exec "sil! norm! \<ESC>"
    endif
endfu

" To retrun the edges of a text object
fu! s:edges(selection)
    cal s:select(a:selection)
    exe "sil! norm! \<ESC>"
    return [line("'<"), col("'<"), line("'>"), col("'>")]
endfu

" To select a text object
fu! s:select(selection)
    exe "sil! norm! \<ESC>v\<ESC>v"
    if get(s:vim_text_objects, a:selection.object)
        " use counts when selecting vim text objects
        exe "sil! norm! " . a:selection.count . a:selection.object
    else
        " counts might not be suported by non-default text objects
        for n in range(a:selection.count)
            exe "sil! norm " . a:selection.object
        endfor
    endif
endfu

" To check if a text object has been already selected
fu! s:already_selected(selection)
    for s in s:history
        if s.selection == a:selection
            return 1
        end
    endfor
    return 0
endfu

" To return the size of a text object
fu! s:size(selection)
    if a:selection.startline == a:selection.endline
        return a:selection.endcol - a:selection.startcol + 1
    endif
    let size = len(getline(a:selection.startline)) - a:selection.startcol + a:selection.endcol + 1
    let size += winwidth(0) * (a:selection.endline - a:selection.startline - 1)
    return size
endfu

" To check if in a strings there is an odd number of quotes
fu! s:odd_quotes(quote, s)
    let n = 0
    for i in range(0, strlen(a:s))
        if a:s[i] == a:quote && !(i > 0 && a:s[i-1] == "\\")
            let n += 1
        endif
    endfor
    return n % 2 != 0
endfu

" Quick Select
" =============================================================================

fu! QuickSelect(objects)
    cal s:init(a:objects)
    while 1
        let last_hist_size = len(s:history)
        cal s:select_text_object()
        if empty(s:history)
            return
        end
        let selection = get(s:history, -1).selection
        if selection.startline < line("w0") || selection.endline > line("w$")
            cal Water(1)
            break
        end
        if last_hist_size == len(s:history)
            break
        end
    endw
    exe "norm! \<ESC>"
    cal setpos(".", s:origin)
    let save_hl = s:turn_off_syntax_errs()
    let marks = s:show_marks(map(copy(s:history), "v:val.selection"))
    cal s:jump(marks)
    cal s:turn_on_syntax_errs(save_hl)
endfu

" To display marks
fu s:show_marks(selections)
    try | undojoin | catch | endtry
    cal matchadd("WildfireShade", '\%>'.(line('w0')-1).'l\%<'.line('w$').'l')
    let marks = split(g:wildfire_marks, '\zs')
    let placed_marks = {}
    let candidates = {}
    for selection in a:selections
        if empty(marks) | break | end
        if !has_key(placed_marks, selection.startline . "," . selection.startcol)
            let [mline, mcol] = [selection.startline, selection.startcol]
        elseif !has_key(placed_marks, selection.endline . "," . selection.endcol)
            let [mline, mcol] = [selection.endline, selection.endcol]
        else
            continue
        end
        let placed_marks[mline.",".mcol] = 1
        let mark = remove(marks, 0)
        let candidates[mark] = [
            \ selection,
            \ {"line": mline, "col": mcol, "char": mark, "oldchar": getline(mline)[mcol-1]}
        \ ]
        cal setline(mline, s:str_subst(getline(mline), mcol-1, mark))
        cal matchadd("WildfireMark", '\%'.mline.'l\%'.mcol.'c')
    endfor
    setl nomodified
    return candidates
endfu

" To ask the user where to jump and move there
fu s:jump(marks)
    if empty(a:marks) | return | end
    normal! m'
    while 1
        redraw
        cal s:show_prompt()
        let choice = s:get_char()
        if choice =~ '<C-C>\|<ESC>'
            cal s:clear_marks(a:marks)
            break
        end
        if has_key(a:marks, choice)
            cal s:clear_marks(a:marks)
            cal s:select(a:marks[choice][0])
            let s:history = s:history[:stridx(g:wildfire_marks, choice)]
            break
        end
    endw
endfu

" To display the prompt
fu s:show_prompt()
    echohl WildfirePrompt | echon g:wildfire_prompt | echohl None
endfu


" To clear all marks
fu s:clear_marks(marks)
    cal s:clear_matches("WildfireMark", "WildfireShade")
    try | undojoin | catch | endtry
    for [s, mark] in values(a:marks)
        cal setline(mark.line, s:str_subst(getline(mark.line), mark.col-1, mark.oldchar))
    endfor
    setl nomodified
endfu

" To turn off syntax errors. The returned value can be used to restore syntax
" errors with s:turn_on_syntax_err()
fu s:turn_off_syntax_errs()
    let colors = s:colors_of("Error")
    hi Error None
    return colors
endfu

" To turn on syntax errors
fu s:turn_on_syntax_errs(colors)
    cal s:set_colors("Error", a:colors)
endfu

" Utilities
" =============================================================================

" To get the colors of given highlight group.
fu s:colors_of(group)
    redir => raw_hl
        exe "hi" a:group
    redir END
    let raw_hl = substitute(raw_hl, "\n", " ", "")
    if match(raw_hl, 'cleared') >= 0
        return {"colors": "None", "link": ""}
    end
    if match(raw_hl, "links to") >= 0
        return {"colors": "", "link": matchstr(raw_hl, '\v(links to )@<=.*')}
    end
    return {"colors": matchstr(raw_hl, '\v( xxx )@<=.*'), "link": ""}
endfu

" To set the colors for a given highlight group. Note that this function should
" be used exclusively with colors retrieved with the function s:color_of(..)
fu s:set_colors(group, colors)
    if !empty(a:colors.link)
        exe "hi link" a:group a:colors.link
    else
        exe "hi" a:group a:colors.colors
    end
endfu

" To clear matches of given groups
fu s:clear_matches(...)
    for m in getmatches()
        if index(a:000, m.group) != -1
            cal matchdelete(m.id)
        end
    endfor
endfu

" To substitute a character in a string
fu s:str_subst(str, col, char)
    return strpart(a:str, 0, a:col) . a:char . strpart(a:str, a:col+1)
endfu

" To get a key pressed by the user
fu s:get_char()
    let char = strtrans(getchar())
        if char == 13 | return "<CR>"
    elseif char == 27 | return "<ESC>"
    elseif char == 9 | return "<TAB>"
    elseif char >= 1 && char <= 26 | return "<C-" . nr2char(char+64) . ">"
    elseif char != 0 | return nr2char(char)
    elseif match(char, '<fc>^D') > 0 | return "<C-SPACE>"
    elseif match(char, 'kb') > 0 | return "<BS>"
    elseif match(char, 'ku') > 0 | return "<UP>"
    elseif match(char, 'kd') > 0 | return "<DOWN>"
    elseif match(char, 'kl') > 0 | return "<LEFT>"
    elseif match(char, 'kr') > 0 | return "<RIGHT>"
    elseif match(char, 'k\\d\\+') > 0 | return "<F" . match(char, '\\d\\+', 4) . ">"
    end
endfu

" =============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo
" =============================================================================
" File: wildfire.vim
" Description: Smart selection of the closest text object
" Mantainer: Giacomo Comitti (https://github.com/gcmt)
" Url: https://github.com/gcmt/wildfire.vim
" License: MIT
" =============================================================================

" Init
" =============================================================================

if exists("g:loaded_wildfire")
    finish
endif
let g:loaded_wildfire = 1

let s:save_cpo = &cpo
set cpo&vim

" Colors
" =============================================================================

fu! s:setup_colors()
    hi default link WildfireMark WarningMsg
    hi default link WildfirePrompt String
    hi default link WildfireShade Comment
endfu

cal s:setup_colors()

" Settings
" =============================================================================

let g:wildfire_objects =
    \ get(g:, "wildfire_objects", split("ip i) i] i} i' i\" it"))

let g:wildfire_fuel_map =
    \ get(g:, "wildfire_fuel_map", "<ENTER>")

let g:wildfire_water_map =
    \ get(g:, "wildfire_water_map", "<BS>")

let g:wildfire_prompt =
    \ get(g:, "wildfire_prompt", " Target: ")

let g:wildfire_marks =
    \ get(g:, "wildfire_marks", "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

" Mappings
" =============================================================================

vnoremap <silent> <Plug>(wildfire-water) :<C-U>call Water(v:count1)<CR>

cal Add("<Plug>(wildfire-fuel)", g:wildfire_objects)
cal AddQs("<Plug>(wildfire-quick-select)", g:wildfire_objects)

if !hasmapto('<Plug>(wildfire-fuel)')
    if index(All(), g:wildfire_fuel_map) == -1
        exe "map" g:wildfire_fuel_map "<Plug>(wildfire-fuel)"
    end
end
if !hasmapto('<Plug>(wildfire-water)')
    exe "vmap" g:wildfire_water_map "<Plug>(wildfire-water)"
end

" Autocommands
" =============================================================================

fu! s:disable_wildfire()
    sil! exec "nnoremap <buffer> " . g:wildfire_fuel_map . " " . g:wildfire_fuel_map
endfu

augroup wildfire
    au!
    " Disable Wildfire inside buffers with the `buftype` option set (See :h 'buftype')
    au BufReadPost * if !empty(&bt) | call s:disable_wildfire() | endif
    " Disable Wildfire inside the command-line window
    au CmdWinEnter * call s:disable_wildfire()
    " Disable Wildfire inside quickfix buffers
    au FileType qf call s:disable_wildfire()
    " Setup colors
    au BufWritePost .vimrc call s:setup_colors()
    au Colorscheme * call s:setup_colors()
augroup END

" =============================================================================

let &cpo = s:save_cpo
unlet s:save_cpo

" ===Natural autocomplete===
set completeopt=menuone,longest
inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "<C-p>" : "<S-TAB>"
"=============================================================================
" Copyright (c) 2007-2009 Takeshi NISHIDA
"
"=============================================================================
" LOAD GUARD {{{1

if exists('g:loaded_autoload_acp') || v:version < 702
  finish
endif
let g:loaded_autoload_acp = 1

" }}}1
"=============================================================================
" GLOBAL FUNCTIONS: {{{1

"
function Acpenable()
  call Acpdisable()

  augroup AcpGlobalAutoCommand
    autocmd!
    autocmd InsertEnter * unlet! s:posLast s:lastUncompletable
    autocmd InsertLeave * call s:finishPopup(1)
  augroup END

  if g:acp_mappingDriven
    call s:mapForMappingDriven()
  else
    autocmd AcpGlobalAutoCommand CursorMovedI * call s:feedPopup()
  endif

  nnoremap <silent> i i<C-r>=<SID>feedPopup()<CR>
  nnoremap <silent> a a<C-r>=<SID>feedPopup()<CR>
  nnoremap <silent> R R<C-r>=<SID>feedPopup()<CR>
endfunction

"
function Acpdisable()
  call s:unmapForMappingDriven()
  augroup AcpGlobalAutoCommand
    autocmd!
  augroup END
  nnoremap i <Nop> | nunmap i
  nnoremap a <Nop> | nunmap a
  nnoremap R <Nop> | nunmap R
endfunction

"
function Acplock()
  let s:lockCount += 1
endfunction

"
function Acpunlock()
  let s:lockCount -= 1
  if s:lockCount < 0
    let s:lockCount = 0
    throw "AutoComplPop: not locked"
  endif
endfunction

"
function AcpmeetsForSnipmate(context)
  if g:acp_behaviorSnipmateLength < 0
    return 0
  endif
  let matches = matchlist(a:context, '\(^\|\s\|\<\)\(\u\{' .
        \                            g:acp_behaviorSnipmateLength . ',}\)$')
  return !empty(matches) && !empty(s:getMatchingSnipItems(matches[2]))
endfunction

"
function AcpmeetsForKeyword(context)
  if g:acp_behaviorKeywordLength < 0
    return 0
  endif
  let matches = matchlist(a:context, '\(\k\{' . g:acp_behaviorKeywordLength . ',}\)$')
  if empty(matches)
    return 0
  endif
  for ignore in g:acp_behaviorKeywordIgnores
    if stridx(ignore, matches[1]) == 0
      return 0
    endif
  endfor
  return 1
endfunction

"
function AcpmeetsForFile(context)
  if g:acp_behaviorFileLength < 0
    return 0
  endif
  if has('win32') || has('win64')
    let separator = '[/\\]'
  else
    let separator = '\/'
  endif
  if a:context !~ '\f' . separator . '\f\{' . g:acp_behaviorFileLength . ',}$'
    return 0
  endif
  return a:context !~ '[*/\\][/\\]\f*$\|[^[:print:]]\f*$'
endfunction

"
function AcpmeetsForRubyOmni(context)
  if !has('ruby')
    return 0
  endif
  if g:acp_behaviorRubyOmniMethodLength >= 0 &&
        \ a:context =~ '[^. \t]\(\.\|::\)\k\{' .
        \              g:acp_behaviorRubyOmniMethodLength . ',}$'
    return 1
  endif
  if g:acp_behaviorRubyOmniSymbolLength >= 0 &&
        \ a:context =~ '\(^\|[^:]\):\k\{' .
        \              g:acp_behaviorRubyOmniSymbolLength . ',}$'
    return 1
  endif
  return 0
endfunction

"
function AcpmeetsForPythonOmni(context)
  return has('python') && g:acp_behaviorPythonOmniLength >= 0 &&
        \ a:context =~ '\k\.\k\{' . g:acp_behaviorPythonOmniLength . ',}$'
endfunction

"
function AcpmeetsForPerlOmni(context)
  return g:acp_behaviorPerlOmniLength >= 0 &&
        \ a:context =~ '\w->\k\{' . g:acp_behaviorPerlOmniLength . ',}$'
endfunction

"
function AcpmeetsForXmlOmni(context)
  return g:acp_behaviorXmlOmniLength >= 0 &&
        \ a:context =~ '\(<\|<\/\|<[^>]\+ \|<[^>]\+=\"\)\k\{' .
        \              g:acp_behaviorXmlOmniLength . ',}$'
endfunction

"
function AcpmeetsForHtmlOmni(context)
  return g:acp_behaviorHtmlOmniLength >= 0 &&
        \ a:context =~ '\(<\|<\/\|<[^>]\+ \|<[^>]\+=\"\)\k\{' .
        \              g:acp_behaviorHtmlOmniLength . ',}$'
endfunction

"
function AcpmeetsForCssOmni(context)
  if g:acp_behaviorCssOmniPropertyLength >= 0 &&
        \ a:context =~ '\(^\s\|[;{]\)\s*\k\{' .
        \              g:acp_behaviorCssOmniPropertyLength . ',}$'
    return 1
  endif
  if g:acp_behaviorCssOmniValueLength >= 0 &&
        \ a:context =~ '[:@!]\s*\k\{' .
        \              g:acp_behaviorCssOmniValueLength . ',}$'
    return 1
  endif
  return 0
endfunction

"
function AcpcompleteSnipmate(findstart, base)
  if a:findstart
    let s:posSnipmateCompletion = len(matchstr(s:getCurrentText(), '.*\U'))
    return s:posSnipmateCompletion
  endif
  let lenBase = len(a:base)
  let items = filter(GetSnipsInCurrentScope(),
        \            'strpart(v:key, 0, lenBase) ==? a:base')
  return map(sort(items(items)), 's:makeSnipmateItem(v:val[0], v:val[1])')
endfunction

"
function AcponPopupCloseSnipmate()
  let word = s:getCurrentText()[s:posSnipmateCompletion :]
  for trigger in keys(GetSnipsInCurrentScope())
    if word ==# trigger
      call feedkeys("\<C-r>=TriggerSnippet()\<CR>", "n")
      return 0
    endif
  endfor
  return 1
endfunction

"
function AcponPopupPost()
  " to clear <C-r>= expression on command-line
  echo ''
  if pumvisible()
    inoremap <silent> <expr> <C-h> AcponBs()
    inoremap <silent> <expr> <BS>  AcponBs()
    " a command to restore to original text and select the first match
    return (s:behavsCurrent[s:iBehavs].command =~# "\<C-p>" ? "\<C-n>\<Up>"
          \                                                 : "\<C-p>\<Down>")
  endif
  let s:iBehavs += 1
  if len(s:behavsCurrent) > s:iBehavs 
    call s:setCompletefunc()
    return printf("\<C-e>%s\<C-r>=AcponPopupPost()\<CR>",
          \       s:behavsCurrent[s:iBehavs].command)
  else
    let s:lastUncompletable = {
          \   'word': s:getCurrentWord(),
          \   'commands': map(copy(s:behavsCurrent), 'v:val.command')[1:],
          \ }
    call s:finishPopup(0)
    return "\<C-e>"
  endif
endfunction

"
function AcponBs()
  " using "matchstr" and not "strpart" in order to handle multi-byte
  " characters
  if call(s:behavsCurrent[s:iBehavs].meets,
        \ [matchstr(s:getCurrentText(), '.*\ze.')])
    return "\<BS>"
  endif
  return "\<C-e>\<BS>"
endfunction

" }}}1
"=============================================================================
" LOCAL FUNCTIONS: {{{1

"
function s:mapForMappingDriven()
  call s:unmapForMappingDriven()
  let s:keysMappingDriven = [
        \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
        \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        \ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
        \ '-', '_', '~', '^', '.', ',', ':', '!', '#', '=', '%', '$', '@', '<', '>', '/', '\',
        \ '<Space>', '<C-h>', '<BS>', ]
  for key in s:keysMappingDriven
    execute printf('inoremap <silent> %s %s<C-r>=<SID>feedPopup()<CR>',
          \        key, key)
  endfor
endfunction

"
function s:unmapForMappingDriven()
  if !exists('s:keysMappingDriven')
    return
  endif
  for key in s:keysMappingDriven
    execute 'iunmap ' . key
  endfor
  let s:keysMappingDriven = []
endfunction

"
function s:setTempOption(group, name, value)
  call extend(s:tempOptionSet[a:group], { a:name : eval('&' . a:name) }, 'keep')
  execute printf('let &%s = a:value', a:name)
endfunction

"
function s:restoreTempOptions(group)
  for [name, value] in items(s:tempOptionSet[a:group])
    execute printf('let &%s = value', name)
  endfor
  let s:tempOptionSet[a:group] = {}
endfunction

"
function s:getCurrentWord()
  return matchstr(s:getCurrentText(), '\k*$')
endfunction

"
function s:getCurrentText()
  return strpart(getline('.'), 0, col('.') - 1)
endfunction

"
function s:getPostText()
  return strpart(getline('.'), col('.') - 1)
endfunction

"
function s:isModifiedSinceLastCall()
  if exists('s:posLast')
    let posPrev = s:posLast
    let nLinesPrev = s:nLinesLast
    let textPrev = s:textLast
  endif
  let s:posLast = getpos('.')
  let s:nLinesLast = line('$')
  let s:textLast = getline('.')
  if !exists('posPrev')
    return 1
  elseif posPrev[1] != s:posLast[1] || nLinesPrev != s:nLinesLast
    return (posPrev[1] - s:posLast[1] == nLinesPrev - s:nLinesLast)
  elseif textPrev ==# s:textLast
    return 0
  elseif posPrev[2] > s:posLast[2]
    return 1
  elseif has('gui_running') && has('multi_byte')
    " NOTE: auto-popup causes a strange behavior when IME/XIM is working
    return posPrev[2] + 1 == s:posLast[2]
  endif
  return posPrev[2] != s:posLast[2]
endfunction

"
function s:makeCurrentBehaviorSet()
  let modified = s:isModifiedSinceLastCall()
  if exists('s:behavsCurrent[s:iBehavs].repeat') && s:behavsCurrent[s:iBehavs].repeat
    let behavs = [ s:behavsCurrent[s:iBehavs] ]
  elseif exists('s:behavsCurrent[s:iBehavs]')
    return []
  elseif modified
    let behavs = copy(exists('g:acp_behavior[&filetype]')
          \           ? g:acp_behavior[&filetype]
          \           : g:acp_behavior['*'])
  else
    return []
  endif
  let text = s:getCurrentText()
  call filter(behavs, 'call(v:val.meets, [text])')
  let s:iBehavs = 0
  if exists('s:lastUncompletable') &&
        \ stridx(s:getCurrentWord(), s:lastUncompletable.word) == 0 &&
        \ map(copy(behavs), 'v:val.command') ==# s:lastUncompletable.commands
    let behavs = []
  else
    unlet! s:lastUncompletable
  endif
  return behavs
endfunction

"
function s:feedPopup()
  " NOTE: CursorMovedI is not triggered while the popup menu is visible. And
  "       it will be triggered when popup menu is disappeared.
  if s:lockCount > 0 || pumvisible() || &paste
    return ''
  endif
  if exists('s:behavsCurrent[s:iBehavs].onPopupClose')
    if !call(s:behavsCurrent[s:iBehavs].onPopupClose, [])
      call s:finishPopup(1)
      return ''
    endif
  endif
  let s:behavsCurrent = s:makeCurrentBehaviorSet()
  if empty(s:behavsCurrent)
    call s:finishPopup(1)
    return ''
  endif
  " In case of dividing words by symbols (e.g. "for(int", "ab==cd") while a
  " popup menu is visible, another popup is not available unless input <C-e>
  " or try popup once. So first completion is duplicated.
  call insert(s:behavsCurrent, s:behavsCurrent[s:iBehavs])
  call s:setTempOption(s:GROUP0, 'spell', 0)
  call s:setTempOption(s:GROUP0, 'completeopt', 'menuone' . (g:acp_completeoptPreview ? ',preview' : ''))
  call s:setTempOption(s:GROUP0, 'complete', g:acp_completeOption)
  call s:setTempOption(s:GROUP0, 'ignorecase', g:acp_ignorecaseOption)
  " NOTE: With CursorMovedI driven, Set 'lazyredraw' to avoid flickering.
  "       With Mapping driven, set 'nolazyredraw' to make a popup menu visible.
  call s:setTempOption(s:GROUP0, 'lazyredraw', !g:acp_mappingDriven)
  " NOTE: 'textwidth' must be restored after <C-e>.
  call s:setTempOption(s:GROUP1, 'textwidth', 0)
  call s:setCompletefunc()
  call feedkeys(s:behavsCurrent[s:iBehavs].command . "\<C-r>=AcponPopupPost()\<CR>", 'n')
  return '' " this function is called by <C-r>=
endfunction

"
function s:finishPopup(fGroup1)
  inoremap <C-h> <Nop> | iunmap <C-h>
  inoremap <BS>  <Nop> | iunmap <BS>
  let s:behavsCurrent = []
  call s:restoreTempOptions(s:GROUP0)
  if a:fGroup1
    call s:restoreTempOptions(s:GROUP1)
  endif
endfunction

"
function s:setCompletefunc()
  if exists('s:behavsCurrent[s:iBehavs].completefunc')
    call s:setTempOption(0, 'completefunc', s:behavsCurrent[s:iBehavs].completefunc)
  endif
endfunction

"
function s:makeSnipmateItem(key, snip)
  if type(a:snip) == type([])
    let descriptions = map(copy(a:snip), 'v:val[0]')
    let snipFormatted = '[MULTI] ' . join(descriptions, ', ')
  else
    let snipFormatted = substitute(a:snip, '\(\n\|\s\)\+', ' ', 'g')
  endif
  return  {
        \   'word': a:key,
        \   'menu': strpart(snipFormatted, 0, 80),
        \ }
endfunction

"
function s:getMatchingSnipItems(base)
  let key = a:base . "\n"
  if !exists('s:snipItems[key]')
    let s:snipItems[key] = items(GetSnipsInCurrentScope())
    call filter(s:snipItems[key], 'strpart(v:val[0], 0, len(a:base)) ==? a:base')
    call map(s:snipItems[key], 's:makeSnipmateItem(v:val[0], v:val[1])')
  endif
  return s:snipItems[key]
endfunction

" }}}1
"=============================================================================
" INITIALIZATION {{{1

let s:GROUP0 = 0
let s:GROUP1 = 1
let s:lockCount = 0
let s:behavsCurrent = []
let s:iBehavs = 0
let s:tempOptionSet = [{}, {}]
let s:snipItems = {}

" }}}1
"=============================================================================
" vim: set fdm=marker:

"=============================================================================
" Copyright (c) 2007-2009 Takeshi NISHIDA
"
" GetLatestVimScripts: 1879 1 :AutoInstall: AutoComplPop
"=============================================================================
" LOAD GUARD {{{1

if exists('g:loaded_acp')
  finish
elseif v:version < 702
  echoerr 'AutoComplPop does not support this version of vim (' . v:version . ').'
  finish
endif
let g:loaded_acp = 1

" }}}1
"=============================================================================
" FUNCTION: {{{1

"
function s:defineOption(name, default)
  if !exists(a:name)
    let {a:name} = a:default
  endif
endfunction

"
function s:makeDefaultBehavior()
  let behavs = {
        \   '*'      : [],
        \   'ruby'   : [],
        \   'python' : [],
        \   'perl'   : [],
        \   'xml'    : [],
        \   'html'   : [],
        \   'xhtml'  : [],
        \   'css'    : [],
        \ }
  "---------------------------------------------------------------------------
  if !empty(g:acp_behaviorUserDefinedFunction) &&
        \ !empty(g:acp_behaviorUserDefinedMeets)
    for key in keys(behavs)
      call add(behavs[key], {
            \   'command'      : "\<C-x>\<C-u>",
            \   'completefunc' : g:acp_behaviorUserDefinedFunction,
            \   'meets'        : g:acp_behaviorUserDefinedMeets,
            \   'repeat'       : 0,
            \ })
    endfor
  endif
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command'      : "\<C-x>\<C-u>",
          \   'completefunc' : 'AcpcompleteSnipmate',
          \   'meets'        : 'AcpmeetsForSnipmate',
          \   'onPopupClose' : 'AcponPopupCloseSnipmate',
          \   'repeat'       : 0,
          \ })
  endfor
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command' : g:acp_behaviorKeywordCommand,
          \   'meets'   : 'AcpmeetsForKeyword',
          \   'repeat'  : 0,
          \ })
  endfor
  "---------------------------------------------------------------------------
  for key in keys(behavs)
    call add(behavs[key], {
          \   'command' : "\<C-x>\<C-f>",
          \   'meets'   : 'AcpmeetsForFile',
          \   'repeat'  : 1,
          \ })
  endfor
  "---------------------------------------------------------------------------
  call add(behavs.ruby, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForRubyOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.python, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForPythonOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.perl, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForPerlOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.xml, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForXmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.html, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForHtmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.xhtml, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForHtmlOmni',
        \   'repeat'  : 1,
        \ })
  "---------------------------------------------------------------------------
  call add(behavs.css, {
        \   'command' : "\<C-x>\<C-o>",
        \   'meets'   : 'AcpmeetsForCssOmni',
        \   'repeat'  : 0,
        \ })
  "---------------------------------------------------------------------------
  return behavs
endfunction

" }}}1
"=============================================================================
" INITIALIZATION {{{1

"-----------------------------------------------------------------------------
call s:defineOption('g:acp_enableAtStartup', 1)
call s:defineOption('g:acp_mappingDriven', 0)
call s:defineOption('g:acp_ignorecaseOption', 1)
call s:defineOption('g:acp_completeOption', '.,w,b,k')
call s:defineOption('g:acp_completeoptPreview', 0)
call s:defineOption('g:acp_behaviorUserDefinedFunction', '')
call s:defineOption('g:acp_behaviorUserDefinedMeets', '')
call s:defineOption('g:acp_behaviorSnipmateLength', -1)
call s:defineOption('g:acp_behaviorKeywordCommand', "\<C-n>")
call s:defineOption('g:acp_behaviorKeywordLength', 2)
call s:defineOption('g:acp_behaviorKeywordIgnores', [])
call s:defineOption('g:acp_behaviorFileLength', 0)
call s:defineOption('g:acp_behaviorRubyOmniMethodLength', 0)
call s:defineOption('g:acp_behaviorRubyOmniSymbolLength', 1)
call s:defineOption('g:acp_behaviorPythonOmniLength', 0)
call s:defineOption('g:acp_behaviorPerlOmniLength', -1)
call s:defineOption('g:acp_behaviorXmlOmniLength', 0)
call s:defineOption('g:acp_behaviorHtmlOmniLength', 0)
call s:defineOption('g:acp_behaviorCssOmniPropertyLength', 1)
call s:defineOption('g:acp_behaviorCssOmniValueLength', 0)
call s:defineOption('g:acp_behavior', {})
"-----------------------------------------------------------------------------
call extend(g:acp_behavior, s:makeDefaultBehavior(), 'keep')
"-----------------------------------------------------------------------------
command! -bar -narg=0 AcpEnable  call Acpenable()
command! -bar -narg=0 AcpDisable call Acpdisable()
command! -bar -narg=0 AcpLock    call Acplock()
command! -bar -narg=0 AcpUnlock  call Acpunlock()
"-----------------------------------------------------------------------------
" legacy commands
command! -bar -narg=0 AutoComplPopEnable  AcpEnable
command! -bar -narg=0 AutoComplPopDisable AcpDisable
command! -bar -narg=0 AutoComplPopLock    AcpLock
command! -bar -narg=0 AutoComplPopUnlock  AcpUnlock
"-----------------------------------------------------------------------------
if g:acp_enableAtStartup
  AcpEnable
endif
"-----------------------------------------------------------------------------
" }}}1
"=============================================================================
" vim: set fdm=marker:

