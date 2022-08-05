"=============================================================================
"                          Neovim Runtime Configuration
"=============================================================================
" Author:        Victor Alves
" Source:        https://github.com/imVictorAlves/dotfiles
"
" This is the latest revision of my nvimrc file. It is a gather of suggestion
" from multiple dotfiles repositories on the web. But mostly it contains I find
" it useful and use all the time.
" 
" You can find the nvim configuration into individual files in the *rcfiles*
" folder - organized by functionality - and plugins configuration in *rcplugins*.
"-----------------------------------------------------------------------------

" I want to set this before any others
let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction

" Plugins are each listed in their own file. Loop and source ftw
"----------------------------------------------------------------
" set runtimepath+=~/.config/nvim
call plug#begin()
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

filetype plugin indent on " required!
syntax on

" init.vim is split accross multiple files, so loop over and source each
"---------------------------------------------------------------------
call s:SourceConfigFilesIn('rcfiles')
