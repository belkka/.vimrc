" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer: Ulyanich Michael <ulianich_mihail@ukr.net>
" Last Change: 2017 June 12

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = expand('<sfile>:t:r')

hi Normal                            ctermbg=235         cterm=none      guifg=#ffffff guibg=#000000    gui=none
hi Comment       ctermfg=blue                            cterm=bold      guifg=#808080

hi Boolean       ctermfg=green                           cterm=none      guifg=#00ff00                  gui=none
hi Number        ctermfg=red                             cterm=none      guifg=#ff0000                  gui=none
hi Character     ctermfg=magenta     ctermbg=black       cterm=none      guifg=#00ffff                  gui=none
hi String        ctermfg=magenta     ctermbg=black       cterm=none      guifg=#00ffff                  gui=none
hi Constant      ctermfg=magenta                         cterm=none      guifg=#00ffff                  gui=none

hi Identifier    ctermfg=cyan                            cterm=none      guifg=#00c0c0
hi Statement     ctermfg=yellow                          cterm=bold      guifg=#c0c000                  gui=bold
hi PreProc       ctermfg=lightgreen                                      guifg=#00ff00
hi Type          ctermfg=green                           cterm=bold      guifg=#00c000
hi Special       ctermfg=blue                                            guifg=#0000ff

hi Error                             ctermbg=red         cterm=none                    guibg=#ff0000
hi Todo          ctermfg=black       ctermbg=darkyellow  cterm=underline guifg=#000080 guibg=#c0c000

"hi Directory     ctermfg=2                                               guifg=#00c000

hi Search                            ctermbg=grey                                      guibg=#c0c000
hi CursorLine                        ctermbg=236         cterm=NONE
hi CursorColumn                      ctermbg=236

hi ColorColumn                       ctermbg=234
