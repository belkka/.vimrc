set nocompatible              " be iMproved, required
filetype off                  " required

let g:python3_host_prog = '/usr/bin/python3'

set runtimepath+=/usr/share/vifm/vim/

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'  " cr coercion
"Plugin 'kurkale6ka/vim-swap'
"Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-characterize'  " ga
Plugin 'tpope/vim-repeat'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'takac/vim-hardtime'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'Yggdroot/indentLine'
Plugin 'https://github.com/airblade/vim-gitgutter'
Plugin 'https://github.com/romainl/vim-dichromatic'  " colorcheme dichromatic
Plugin 'https://github.com/romainl/vim-cool'  " :nohl
Plugin 'https://github.com/ervandew/supertab'

" Languages
Plugin 'bfrg/vim-cpp-modern'
Plugin 'cespare/vim-toml'
Plugin 'chaimleib/vim-renpy'
Plugin 'hjson/vim-hjson'
Plugin 'kovetskiy/sxhkd-vim'
Plugin 'https://github.com/tpope/vim-jdaddy'  "ij aj gqaj gwaj
Plugin 'https://github.com/mtdl9/vim-log-highlighting'
"Plugin 'ap/vim-css-color'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'mrk21/yaml-vim'
"Plugin 'udalov/kotlin-vim'

" completer
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'lifepillar/vim-mucomplete'
"Plugin 'ajh17/VimCompletesMe'
"Plugin 'Shougo/deoplete.nvim'  " TODO: try

"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'mgedmin/python-imports.vim'
Plugin 'davidhalter/jedi-vim'

call vundle#end()            " required


filetype plugin on
syntax on

for s:cs in ["murphy", "dichromatic", "my_pablo", "pablo"]
    try
        execute "colorscheme " .. s:cs
        echo "Using colorscheme " .. s:cs
        break
    catch /^Vim\%((\a\+)\)\=:E185/
        echo v:exception
    endtry
endfor
unlet s:cs

set shiftwidth=4
set autoindent number showmode ruler cursorline
"set autochdir
set noincsearch
set foldmethod=syntax foldminlines=4 foldlevelstart=99
set mouse=a clipboard=unnamedplus
set scrolloff=3
set diffopt+=,vertical
set laststatus=2
set list listchars=tab:▸\ ,trail:·
set linebreak breakindent showbreak=\ \  " nice wrapping
set colorcolumn=0
set tabstop=4
set signcolumn=yes
set updatetime=400

" Fix weird built-in python indent |ft-python-indent|
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '0'
let g:pyindent_continue = '0'

noremap <Del> :quit<CR>
noremap <Backspace> 
noremap <C-j> <C-d>
noremap <C-k> <C-u>
noremap <Down> 3
noremap <Up> 3
noremap <Right> :tabnext<CR>
noremap <Left> :tabprev<CR>
noremap <F4> :set list!<CR>
inoremap <M-.> <C-t>
inoremap <M-,> <C-d>
tnoremap <Esc> <C-\><C-n>

command Automake autocmd BufWritePost <buffer> make

let mapleader = ' '

nnoremap <leader>ve :tabedit $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <leader>e :NERDTreeFind<CR>

"nnoremap <leader>baro :echo "Enter key:"<CR>"zyy"zpVr
"nnoremap <leader>barO :echo "Enter key:"<CR>"zyy"zPVr

if exists(":YcmCompleter")
    nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gD :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader><leader> :YcmCompleter GoTo<CR>
    nnoremap <leader>fi :YcmCompleter FixIt<CR>
endif


augroup vimrc
    autocmd!
    "autocmd BufEnter * silent! lcd %:h  " look for 'autochdir'
    autocmd FileType c,cpp,python,haskell,cmake,tex,java,html,kotlin,lua
        \ setlocal expandtab colorcolumn=80,120
    autocmd FileType c,cpp,python,sh,tex,haskell,java,html,kotlin,lua
        \ autocmd BufWritePre,FileWritePre <buffer> call RStrip()
    autocmd FileType c,cpp,python setlocal nowrap
augroup END

" Remove trailing whitespaces
function! RStrip()
    let cursor_pos = getpos('.')
    silent %s/\s\+$//e
    call setpos('.', cursor_pos)
endfunction


" Surround
let g:surround_indent = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_filetype_whitelist = { 'cpp':1, 'c':1, 'python':0, 'lua':1, 'java':1, 'kotlin':1, 'sh':0 }
let g:ycm_filetype_blacklist = { 'tex':1, 'text':1, 'markdown':1 }

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

" AutoPairs
let g:AutoPairsMultilineClose = 0

" NERDTree
let NERDTreeIgnore = ['__pycache__']
let NERDTreeMouseMode = 3

" gutentags
let g:gutentags_project_root = ['.git']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_cache_dir = '/tmp/gutentags'

" jedi
let g:jedi#goto_command = "gd"
let g:jedi#rename_command = ""
let g:jedi#rename_command_keep_name = "<f2>"
let g:jedi#smart_auto_mappings = 1
let g:jedi#use_tag_stack = 1
let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#show_call_signatures = 0

" vim-gitgutter
if exists(':GitGutterGetHunkSummary')
    function! GitStatus()
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf('git changes: +%d ~%d -%d', a, m, r)
    endfunction
    set statusline& statusline+=%{GitStatus()}
endif
