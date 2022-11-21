" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" quick save and quit
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qa<cr>

" open terminal in a new split to the very bottom
nnoremap <leader>te <cmd>:wincmd s<cr>:wincmd j<cr>:wincmd J<cr>:te<cr><esc>i

" Use j/k to start, then scroll through autocomplete options
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("\<C-x><c-n>"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("\<C-x><c-k>"))

" Chadtree toggle
nnoremap <leader>v <cmd>CHADopen<cr>

" Golang development
nnoremap <leader>gc <cmd>GoCoverageToggle<cr>
nnoremap <leader>gt <cmd>GoTestFunc<cr>


