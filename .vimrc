" ==================== PLUGINS ====================

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
" Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fatih/vim-go', { 'tag': 'v1.10' }
Plug 'fatih/molokai', { 'do': ':GoInstallBinaries' }
Plug 'itchyny/lightline.vim'
" Plug 'pangloss/vim-javascript'
Plug 't9md/vim-choosewin'
" Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-fugitive'
" Plug 'vim-syntastic/syntastic'

call plug#end()

" ==================== MAPPINGS ====================

" map leader key
let mapleader = ","

" quickfix see next/previous
map <C-n> :cn<CR>  
map <C-m> :cp<CR> 

" quickfix close
nnoremap <leader>a :cclose<CR>

" Close all but current window 
nnoremap <leader>o :only<CR>

" Close current screen 
nnoremap <leader>x :clo<CR>

" save and exit
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q<CR>
" nnoremap <silent> <leader>q :q!<CR>

" exit insert mode
inoremap jj <esc>

" reload and edit vimrc 
nnoremap <F5> :source $MYVIMRC<CR>
nnoremap <leader><F5> :edit $MYVIMRC<CR>

" switch tab left and right
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>

" Toggle highlight from searches
nnoremap <leader>/ :set hlsearch!<CR>

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Center the screen
nnoremap <space> zz 

" Center search on screen
nnoremap n nzzzv
nnoremap N Nzzzv

" ==================== SETTINGS ====================

filetype plugin indent on 
set autoindent

set nocompatible

" Auto-reload files changed outside vim
set autoread 

" A better backspace
set backspace=indent,eol,start

" Case-insensitive searching
set ignorecase

" Case-sensitive search if upper case letter
set smartcase

" Turn on line numbering. Turn it off with "set nonu" 
set number

" Show match while typing
set incsearch

" Highlight found searches
set hlsearch

" Enable mouse
set mouse=a 

" Set syntax on
syntax on

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Default 
set encoding=utf-8

" Change colorscheme from default to delek
" colorscheme delek

" Save Vim info on exit
set viminfo='200

" Windows
if has("win32")
 set guifont=Consolas:h15:cANSI 
endif

" print path
map <C-f> :echo expand("%:p")<cr>

" ==================== CtrlP =====================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}
let g:ctrlp_working_path_mode = 'ra'

nmap <C-b> :CtrlPCurWD<cr>
imap <C-b> <esc>:CtrlPCurWD<cr>

" ==================== vim-go ====================

" show go declarations
nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" gocode autocompletion
inoremap <C-@> <C-x><C-o>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)
autocmd FileType go nmap <silent> <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" =================== vim-json ====================

" let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

" ==================== choosewin ==================

let g:choosewin_overlay_enable = 1
nmap  -  <Plug>(choosewin)

" ==================== lightline ==================

" show status bar
set laststatus=2

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'],
	\             [ 'fugitive', 'filename', 'modified', 'ctrlpmark', 'go'] ],
	\   'right': [ [ 'lineinfo' ], 
	\              [ 'percent' ], 
	\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
	\ },
	\ 'component': {
	\   'go': '%#goStatuslineColor#%{LightLineGo()}',
	\ },
	\ 'component_visible_condition': {
	\ 'go': '(exists("*go#statusline#Show") && ""!=go#statusline#Show())'
	\ },
	\ 'component_function': {
	\   'lineinfo': 'LightLineInfo',
	\   'percent': 'LightLinePercent',
	\   'modified': 'LightLineModified',
	\   'filename': 'LightLineFilename',
	\   'fileformat': 'LightLineFileformat',
	\   'filetype': 'LightLineFiletype',
	\   'fileencoding': 'LightLineFileencoding',
	\   'mode': 'LightLineMode',
	\   'fugitive': 'LightLineFugitive',
	\   'ctrlpmark': 'CtrlPMark',
	\ },
	\ }

function! LightLineModified()
if &filetype == "help"
	return ""
elseif &modified
	return "+"
elseif &modifiable
	return ""
else
	return ""
endif
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
	return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
	return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
	return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

function! LightLineMode()
	let fname = expand('%:t')
	return fname == 'ControlP' ? 'CtrlP' :
				\ &ft == 'vimfiler' ? 'VimFiler' :
				\ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
	let fname = expand('%:t')
	if mode() == 't'
		return ''
	endif

	return fname == 'ControlP' ? g:lightline.ctrlp_item :
				\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
				\ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
				\ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
	return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
	if expand('%:t') =~ 'ControlP'
		call lightline#link('iR'[g:lightline.ctrlp_regex])
		return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
					\ , g:lightline.ctrlp_next], 0)
	else
		return ''
	endif
endfunction

let g:ctrlp_status_func = {
			\ 'main': 'CtrlPStatusFunc_1',
			\ 'prog': 'CtrlPStatusFunc_2',
			\ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
	let g:lightline.ctrlp_regex = a:regex
	let g:lightline.ctrlp_prev = a:prev
	let g:lightline.ctrlp_item = a:item
	let g:lightline.ctrlp_next = a:next
	return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
	return lightline#statusline(0)
endfunction
