local set_colors = function (dark)
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

return set_colors
