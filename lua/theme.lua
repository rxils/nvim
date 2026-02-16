local set_colors = function (dark)
  local vim = vim

  local red             = 1 + dark * 8
  local green           = 2 + dark * 8
  local yellow          = 3 + dark * 8
  local blue            = 4 + dark * 8
  local magenta         = 5 + dark * 8
  local cyan            = 6 + dark * 8

  local black = 232
  local white = 255

  local bg              = 'none'
  local fg              = dark == 1 and white or black
  local fg_r            = dark == 1 and black or white
  local gray_comment    = dark == 1 and 240 or 250
  local gray_linenr     = dark == 1 and 238 or 252
  local gray_float      = dark == 1 and 237 or 253
  local gray_cursorline = dark == 1 and 236 or 254

  return {
    red = red,
    green = green,
    yellow = yellow,
    blue = blue,
    magenta = magenta,
    cyan = cyan,

    black = black,
    white = white,

    bg = bg,
    fg = fg,
    fg_r = fg_r,
    gray_comment = gray_comment,
    gray_linenr = gray_linenr,
    gray_float = gray_float,
    gray_cursorline = gray_cursorline
  }
end




local set_theme = function (dark)
  local vim = vim

  if dark == 1 then
    vim.cmd[[set background=dark]]
  else
    vim.cmd[[set background=light]]
  end

  vim.cmd[[highlight clear]]
  vim.cmd[[set notermguicolors]]

  local c = set_colors(dark)

  local comment = { ctermfg = c.gray_comment }
  vim.api.nvim_set_hl(0, 'Normal',     { ctermbg = c.bg, ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'Title',      { ctermfg = c.fg, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'Comment',    comment)
  vim.api.nvim_set_hl(0, 'Conceal',    comment)
  vim.api.nvim_set_hl(0, 'Whitespace', comment)
  vim.api.nvim_set_hl(0, 'NonText',    comment)

  local cursorline = { ctermbg = c.gray_cursorline }
  vim.api.nvim_set_hl(0, 'CursorLine',   cursorline)
  vim.api.nvim_set_hl(0, 'CursorColumn', cursorline)
  vim.api.nvim_set_hl(0, 'ColorColumn',  { ctermbg = c.gray_cursorline, cterm = { reverse = false } })

  local linenr = { ctermfg = c.gray_linenr }
  vim.api.nvim_set_hl(0, 'LineNr',         linenr)
  vim.api.nvim_set_hl(0, 'LineNrAbove',    linenr)
  vim.api.nvim_set_hl(0, 'LineNrBelow',    linenr)
  vim.api.nvim_set_hl(0, 'CursorLineFold', linenr)
  vim.api.nvim_set_hl(0, 'CursorLineSign', linenr)
  vim.api.nvim_set_hl(0, 'EndOfBuffer',    linenr)
  vim.api.nvim_set_hl(0, 'CursorLineNr',   { ctermfg = c.fg, cterm = { bold = true } })

  local cursor = { cterm = { reverse = false } }
  vim.api.nvim_set_hl(0, 'Cursor',       cursor)
  vim.api.nvim_set_hl(0, 'TermCursor',   cursor)
  vim.api.nvim_set_hl(0, 'TermCursorNC', { ctermbg = c.gray_linenr, ctermfg = c.fg_r, cterm = { reverse = false } })
  vim.api.nvim_set_hl(0, 'lCursor',      cursor)

  vim.api.nvim_set_hl(0, 'CurSearch', { ctermbg = c.magenta, ctermfg = c.white, cterm = { bold = true, italic = true } })
  vim.api.nvim_set_hl(0, 'Search',    { ctermbg = c.blue, ctermfg = c.white, cterm = { italic = true } })

  vim.api.nvim_set_hl(0, 'Visual',     { ctermbg = c.green, ctermfg = c.fg_r })
  vim.api.nvim_set_hl(0, 'VisualNOS',  { ctermbg = c.fg, ctermfg = c.fg_r })
  vim.api.nvim_set_hl(0, 'MatchParen', { ctermbg = c.blue, ctermfg = c.white, cterm = { italic = true } })

  vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = c.gray_float, ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'FloatTitle',  { ctermfg = c.fg, cterm = { bold = true} })
  vim.api.nvim_set_hl(0, 'Pmenu',       { ctermbg = c.gray_float, ctermfg = c.fg, cterm = { reverse = false } })
  vim.api.nvim_set_hl(0, 'PmenuSel',    { ctermbg = c.green, ctermfg = c.fg_r, cterm = { reverse = false } })
  vim.api.nvim_set_hl(0, 'PmenuThumb',  { ctermfg = c.gray_linenr })

  vim.api.nvim_set_hl(0, 'StatusLine',   { ctermbg = c.fg, ctermfg = c.fg_r, cterm = { reverse = false } })
  vim.api.nvim_set_hl(0, 'StatusLineNC', { ctermbg = c.gray_float, ctermfg = c.fg, cterm = { reverse = false } })
  vim.api.nvim_set_hl(0, 'TabLine',      { ctermbg = 'none', ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'TabLineSel',   { ctermbg = 'none', ctermfg = c.green, cterm = { bold = true } })

  vim.api.nvim_set_hl(0, 'WinBar',   { ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'WinBarNC', { ctermfg = c.fg })

  local msg = { ctermfg = c.green }
  vim.api.nvim_set_hl(0, 'ModeMsg',      msg)
  vim.api.nvim_set_hl(0, 'MoreMsg',      msg)
  vim.api.nvim_set_hl(0, 'Question',     msg)
  vim.api.nvim_set_hl(0, 'QuickFixLine', msg)
  vim.api.nvim_set_hl(0, 'WildMenu',     { ctermbg = c.green, ctermfg = c.fg_r })

  vim.api.nvim_set_hl(0, 'Winseparator', { ctermfg = c.fg })

  local folded = { ctermfg = c.gray_linenr }
  vim.api.nvim_set_hl(0, 'Folded',     folded)
  vim.api.nvim_set_hl(0, 'FoldColumn', folded)
  vim.api.nvim_set_hl(0, 'SignColumn', folded)

  local special = { ctermfg = c.fg, cterm = { italic = true, underline = true } }
  vim.api.nvim_set_hl(0, 'SpecialKey',   special)
  vim.api.nvim_set_hl(0, 'SpecialBad',   special)
  vim.api.nvim_set_hl(0, 'SpecialCap',   special)
  vim.api.nvim_set_hl(0, 'SpecialLocal', special)
  vim.api.nvim_set_hl(0, 'SpecialRare',  special)

  vim.api.nvim_set_hl(0, 'Directory', { ctermfg = c.cyan })

  vim.api.nvim_set_hl(0, 'DiffAdd',    { ctermbg = c.green, ctermfg = c.fg_r, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'DiffChange', { ctermfg = c.yellow, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'DiffDelete', { ctermfg = c.red, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'DiffText',   { ctermbg = c.yellow, ctermfg = c.fg_r, cterm = { italic = true } })

  local warning = { ctermfg = c.yellow, cterm = { bold = true } }
  local error = { ctermfg = c.red, cterm = { bold = true } }
  vim.api.nvim_set_hl(0, 'WarningMsg', warning)
  vim.api.nvim_set_hl(0, 'ErrorMsg',   error)

  vim.api.nvim_set_hl(0, 'RedrawDebugClear',     { ctermbg = c.yellow, ctermfg  = c.fg_r })
  vim.api.nvim_set_hl(0, 'RedrawDebugComposed',  { ctermbg = c.green, ctermfg  = c.fg_r })
  vim.api.nvim_set_hl(0, 'RedrawDebugRecompose', { ctermbg = c.red, ctermfg = c.fg_r })
  vim.api.nvim_set_hl(0, 'RedrawDebugError',     { ctermbg = c.red, ctermfg = c.red })


  local constant = { ctermfg = c.yellow }
  vim.api.nvim_set_hl(0, 'Constant', constant)
  vim.api.nvim_set_hl(0, 'String',   constant)

  local identifier = { ctermfg = c.green }
  vim.api.nvim_set_hl(0, 'Identifier', identifier)
  vim.api.nvim_set_hl(0, 'Function',   identifier)

  local statement = { ctermfg = c.red }
  vim.api.nvim_set_hl(0, 'Statement', { ctermfg = c.red, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'Operator',  statement)
  vim.api.nvim_set_hl(0, 'Preproc',   statement)

  local type_ = { ctermfg = c.cyan }
  vim.api.nvim_set_hl(0, 'Type',    type_)
  vim.api.nvim_set_hl(0, 'Special', type_)

  vim.api.nvim_set_hl(0, 'Underlined', { ctermfg = c.fg, cterm = { underline = true } })
  vim.api.nvim_set_hl(0, 'Ignore',     { ctermfg = c.fg })
  vim.api.nvim_set_hl(0, 'Error',      error)
  vim.api.nvim_set_hl(0, 'Todo',       { ctermfg = c.fg, cterm = { bold = true } })


  vim.api.nvim_set_hl(0, 'DiagnosticError', { ctermfg = c.red, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticWarn',  { ctermfg = c.yellow, cterm = { bold = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticInfo',  { ctermfg = c.fg, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticHint',  { ctermfg = c.cyan, cterm = { italic = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticOk',    { ctermfg = c.green })

  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { ctermfg = c.red, cterm = { bold = true, italic = true, underline = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn',  { ctermfg = c.yellow, cterm = { bold = true, italic = true, underline = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo',  { ctermfg = c.fg, cterm = { italic = true, underline = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint',  { ctermfg = c.cyan, cterm = { italic = true, underline = true } })
  vim.api.nvim_set_hl(0, 'DiagnosticUnderlineOk',    { ctermfg = c.green })
end




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
      }
    },
    scope = {
      enabled = false,
    }
  })

  vim.api.nvim_set_hl(0, 'RainbowRed',    { ctermfg = c.red })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { ctermfg = c.yellow })
  vim.api.nvim_set_hl(0, 'RainbowGreen',  { ctermfg = c.green })

  vim.api.nvim_set_hl(0, 'NvimTreeWindowPicker', { ctermbg = c.blue, ctermfg = c.white })
end




return {
  set_colors = set_colors,
  set_theme = set_theme,
  set_plugins = set_plugins
}
