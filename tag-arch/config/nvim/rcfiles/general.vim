" General: configuration options that don't belong to other categories. Bare
" minimal options to work with. 
" ==========================================================================

" reload configuration
nnoremap <leader>! :source $MYVIMRC<cr>

" Navigation
set history=1000 		  " Remember last 1k commands
set scrolloff=4 		  " Keep at least 4 lines below cursor
set autowrite         " Write for me when I take any action
set number			      " Show line number
set relativenumber		" Show cursor relative line number 

" Editing
set expandtab          " Convert <tab> to spaces (2 or 4)
set tabstop=2          " Two spaces per tab as default
set shiftwidth=2       "     then override with per filetype
set softtabstop=2      "     specific settings via autocmd
set shiftround         " Multiple shiftwidth indenting '<' and '>'
set nojoinspaces       " Use one space, not two, after punctuation.

" Set modeline to 1 to allow rcfiles to be recognized as vim files
set modelines=1

" Disable sound/visual bell on errors
" May need additional config about audible bell
set t_vb=
set vb

" I save constantly and hate swap files in my project dirs
set nobackup
set nowritebackup
set noswapfile

" Persistent undo
let undodir = expand('~/.undo-nvim')
if !isdirectory(undodir)
  call mkdir(undodir)
endif
set undodir=~/.undo-nvim
set undofile               " Create FILE.un~ files for persistent undo

" Do not use <Ctrl-c> to break out to normal mode
" Use C-Space to Esc out of any mode
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^

" Leader-; to enter command mode. No more holding shift!
nnoremap <leader>; :
vnoremap <leader>; :
