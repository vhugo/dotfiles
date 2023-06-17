-------------------------------------------------------------------------------
-- PREFERENCES
-------------------------------------------------------------------------------

-- Colorscheme
-------------------------------------------------------------------------------
vim.cmd('colorscheme nordfox')
-- vim.cmd('colorscheme catppuccin')

-- General: Navigation
-------------------------------------------------------------------------------
vim.o.history = 5000 -- Remember last 5k command
vim.o.scrolloff = 4 -- Keep at least 4 lines below cursor
vim.o.autowrite = true -- Write for me when I take any action
vim.o.number = true -- Show line number
vim.o.relativenumber = true -- Show cursor relative line number

-- General: Editing
-------------------------------------------------------------------------------
vim.o.expandtab = true -- Convert <tab> to spaces (2 or 4)
vim.o.tabstop = 2	-- Two spaces per tab as default
vim.o.shiftwidth = 2 -- then override with per filetype
vim.o.softtabstop = 2 -- specific settings via autocmd
vim.o.shiftround = true -- Multiple shiftwidth indenting '<' and '>'
vim.g.nojoinspaces = true -- Use one space, not two, after punctuation.

-- Set modeline to 1 to allow rcfiles to be recognized as vim file
vim.o.modelines = 1

-- Disable sound/visual bell on errors
-- May need additional config about audible bell
vim.o.t_vb = ''
vim.o.vb = true

-- I save constantly and hate swap files in my project dir
vim.g.nobackup = true
vim.g.nowritebackup = true
vim.g.noswapfile = true
vim.g.swapfile = false
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.noswapfile = true
vim.o.swapfile = false

-- Persistent undo
local undodir = vim.fn.expand('~/.undo-nvim')
if vim.fn.isdirectory(undodir) == false then
  vim.fn.mkdir(undodir)
end

vim.g.undodir = '~/.undo-nvim'
vim.o.undofile = true		-- Create FILE.un~ files for persistent undo

-- Help to fix issue with trailing whitespace
-- not trailing space at end of next line
vim.o.wrap = false 	  		-- No wrapping line
vim.o.showbreak = string.rep(" ", 3) 	-- Make is so that long lines wrap smartly
vim.o.linebreak = true

-- Automatically remove unwanted spaces when save
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown","go","yaml","json","python","lua"},
  callback = function()
    -- remove space at the end of lines
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      command = [[%s/\s\+$//e]],
    })
    -- remove empty new lines at the end of file
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      command = [[%s/\($\n\s*\)\+\%$//e]],
    })
  end,
})

-- Visual
-------------------------------------------------------------------------------
vim.o.textwidth = 80
vim.o.colorcolumn = '+1,+2,+3,+4'

-- Window/Panel
-- Open new split panes to right and bottom
vim.o.splitbelow = true
vim.o.splitright = true

-- cmd line closer to the bottom
-- vim.o.cmdheight = 0
-- vim.o.laststatus = 2
-- Writing
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = {'markdown'},
  callback = function()
    vim.o.spell = true
    vim.o.wrap = true
    vim.o.textwidth = 80
    vim.o.linebreak = true
  end,
})

-- Spell and Grammar check
vim.g.spellang = "en"
vim.g['grammarous#show_first_error'] = 1              		-- Show error immediately
-- vim.g['grammarous#enabled_rules'] = {'*' : {'PASSIVE_VOICE'}} 	-- Enable passive voice in all filetype
-- vim.g['grammarous#default_comments_only_filetypes'] = { '*' : 1, 'help' : 0, 'markdown' : 0 }
