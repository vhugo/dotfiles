" Spell and Grammar check
let g:grammarous#show_first_error=1              " Show error immediately
let g:grammarous#enabled_rules = {'*' : ['PASSIVE_VOICE']} " Enable passive voice in all filetypes
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }

" Markdown
" Setup spell checking, and use <Ctrl>s to open spelling completion menu
au filetype markdown call MarkdownMode()

function! MarkdownMode()
  setlocal spell
  setlocal wrap
  setlocal textwidth=80
  setlocal linebreak
endfunction

:nnoremap <leader>[ i- [ ]  

:nnoremap <F5> "=strftime("%Y.%m.%d %H:%M %a")<CR>P
:inoremap <F5> <C-R>=strftime("%Y.%m.%d %H:%M %a")<CR>
:nnoremap <F6> "=strftime("%Y.%m.%d %a")<CR>P
:inoremap <F6> <C-R>=strftime("%Y.%m.%d %a")<CR>
:nnoremap <F7> "=strftime("%H:%M")<CR>P
:inoremap <F7> <C-R>=strftime("%H:%M")<CR>
