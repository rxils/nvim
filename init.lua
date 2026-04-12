vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.lazy')

require('config.tabline')

vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scl = 'no'
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = "80"
vim.opt.equalalways = false

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3

vim.diagnostic.config({ virtual_text = false })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>[', '',
  { callback = function ()
    vim.diagnostic.jump({ count = -1, float = true })
  end })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-w>]', '',
  { callback = function ()
    vim.diagnostic.jump({ count = 1, float = true })
  end })

vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>q', '<Esc>:tabnew<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>r', '<Esc>:tabclose<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>w', '<Esc>:tabprevious<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>e', '<Esc>:tabnext<CR>')
vim.cmd('cnoreabbrev W w')
