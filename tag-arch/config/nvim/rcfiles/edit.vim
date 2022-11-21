" Help to fix issue with trailing whitespace
" note trailing space at end of next line
set nowrap
set showbreak=>\ \ \ 

" Automatically remove for code files when save
autocmd FileType markdown,c,ruby,python,php,go,yaml,json autocmd BufWritePre <buffer> :%s/\s\+$//e
