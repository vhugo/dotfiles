-------------------------------------------------------------------------------
-- PLUGIN CONFIGURATION
-------------------------------------------------------------------------------
--

-------------------------------------------------------------------------------
-- IDE - Integrated Development Environment
-------------------------------------------------------------------------------
vim.opt.completeopt={"menu","menuone","noselect"}

--
-- PLUGIN: notify
--
vim.notify = require("notify")

--
-- PLUGIN: gitgutter
--
vim.api.nvim_create_autocmd("FileType",{
  command = ':GitGutterEnable'})

--
-- PLUGIN: nvim-test
----
--require('nvim-test').setup {
--  run = true,                 -- run tests (using for debug)
--  commands_create = true,     -- create commands (TestFile, TestLast, ...)
--  filename_modifier = ":.",   -- modify filenames before tests run(:h filename-modifiers)
--  silent = false,             -- less notifications
--  term = "terminal",          -- a terminal to run ("terminal"|"toggleterm")
--  termOpts = {
--    direction = "float",   -- terminal's direction ("horizontal"|"vertical"|"float")
--    width = 96,               -- terminal's width (for vertical|float)
--    height = 24,              -- terminal's height (for horizontal|float)
--    go_back = false,          -- return focus to original window after executing
--    stopinsert = "auto",      -- exit from insert mode (true|false|"auto")
--    keep_one = true,          -- keep only one terminal for testing
--  },
--  runners = {               -- setup tests runners
--    cs = "nvim-test.runners.dotnet",
--    go = "nvim-test.runners.go-test",
--    haskell = "nvim-test.runners.hspec",
--    javacriptreact = "nvim-test.runners.jest",
--    javascript = "nvim-test.runners.jest",
--    lua = "nvim-test.runners.busted",
--    python = "nvim-test.runners.pytest",
--    ruby = "nvim-test.runners.rspec",
--    rust = "nvim-test.runners.cargo-test",
--    typescript = "nvim-test.runners.jest",
--    typescriptreact = "nvim-test.runners.jest",
--  }
--}

--
-- PLUGIN: nvim-coverage
--
-- require("coverage").setup({
-- 	commands = true, -- create commands
-- 	highlights = {
-- 		-- customize highlight groups created by the plugin
-- 		covered = { fg = "#C3E88D" },   -- supports style, fg, bg, sp (see :h highlight-gui)
-- 		uncovered = { fg = "#F07178" },
-- 	},
-- 	signs = {
-- 		-- use your own highlight groups or text markers
-- 		covered = { hl = "CoverageCovered", text = "▎" },
-- 		uncovered = { hl = "CoverageUncovered", text = "▎" },
-- 	},
-- 	summary = {
-- 		-- customize the summary pop-up
-- 		min_coverage = 80.0,      -- minimum coverage threshold (used for highlighting)
-- 	},
-- 	lang = {
-- 		-- customize language specific settings
-- 	},
-- })

----
---- PLUGIN: Telescope
---------------------------------------------------------------------------------
----

--require('telescope').setup{
--  defaults = {
--    -- Default configuration for telescope goes here:
--    -- config_key = value,
--    mappings = {
--      i = {
--        -- map actions.which_key to <C-h> (default: <C-/>)
--        -- actions.which_key shows the mappings for your picker,
--        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
--        ["<C-h>"] = "which_key"
--      }
--    }
--  },
--  pickers = {
--    -- Default configuration for builtin pickers goes here:
--    -- picker_name = {
--    --   picker_config_key = value,
--    --   ...
--    -- }
--    -- Now the picker_config_key will be applied every time you call thi
--    -- builtin picker
--  },
--  extensions = {
--    -- Your extension configuration goes here:
--    -- extension_name = {
--    --   extension_config_key = value,
--    -- }
--    -- please take a look at the readme of the extension you want to configure
--  }
--}

--
-- PLUGIN: LuaSnip
-------------------------------------------------------------------------------
--
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

--
-- PLUGIN: cmp-dictionary
--
--

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

--
-- PLUGIN: nvim-cmp.
-------------------------------------------------------------------------------
--

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

--
-- PLUGIN: LSPConfig
-------------------------------------------------------------------------------
--

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

-- require('lspconfig').golangci_lint_ls.setup{}


--
-- PLUGIN: todo-comment
-------------------------------------------------------------------------------
--

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

--
-- PLUGIN: Treesitter
-------------------------------------------------------------------------------
--

require("nvim-treesitter.configs").setup {
  ensure_installed = { "go", "lua", "python" },
  highlight = {
      enable = true,
  },
}

--
-- PLUGIN: nvim-tree
-------------------------------------------------------------------------------
--

-- disable netrw at the very start of your init.lua (strongly advised)
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

-------------------------------------------------------------------------------
-- VISUAL
-------------------------------------------------------------------------------

--
-- Colorscheme: nightfox
-------------------------------------------------------------------------------
--

local palettes = {}
local specs = {}
local groups = {}

require("nightfox").setup({ palettes = palettes, specs = specs, groups = groups })

--
-- Colorscheme: catppuccin
-------------------------------------------------------------------------------
--

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
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

--
-- PLUGIN: LuaLine
-------------------------------------------------------------------------------
--

require('lualine').setup {
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
}
require('lualine').setup()
