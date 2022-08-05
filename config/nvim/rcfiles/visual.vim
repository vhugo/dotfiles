set textwidth=80
set colorcolumn=+1,+2,+3,+4

" Window/Panels
" Open new split panes to right and bottom
set splitbelow
set splitright

" Easy access to maximizing
nnoremap <C-_> <C-w>_

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

lua << END
local nightfox = require('nightfox')

nightfox.setup({
  palette = {
    bg = "#000",
  }
})
END

colorscheme nordfox
