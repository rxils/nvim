local set_colors = require('theme.set_colors')

local set_plugins = function (dark)
  local vim = vim
  local c = set_colors(dark)

  local line = function (color_a)
  return {
      a = { bg = color_a, fg = c.fg_r, gui = 'bold' },
      b = { bg = c.gray_comment, fg = c.fg },
      c = { bg = c.gray_float, fg = c.fg }
    }
  end

  vim.api.nvim_set_hl(0, 'LualineError', { ctermbg = c.gray_comment, ctermfg = c.red })
  vim.api.nvim_set_hl(0, 'LualineWarn',  { ctermbg = c.gray_comment, ctermfg = c.yellow })
  vim.api.nvim_set_hl(0, 'LualineInfo',  { ctermbg = c.gray_comment, ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'LualineHint',  { ctermbg = c.gray_comment, ctermfg = c.cyan })

  require('lualine').setup({
		options = {
			icons_enabled = false,
			theme = {
				normal = line(c.green),
				insert = line(c.yellow),
				visual = line(c.green),
				replace = line(c.yellow),
				command = line(c.red),
				inactive = line(c.gray_float),
				terminal = line(c.cyan)
			},
			component_separators = { left = ' ', right = ' ' },
			section_separators = { left = '', right = '' },
			globalstatus = true,
			--always_divide_middle = false
		},
		sections = {
			lualine_b = {
				'branch',
				--'diff'
			},
			lualine_c = {{
				'filename',
				file_status = true,
				path = 2
			}},
			lualine_x = {
				'filetype'
			},
			lualine_y = {{
				'diagnostics',
				diagnostics_color = {
          error = 'LualineError',
          warn  = 'LualineWarn',
          info  = 'LualineInfo',
          hint  = 'LualineHint'
        },
        update_in_insert = true,
			}},
			lualine_z = {
				'location'
			}
		}
	})

  vim.api.nvim_set_hl(0, 'BlankLine', { ctermfg = c.gray_linenr })
  require('ibl').setup({
    indent = {
      highlight = {
        'BlankLine'
      },
      char = '│'
    },
    scope = {
      enabled = false,
    }
  })

  vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { ctermfg = c.gray_linenr })

  vim.api.nvim_set_hl(0, 'RainbowRed',    { ctermfg = c.red })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { ctermfg = c.yellow })
  vim.api.nvim_set_hl(0, 'RainbowGreen',  { ctermfg = c.green })

  vim.api.nvim_set_hl(0, 'NvimTreeWindowPicker', { ctermbg = c.blue, ctermfg = c.white })
end

return set_plugins
