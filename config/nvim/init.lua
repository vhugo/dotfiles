
--=============================================================================
--                          Neovim Runtime Configuration
--=============================================================================
-- Author:        Victor Alves
-- Source:        https://github.com/vhugo/dotfiles

-- This is the latest revision of my nvimrc file. It is a gather of suggestion
-- from multiple dotfiles repositories on the web. But mostly it contains what
-- I find useful and use it often.
-------------------------------------------------------------------------------
vim.g.mapleader = ' ' 

-- Load plugins and set custom configuration
require 'config.plugins'

-- Neovim preferences
require 'config.prefs'

-- Keymapping
require 'config.keymaps'

