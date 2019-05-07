set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-abolish'
Plugin 'kurkale6ka/vim-swap'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'takac/vim-hardtime'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/nerdtree'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
Plugin 'ap/vim-css-color'
Plugin 'udalov/kotlin-vim'
Plugin 'artur-shaik/vim-javacomplete2'

" completer
Plugin 'Valloric/YouCompleteMe'
"Plugin 'lifepillar/vim-mucomplete'
"Plugin 'ajh17/VimCompletesMe'
"Plugin 'Shougo/deoplete.nvim'  " TODO: try

"Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()            " required


filetype plugin on
syntax on

try
	colorscheme my_pablo
catch /^Vim\%((\a\+)\)\=:E185/
	echo v:exception
	echo "Falling back to colorscheme pablo"
	colorscheme pablo
endtry

set shiftwidth=4
set smartindent number showmode ruler cursorline autochdir
set nohlsearch noincsearch
set foldmethod=syntax foldminlines=4 foldlevelstart=99
set mouse=a
set scrolloff=3
set diffopt+=,vertical
set laststatus=2
set list listchars=tab:▸\ ,trail:·
set linebreak breakindent showbreak=\ \  " nice wrapping
set colorcolumn=0
set tabstop=4

let mapleader = ' '

nnoremap <leader>ve :tabedit $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>
inoremap <C-a>c <ESC>:%y+<CR>a

noremap <Backspace> 
noremap <Down> 
noremap <UP> 

noremap <Return> :cc<CR>
noremap <Right> :cnext<CR>
noremap <Left> :cprev<CR>

noremap <F3> :set hlsearch!<CR>
noremap <F4> :IndentLinesToggle<CR>
noremap <F5> :set list!<CR>
":IndentGuidesToggle<CR>

noremap <F8> :TlistToggle<CR>
noremap <F9> :make<CR>

"nnoremap <leader>baro :echo "Enter key:"<CR>"zyy"zpVr
"nnoremap <leader>barO :echo "Enter key:"<CR>"zyy"zPVr

augroup vimrc
    autocmd!
    "autocmd BufEnter * silent! lcd %:h  " look for 'autochdir'
    autocmd FileType c,cpp,python,sh,haskell,cmake,tex,java,html,kotlin,lua setlocal expandtab colorcolumn=80
    autocmd FileType c,cpp,python,sh,tex,haskell,java,html,kotlin,lua
    \ autocmd BufWritePre,FileWritePre <buffer> call RStrip()
augroup END

" Deoplete
"let g:python_host_prog = "/usr/bin/python2"
"let g:python3_host_prog = "/usr/bin/python3"
"let g:deoplete#enable_at_startup = 1

" Surround
let g:surround_indent = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_filetype_whitelist = { 'cpp':1, 'c':1, 'python':1, 'lua':1, 'java':1, 'kotlin':1, 'sh':1 }
let g:ycm_filetype_blacklist = { 'tex':1, 'text':1, 'markdown':1 }
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader><leader> :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>

" Mucomplete
"let g:mucomplete#enable_auto_at_startup = 0

" Syntastic
let g:syntastic_error_symbol = '✽'
let g:syntastic_warning_symbol = '❥'
let g:syntastic_python_pylint_args = '--disable=missing-docstring,invalid-name,too-few-public-methods,multiple-statements'
let g:syntastic_cpp_checkers = [ 'cpplint' ]
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*


" indentLine
let g:indentLine_color_term = 'darkcyan'
let g:indentLine_char = '┊'  "│┆┊
let g:indentLine_enabled = 0


" Hardtime
"let g:hardtime_default_on = 1
"let g:hardtime_allow_different_key = 0
"let g:hardtime_maxcount = 1
"let g:hardtime_timeout = 5000  " default 1000
"let g:hardtime_showmsg = 0  " default 0
"let g:list_of_normal_keys = [ "h", "j", "k", "l" ]
"let g:list_of_visual_keys = [ "h", "j", "k", "l" ]
"let g:list_of_insert_keys = [  ]
"let g:list_of_disabled_keys = [ "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>" ]


"" Remove trailing whitespaces
function! RStrip()
    let cursor_pos = getpos('.')
    silent %s/\s\+$//e
    call setpos('.', cursor_pos)
endfunction

