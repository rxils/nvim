local set_colors = require('theme.set_colors')

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

return set_theme
