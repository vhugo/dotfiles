-------------------------------------------------------------------------------
-- PLUGIN INSTALL
-------------------------------------------------------------------------------

-- require "paq" {
--     "savq/paq-nvim";
-- }


-- vim.cmd 'packadd packer.nvim'
vim.opt.completeopt={"menu","menuone","noselect"}

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'svermeulen/vimpeccable' -- for write nvim rc in lua

-----------------------------------------------
-- VISUAL
-----------------------------------------------

-- colorscheme nightfox
 use {
    'EdenEast/nightfox.nvim',
    config = function()
      local palettes = {}
      local specs = {}
      local groups = {}

      require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })
    end
  }

-- colorscheme catppuccin
  use {
    'catppuccin/nvim',
    as='catppuccin',
    config=function()
      require("catppuccin").setup({
          flavour = "frappe", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              light = "latte",
              dark = "mocha",
          },
          transparent_background = false,
          term_colors = false,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {},
          custom_highlights = {},
          integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              telescope = true,
              notify = true,
              mini = false,
              -- For more plugins integrations please scroll down
              -- (https://github.com/catppuccin/nvim#integrations)
          },
      })
    end
  }

-- lualine statusline in lua
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config=function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = 'nord',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {},
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'g:coc_status', 'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      })
      -- return require('lualine').setup()
    end
  }

  use {
    'rcarriga/nvim-notify',
    config = function() vim.notify = require('notify')  end
  }

  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.*',
    config = function()
        require'window-picker'.setup()
    end,
  }

-----------------------------------------------
-- IDE - Integrated Development Environment
-----------------------------------------------

  -- gitgutter to display lines changed
  use {'airblade/vim-gitgutter', cmd={'GitGutterEnable'}}

  -- Telescope and its dependencies is a must have
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Treesitter improve integration with neovim interface
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "go", "lua", "python" },
        highlight = {
            enable = true,
        },
      }
    end
  };

  -- LSPConfig takes care of configuration with language server protocol to allow
  -- most important interation with the code.
  use {
    'neovim/nvim-lspconfig',
    config=function()
      require('lspconfig').gopls.setup{
        capabilities = capabilities,
        on_attach = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
          vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
          vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
          vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
          vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.code_action, {buffer=0})
        end,
      }
    end
  }
  use 'onsails/lspkind.nvim'

  -- nvim-tree - a file explorer
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-tree/nvim-tree.lua',
    config=function()
      -- disable netrw (strongly advised)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight group
      vim.o.termguicolors = true

      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  }

  -- Commentary - for comments line of code.
  use 'tpope/vim-commentary'

  -- todo-comments - highlight todo flags in comments and provide ways to follow up
  -- on them.
  use {
    'folke/todo-comments.nvim',
    config=function()
      require("todo-comments").setup {
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comment
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search result
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keyword
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE", -- The gui style to use for the fg highlight group.
          bg = "BOLD", -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the default
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true, -- enable multine todo comment
          multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
          before = "", -- "fg" or "bg" or empty
          keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg", -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          max_line_len = 400, -- ignore lines longer than thi
          exclude = {}, -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positive
        },
      }
    end
  }

  -- DiffView - display diff from files and previous commit.
  use 'sindrets/diffview.nvim'

  -- Fish - set the terminal shell to fish shell instead of bash or other.
  use {'dag/vim-fish', run = function() vim.cmd 'if &shell =~# \'fish$\' | set shell=sh | endif' end}

  -- Blame-line - displays git blame information on the line
  use 'tveskag/nvim-blame-line'

  -- Luasnip - Snippets funcionality
  use {
    'L3MON4D3/LuaSnip',
    config=function()
      local ls = require 'luasnip'
      local types = require 'luasnip.util.types'

      ls.config.set_config {
        -- This tells LuaSnip to remember to keep around the last snippet.
        history = true,

        -- used for dynamic snippets, it updates as you type in multiple place
        updateevents = 'TextChanged,TextChangedI',

        -- Autosnippets:
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "", "Error" } },
            },
          },
        },
      }
    end
  }

  -- nvim-cmp - autocompletion for nvim
  use {
    'hrsh7th/nvim-cmp',
    config=function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local cmp = require'cmp'
      local lspkind = require('lspkind')

      lspkind.init()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),

          -- Accept currently selected item. Set `select` to `false` to only confirm
          -- explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        -- sorting = {
        --   comparators = {
        --     cmp.config.compare.offset,
        --     cmp.config.compare.exact,
        --     cmp.config.compare.score,
        --     cmp.config.compare.kind,
        --     cmp.config.compare.sort_text,
        --     cmp.config.compare.length,
        --     cmp.config.compare.order,
        --   },
        -- },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'path' },
          { name = 'dictionary', keyword_length = 3 },
          { name = 'buffer', keyword_length = 5 },
        },
        formatting = {
          format = lspkind.cmp_format({
            with_text = true,
            menu = {
              buffer = '[buf]',
              nvim_lsp = '[LSP]',
              nvim_lua = '[api]',
              path = '[path]',
              luasnip = '[snip]',
              dictionary = '[dict]',
            },
            -- mode = 'symbol', -- show only symbol annotations
            -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          })
        },
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
      })
    end
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use {
    'uga-rosa/cmp-dictionary',
    config=function()
      require("cmp_dictionary").setup({
        dic = {
          ["*"] = "~/.config/nvim/spell/en.dict",
          -- spelllang = {
          -- 	en = "~/.config/nvim/spell/en.dict",
          -- 	pt = "~/.config/nvim/spell/pt_br.dict",
          -- 	nl = "~/.config/nvim/spell/nl.dict",
          -- },
        },
        -- The following are default values.
        exact = -1,
        max_items = 5,
        first_case_insensitive = true,
        -- document = false,
        -- document_command = "wn %s -over",
        -- async = false,
        -- capacity = 5,
        -- debug = false,
      })
    end
  }
  use 'saadparwaiz1/cmp_luasnip'

  -- nvim-coverage
  use 'andythigpen/nvim-coverage'

  -- nvim-test
  use 'klen/nvim-test'

  -- -- go.vim
  -- use {
  --   'ray-x/go.nvim',
  --   config=function()
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       pattern = "*.go",
  --       callback = function()
  --       require('go.format').goimport()
  --       end,
  --       group = format_sync_grp,
  --     })
  --     require('go').setup()
  --   end
  -- }

  -- -- nvim-go - minial Go development plugin
  -- use {
  --   'crispgm/nvim-go',
  --   run = function() vim.cmd(':GoUpdateBinaries') end,
  --   config=function()
  --     require('go').setup({
  --         -- notify: use nvim-notify
  --         notify = true,
  --         -- auto commands
  --         auto_format = true,
  --         auto_lint = true,
  --         -- linters: revive, errcheck, staticcheck, golangci-lint
  --         -- linter = 'revive',
  --         -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
  --         linter_flags = {revive = {'-config', '~/.go-revive.toml'}},
  --         -- lint_prompt_style: qf (quickfix), vt (virtual text)
  --         lint_prompt_style = 'qf',
  --         -- formatter: goimports, gofmt, gofumpt, lsp
  --         -- formatter = 'goimports',
  --         -- maintain cursor position after formatting loaded buffer
  --         maintain_cursor_pos = false,
  --         -- test flags: -count=1 will disable cache
  --         test_flags = {'-v'},
  --         test_timeout = '30s',
  --         test_env = {},
  --         -- show test result with popup window
  --         test_popup = true,
  --         test_popup_auto_leave = false,
  --         test_popup_width = 80,
  --         test_popup_height = 10,
  --         -- test open
  --         test_open_cmd = 'edit',
  --         -- struct tags
  --         tags_name = 'json',
  --         tags_options = {'json=omitempty'},
  --         tags_transform = 'snakecase',
  --         tags_flags = {'-skip-unexported'},
  --         -- quick type
  --         quick_type_flags = {'--just-types'},
  --     })
  --   end
  -- }

  -- -- vim-go - Go development plugin
  -- use {'fatih/vim-go', run=function() vim.cmd(':GoUpdateBinaries') end}

  -- Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML
  -- tags, and more. The plugin provides mappings to easily delete, change and add
  -- such surroundings in pairs.
  -- https://github.com/tpope/vim-surround
  -- use 'tpope/vim-surround'
  -- use 'tpope/vim-repeat'

-----------------------------------------------
-- TEXT EDITING
-----------------------------------------------
  -- Grammarous - a grammar checker
  use 'rhysd/vim-grammarous'
end)
