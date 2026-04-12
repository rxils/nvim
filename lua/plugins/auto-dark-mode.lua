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
