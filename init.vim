" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @HCHogan
" ==================== Auto load for first time uses ====================
" if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	" silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				" "\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" 
" let g:nvim_plugins_installation_completed=1
" if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
	" let g:nvim_plugins_installation_completed=0
	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" 
"  Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location 
" let has_machine_specific_file = 1
" if empty(glob('~/.config/nvim/_machine_specific.vim'))
	" let has_machine_specific_file = 0
	" silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
" endif
" source $HOME/.config/nvim/_machine_specific.vim

" ===================== Editor Behavior ===========================
set encoding=utf-8
let mapleader=" "
syntax on
set number
set wrap
set showcmd
set wildmenu
set relativenumber
set hlsearch

exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set cursorline

noremap J 5j
noremap K 5k
noremap H 5h
noremap L 5l

map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC
map s <nop>

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map ss <C-w>w
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

noremap = nzz
noremap - Nzz

nmap <silent> gD :tab sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

nmap tt :CocCommand explorer<CR>
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region

set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

call plug#begin('/home/hank/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

call plug#end()
"  coc.nvim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! Fixtab() abort
    call coc#pum#next(1)
    call coc#pum#prev(1)
endfunction

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"  =========
let g:coc_global_extensions = ['coc-json',
    \ 'coc-vimlsp',
    \ 'coc-marketplace',
    \ 'coc-python',
    \ 'coc-actions',
    \ 'coc-git',
    \ 'coc-pairs',
    \ 'coc-lists',
    \ 'coc-sourcekit',
    \ 'coc-java',
    \ 'coc-go',
    \ 'coc-clangd',
    \ 'coc-gitignore',
    \ 'coc-yaml',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-translator',
    \ 'coc-css',
    \ 'coc-prettier',
    \ 'coc-explorer']

set updatetime=300
"set signcolumn=yes
set hidden
inoremap <silent><expr> <c-j> coc#refresh()
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <LEADER>rn <Plug>(coc-rename)
nnoremap <silent> <LEADER>h :call <SID>show_documentation()<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
"  =========

color snazzy
let g:lightline = {'colorscheme': 'snazzy', }
let g:SnazzyTransparent = 1

if exists("g:neovide")

let g:neovide_cursor_vfx_mode = "pixiedust"
set guifont =JetBrains\ Mono:h12
endif

" complierun_on_oneclick
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'racket'
		set splitbelow
		:sp
		:res -5
		term racket %
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc
