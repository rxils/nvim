local vim = vim

local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lualine/lualine.nvim')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = ':TSUpdate',
  ['branch'] = 'main'
})
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-path')
Plug('RRethy/vim-illuminate')

Plug('windwp/nvim-autopairs')
Plug('windwp/nvim-ts-autotag')
Plug('famiu/bufdelete.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('HiPhish/rainbow-delimiters.nvim')

Plug('f-person/auto-dark-mode.nvim')

Plug('lewis6991/gitsigns.nvim')

vim.call('plug#end')




require('plugins.auto-dark-mode')
require('plugins.cmp')
require('plugins.gitsigns')
require('plugins.nvim-autopairs')
require('plugins.nvim-tree')
require('plugins.nvim-ts-autotag')

require('lsp')
require('tabline')


vim.g.rainbow_delimiters = { highlight = {
  "RainbowYellow",
  "RainbowRed",
  "RainbowGreen",
}}




vim.cmd('hi def IlluminatedWordText gui=bold,underline')
vim.cmd('hi def IlluminatedWordRead gui=bold,underline')
vim.cmd('hi def IlluminatedWordWrite gui=bold,underline')




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
--vim.o.termguicolors = true

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
--vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:Lexplore<CR>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:NvimTreeToggle<CR>')
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev bdd bd')
vim.cmd('cnoreabbrev bd Bd')
vim.cmd('cnoreabbrev bww bw')
vim.cmd('cnoreabbrev bw Bw')
