local vim = vim

local Plug = vim.fn['plug#']

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')
--Plug('rktjmp/lush.nvim')
--Plug('rxils/triplebaka-dark')
Plug('nvim-lualine/lualine.nvim')

Plug('neovim/nvim-lspconfig')
Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = ':TSUpdate',
  ['branch'] = 'master'
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

vim.call('plug#end')




vim.g.theme_state = 0
vim.g.theme_rev_state = 0
local THEME_REV_STATE_PATH = vim.fn.stdpath('config')..'/.theme_rev_state'
local init_theme_rev_state = function ()
  local f = io.open(THEME_REV_STATE_PATH, 'r')
  local t
  if f ~= nil then
    t = f:read('n')
    f:close()
  end
  if t ~= 0 and t ~= 1 then
    t = 0
  end
  vim.g.theme_rev_state = t
end
init_theme_rev_state()

local theme = require('theme')

local set_theme = function (dark)
  vim.g.theme_state = dark
  local dark_ = vim.g.theme_rev_state == 0 and dark or 1 - dark

  theme.set_theme(dark_)
  theme.set_plugins(dark_)
end

require('auto-dark-mode').setup({
  set_dark_mode = function ()
    set_theme(1)
  end,
  set_light_mode = function ()
    set_theme(0)
  end
})

vim.api.nvim_create_user_command('TT', function ()
  pcall(function ()
    vim.g.theme_rev_state = 1 - vim.g.theme_rev_state
    local f = assert(io.open(THEME_REV_STATE_PATH, 'w'))
    f:write(vim.g.theme_rev_state)
    f:close()

    set_theme(vim.g.theme_state)
  end)
end, {})




require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = false,
        modified = false,
        hidden = false,
        diagnostics = false,
        bookmarks = false
      }
    }
  }
})




require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  additional_vim_regex_highlighting = false
})

local cmp = require('cmp')
local cmp_f = function(f)
  return function(fallback)
    if cmp.visible() then
      f()
    else
      fallback()
    end
  end
end
cmp.setup({
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp_f(cmp.mapping.select_next_item()),
    ['<S-Tab>'] = cmp_f(cmp.mapping.select_prev_item()),
    ['<C-q>'] = cmp_f(cmp.mapping.abort()),
    ['<CR>'] = cmp_f(cmp.mapping.confirm({ select = true }))
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' }
  }
})

local default_lsp_setup = {
  silent = true,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
}
local lsp_setup = function (name, config)
  for k, v in pairs(default_lsp_setup) do
    config[k] = v
  end
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

lsp_setup('lua_ls', {})
lsp_setup('vimls', {})
lsp_setup('bashls', {})
lsp_setup('pyright', {})
lsp_setup('ruby_lsp', {
  init_options = {
    formatter = 'standard',
    linters = { 'standard' }
  }
})
lsp_setup('ts_ls', {
  preferences = {
    javascript = {
      format = { enable = true }
    },
    typescript = {
      format = { enable = true }
    }
  }
})
lsp_setup('cssls', {})
lsp_setup('csharp_ls', {})
lsp_setup('rust_analyzer', {})
lsp_setup('r_language_server', {})
lsp_setup('julials', {})

vim.cmd('hi def IlluminatedWordText gui=bold,underline')
vim.cmd('hi def IlluminatedWordRead gui=bold,underline')
vim.cmd('hi def IlluminatedWordWrite gui=bold,underline')


require('nvim-autopairs').setup({})
require('nvim-ts-autotag').setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = false
  }
})

vim.g.rainbow_delimiters = { highlight = {
  "RainbowYellow",
  "RainbowRed",
  "RainbowGreen",
}}




function TabLineCell(i)
  local isSelected = vim.fn.tabpagenr() == i
  local buflist = vim.fn.tabpagebuflist(i)
  local winnr = vim.fn.tabpagewinnr(i)
  local bufnr = buflist[winnr]
  local hl = (isSelected and '%#TabLineSel#' or '%#TabLine#')

  local name = vim.fn.bufname(bufnr)
  if name == '' then
    name = '[No Name]'
  end

  local modified = vim.fn.getbufvar(bufnr, '&modified') == 1 and '[+] ' or ''

  return hl .. '%' .. i .. 'T' .. ' ' .. name .. modified .. ' '
end
function TabLine()
  local line = ''
  for i = 1, vim.fn.tabpagenr('$'), 1 do
    line = line .. TabLineCell(i)
  end
  line = line .. '%#TabLineFill#%='
  return line
end
vim.opt.tabline = '%!v:lua.TabLine()'




vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.scl = 'no'
vim.opt.laststatus = 3
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.equalalways = false
--vim.o.termguicolors = true

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3

vim.diagnostic.config({ virtual_text = false })



vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>d', '',
  { callback = vim.diagnostic.goto_next })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-q>s', '',
  { callback = vim.diagnostic.goto_prev })

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
