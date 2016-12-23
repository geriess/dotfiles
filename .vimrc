" ==================== SETTINGS ====================
" ==================================================

" Indent automatically depending on filetype
filetype indent on
set autoindent

" Turn on line numbering. Turn it off with "set nonu" 
set number

" Set syntax on
syntax on

" Case insensitive search
set ic

" Higlhight search
set hls

" Wrap text instead of being on one line
set lbr

" Change colorscheme from default to delek
colorscheme delek


" Windows 
if has("win32")
 set guifont=Consolas:h12:cANSI 
endif

" set nocompatible
" filetype on
filetype plugin indent on

" ==================== vim-go ====================

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
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
" colorscheme molokai
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_decls_includes = "func,type"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" =================== vim-json ====================

" let g:vim_json_syntax_conceal = 0
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2

" ==================== MAPPINGS ====================

" exit insert mode
inoremap jj <esc>

" gocode autocompletion
inoremap <C-@> <C-x><C-o>

" tab session save and restore
map <F2> :mksession! ~/vim_session<CR>
map <F3> :source ~/vim_session<CR>

" reload vimrc 
nnoremap <F5> :source $MYVIMRC<CR>

" switch tab left and right
nnoremap <F7> :tabprevious<CR>
nnoremap <F8> :tabnext<CR>

" ==================== PLUGINS ====================

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'tag': 'v1.10' }
Plug 'fatih/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()
