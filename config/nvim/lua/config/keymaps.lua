-- vimp is shorthand for vimpeccable
local vimp = require('vimp')

-- Open configuration files
vimp.nnoremap('<leader>,,', '<cmd>vsplit ~/.config/nvim/init.lua<cr>')
vimp.nnoremap('<leader>,p', '<cmd>vsplit ~/.config/nvim/lua/config/prefs.lua<cr>')
vimp.nnoremap('<leader>,l', '<cmd>vsplit ~/.config/nvim/lua/config/plugins.lua<cr>')
vimp.nnoremap('<leader>,o', '<cmd>vsplit ~/.config/nvim/lua/config/plugins-prefs.lua<cr>')
vimp.nnoremap('<leader>,k', '<cmd>vsplit ~/.config/nvim/lua/config/keymaps.lua<cr>')

-- Reload Configuration
vimp.nnoremap('<leader>!', function()
  -- Remove all previously added vimpeccable maps
  vimp.unmap_all()
  -- Unload the lua namespace so that the next time require('config.X') is called
  -- it will reload the file
  require("config.util").unload_lua_namespace('config')
  -- Make sure all open buffers are saved
  vim.cmd('silent wa')
  -- Execute our vimrc lua file again to add back our maps
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  vim.notify("Reloaded vimrc!", "info", {
    title = "Neovim Configuration",
  })
end)

-- Quick exits
vimp.nnoremap('<leader>qq', '<cmd>q<cr>')
vimp.nnoremap('<leader>qa', '<cmd>qa<cr>')
vimp.nnoremap('<leader>11', '<cmd>qa!<cr>')

-- Do not use <Ctrl-c> to break out to normal mode
-- Use C-Space to Esc out of any mode
vimp.nnoremap('<C-Space>', '<esc>:noh<cr>')
vimp.vnoremap('<C-Space>', '<esc>gV')
vimp.onoremap('<C-Space>', '<esc>')
vimp.cnoremap('<C-Space>', '<C-c>')
-- vimp.inoremap('<C-Space>', '<esc>`^') -- conflicts with nvim-cmp completion

-- Opens a terminal in a new split to the very bottom
vimp.nnoremap('<leader>te', function()
  vim.cmd('split') -- split the window
  vim.cmd('wincmd J') -- send it to the bottom
  vim.cmd('terminal') -- open the terminal
  vim.cmd('startinsert') -- enable insert mode
end)

-- Tabs
for tab_number=1,6 do
  vimp.nnoremap('<C-w>'..tab_number, '<cmd>tabnext '..tab_number..'<cr>')
end
vimp.nnoremap('<leader>nt', '<cmd>tabnew<cr>')
vimp.nnoremap('<leader>ct', '<cmd>tabclose<cr>')

-- Window
vimp.nnoremap('<leader>=', '<cmd>wincmd =<cr>')
vimp.nnoremap('<leader>-', function()
  vim.cmd('wincmd _')
  vim.cmd('wincmd |')
end)

-------------------------------------------------------------------------------
-- TELESCOPE
-------------------------------------------------------------------------------
local tele = require('telescope.builtin')
vimp.nnoremap('<leader>ff', tele.find_files)
vimp.nnoremap('<leader>fg', tele.live_grep)
vimp.nnoremap('<leader>fb', tele.buffers)
vimp.nnoremap('<leader>fh', tele.help_tags)
vimp.nnoremap('<leader>fd', tele.diagnostics)

-------------------------------------------------------------------------------
-- NVIM-TREE
-------------------------------------------------------------------------------
local nt_api = require('nvim-tree.api')
vimp.nnoremap('<leader>v', nt_api.tree.toggle)

-------------------------------------------------------------------------------
-- LUASNIP
-------------------------------------------------------------------------------
local ls = require('luasnip')

vimp.inoremap('<C-x>', function()
  print("expanding")
  -- if ls.expand_or_jumpable() then
    -- ls.expand_or_jump()
  -- end
end)

-- vim.keymap.set({'i','s'}, '<C-k>', function()
--   print("trying to expand")
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end, { silent = true })

vim.keymap.set({'i','s'}, '<C-j>', function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({'i','s'}, '<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vimp.nnoremap("<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<cr>")

-------------------------------------------------------------------------------
-- GIT BLAME LINE
-------------------------------------------------------------------------------
vimp.nnoremap('<leader>b', '<cmd>ToggleBlameLine<cr>')

-------------------------------------------------------------------------------
-- GOLANG
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go"},
  callback = function()
    vim.keymap.set('n','<leader>gt', '<cmd>GoTestFunc<cr>')
    vim.keymap.set('n','<leader>gc', '<cmd>GoCoverageToggle<cr>')
    vim.keymap.set('n','<leader>tt', function()
      vim.cmd('GoTestFunc')
      vim.cmd('wincmd h')
      vim.cmd('GoCoverageClear')
      vim.cmd('GoCoverage')
      vim.cmd('wincmd l')
    end)
    vim.keymap.set('n','<leader>ot', '<cmd>:wincmd v<cr>:e %:p:r_test.go<cr><esc>',{
      silent = true,
    })
  end,
})

-------------------------------------------------------------------------------
-- WRITING
-------------------------------------------------------------------------------
vimp.nnoremap('<leader>[','i- [ ] ')
-- :nnoremap <F5> "=strftime("%Y.%m.%d %H:%M %a")<CR>P
-- :inoremap <F5> <C-R>=strftime("%Y.%m.%d %H:%M %a")<CR>
-- :nnoremap <F6> "=strftime("%Y.%m.%d %a")<CR>P
-- :inoremap <F6> <C-R>=strftime("%Y.%m.%d %a")<CR>
-- :nnoremap <F7> "=strftime("%H:%M")<CR>P
-- :inoremap <F7> <C-R>=strftime("%H:%M")<CR>
