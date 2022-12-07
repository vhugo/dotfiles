-------------------------------------------------------------------------------
-- PLUGIN INSTALL
-------------------------------------------------------------------------------

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
          lualine_c = {{
            'filename',
            file_status = true,
            newfile_status = true,
            path = 1,
          }},
          lualine_x = {'filetype'},
          -- lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {{
            'filename',
            file_status = true,
            newfile_status = true,
            path = 1,
          }},
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

  -- Telescope and its dependencies is a must have
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      local inserter_mode = {
        initial_mode = "insert",
        prompt_prefix = "🔍",
      }

      require("telescope").setup {
        defaults = {
          initial_mode = "normal",
          layout_strategy = 'vertical',
          layout_config = {
            height = 0.90,
            -- preview_height = 0.70,
            prompt_position = 'top',
            mirror = true,
          },
        },
        pickers = {
          live_grep = inserter_mode,
          find_files = inserter_mode,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end,
  }

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
    tag = "v1.*",
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

  -- LSPConfig takes care of configuration with language server protocol to allow
  -- most important interation with the code.
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'

  -- nvim-cmp - autocompletion for nvim
  use {
    'hrsh7th/nvim-cmp',
    config=function()
      -- Telescope builtin alias
      local tb = require('telescope.builtin')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup of lscpconfig for golang
      require('lspconfig').gopls.setup{
        capabilities = capabilities,
        on_attach = function(_, bufnr)

          -- show function signature while typing it
          require('lsp_signature').on_attach(signature_setup, bufnr)

          vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})

          -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
          vim.keymap.set("n", "gd", function()
            tb.lsp_definitions({
              fname_width = 50,
	          })
          end, {buffer = 0})

          -- vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
          vim.keymap.set("n", "gT", function()
            tb.lsp_type_definitions({
              fname_width = 50,
	          })
          end, {buffer = 0})

          -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
          vim.keymap.set("n", "gi", function()
            tb.lsp_implementations({
              fname_width = 50,
              jump_type = 'tab',
	          })
          end, {buffer = 0})

          -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
          vim.keymap.set("n", "gr", function()
            tb.lsp_references({
              fname_width = 50,
	          })
          end, {buffer = 0})

          -- DIAGNOSTICS
          vim.keymap.set("n", "__", function()
            tb.diagnostics()
          end, {buffer = 0})
          vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
          vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})

          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
        end,
      }

      -- language server for python
      require'lspconfig'.pyright.setup{
        capabilities = capabilities,
      }

      -- lspkind setup
      local lspkind = require('lspkind')
      lspkind.init()

      -- luasnip setup
      local luasnip = require 'luasnip'

      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
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
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
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
          })
        },
        experimental = {
          native_menu = false,
          ghost_text = true,
        },
      })
    end
  }
  use 'saadparwaiz1/cmp_luasnip'
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
        exact = -1,
        max_items = 5,
        first_case_insensitive = true,
      })
    end
  }

  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = {'mfussenegger/nvim-dap'},
    config = function()
      require("dapui").setup({
        icons = { expanded = "", collapsed = "", current_frame = "" },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Use this to override mappings for specific elements
        element_mappings = {
          -- Example:
          -- stacks = {
          --   open = "<CR>",
          --   expand = "o",
          -- }
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.7") == 1,
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
          {
            elements = {
            -- Elements can be strings or table with id and size keys.
              { id = "scopes", size = 0.25 },
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40, -- 40 columns
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
          },
        },
        controls = {
          -- Requires Neovim nightly (or 0.8 when released)
          enabled = true,
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
          },
        },
        floating = {
          max_height = nil, -- These can be integers or a float between 0 and 1.
          max_width = nil, -- Floats will be treated as percentage of your screen.
          border = "single", -- Border style. Can be "single", "double" or "rounded"
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        }
      })
    end
  }
  use {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end
  }

  -- gitsigns to display lines changed
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
          change       = { hl = 'GitSignsChange', text = '║', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        },
      }
      -- require('gitsigns').setup()
    end
  }

  -- nvim-coverage
  use {
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
    config = function()
       require("coverage").setup({
        commands = true, -- create commands
        highlights = {
          covered = { fg = "#C3E88D", bg = "NONE" },   -- supports style, fg, bg, sp (see :h highlight-gui)
          uncovered = { fg = "#F07178" },
        },
        signs = {
          -- use your own highlight groups or text markers
          covered = { hl = "CoverageCovered", text = "█" }, -- ▎
          uncovered = { hl = "CoverageUncovered", text = "█" }, -- █
        },
        summary = {
          min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
        },
        lang = {
          go = {
            coverage_file = vim.fn.getcwd() .. '/coverage.out',
          },
        },
      })
    end,
  }

  -- nvim-test
  use 'klen/nvim-test'

  -- go.vim
  -- use 'ray-x/guihua.lua'
  -- use {
  --   'ray-x/go.nvim',
  --   config=function()
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       pattern = "*.go",
  --       callback = function()
  --         require('go.format').goimport()
  --       end,
  --       group = format_sync_grp,
  --     })
  --     require('go').setup({
  --       luasnip = true,
  --       run_in_floaterm = true,
  --     })
  --   end
  -- }

  -- nvim-go - minial Go development plugin
  use {
    'crispgm/nvim-go',
    run = function() vim.cmd(':GoUpdateBinaries') end,
    config=function()
      require('go').setup({
          -- notify: use nvim-notify
          notify = true,
          -- auto commands
          auto_format = true,
          auto_lint = true,
          -- linters: revive, errcheck, staticcheck, golangci-lint
          -- linter = 'revive',
          linter = 'golangci-lint',
          -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
          -- linter_flags = {revive = {'-config', '~/.go-revive.toml'}},
          -- lint_prompt_style: qf (quickfix), vt (virtual text)
          lint_prompt_style = 'qf',
          -- formatter: goimports, gofmt, gofumpt, lsp
          -- formatter = 'goimports',
          -- maintain cursor position after formatting loaded buffer
          maintain_cursor_pos = false,
          -- test flags: -count=1 will disable cache
          test_flags = {
              '-v',
              '-count=1',
              '-coverprofile=' .. vim.fn.getcwd() .. '/coverage.out',
            },
          test_timeout = '30s',
          test_env = {},
          -- show test result with popup window
          test_popup = true,
          test_popup_auto_leave = true,
          test_popup_width = 80,
          test_popup_height = 10,
          -- test open
          test_open_cmd = 'edit',
          -- struct tags
          tags_name = 'json',
          tags_options = {'json=omitempty'},
          tags_transform = 'snakecase',
          tags_flags = {'-skip-unexported'},
          -- quick type
          quick_type_flags = {'--just-types'},
      })
    end
  }

  -- vim-go - Go development plugin
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
