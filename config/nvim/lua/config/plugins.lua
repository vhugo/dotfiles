-------------------------------------------------------------------------------
-- PLUGIN INSTALL
-------------------------------------------------------------------------------

vim.cmd 'packadd paq-nvim'

require 'paq' {
  {'savq/paq-nvim', opt=true}; -- package manager
  'svermeulen/vimpeccable'; -- for write nvim rc in lua

-----------------------------------------------
-- VISUAL
-----------------------------------------------
  'EdenEast/nightfox.nvim'; -- colorscheme nightfox
  {'catppuccin/nvim', as='catppuccin'}; -- colorscheme catppuccin
  'nvim-lualine/lualine.nvim'; -- lualine statusline in lua
  'rcarriga/nvim-notify';

-----------------------------------------------
-- IDE - Integrated Development Environment
-----------------------------------------------

  -- gitgutter to display lines changed
  'airblade/vim-gitgutter';

  -- Telescope and its dependencies is a must have
  'nvim-lua/popup.nvim';
  'nvim-lua/plenary.nvim';
  'nvim-telescope/telescope.nvim';

  -- Treesitter improve integration with neovim interface
  {'nvim-treesitter/nvim-treesitter', run=function() vim.cmd "TSUpdate" end};

  -- LSPConfig takes care of configuration with language server protocol to allow
  -- most important interation with the code.
  'neovim/nvim-lspconfig';
  'onsails/lspkind.nvim';

  -- nvim-tree - a file explorer
  'nvim-tree/nvim-web-devicons';
  'nvim-tree/nvim-tree.lua';

  -- Commentary - for comments line of code.
  'tpope/vim-commentary';

  -- todo-comments - highlight todo flags in comments and provide ways to follow up
  -- on them.
  'folke/todo-comments.nvim';

  -- DiffView - display diff from files and previous commit.
  'sindrets/diffview.nvim';

  -- Fish - set the terminal shell to fish shell instead of bash or other.
  {'dag/vim-fish', run=function() vim.cmd 'if &shell =~# \'fish$\' | set shell=sh | endif' end};

  -- Blame-line - displays git blame information on the line
  'tveskag/nvim-blame-line';

  -- Luasnip - Snippets funcionality
  'L3MON4D3/LuaSnip';

  -- nvim-cmp - autocompletion for nvim
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-nvim-lua';
  'uga-rosa/cmp-dictionary';
  'saadparwaiz1/cmp_luasnip';

  -- nvim-coverage
  -- 'andythigpen/nvim-coverage';

  -- nvim-test
  -- 'klen/nvim-test';

  -- vim-go - Go development plugin
  {'fatih/vim-go', run=function() vim.cmd(':GoUpdateBinaries') end};

  -- Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML
  -- tags, and more. The plugin provides mappings to easily delete, change and add
  -- such surroundings in pairs.
  -- https://github.com/tpope/vim-surround
  -- 'tpope/vim-surround';
  -- 'tpope/vim-repeat';

-----------------------------------------------
-- TEXT EDITING
-----------------------------------------------
  -- Grammarous - a grammar checker
  'rhysd/vim-grammarous'
}

-- vim-go disable all default mapping
-- vim.g.go_def_mapping_enabled = 0

require 'config.plugins-prefs'
