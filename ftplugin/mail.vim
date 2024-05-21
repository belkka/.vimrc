" format=flowed
setlocal formatoptions+=aw

" toggle a whitespace at the end of the line
nnoremap	=f	:s/$/x/ \| s/ x$/y/e \| s/x$/ y/e \| s/y$//<CR>
