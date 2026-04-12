return {
  'HiPhish/rainbow-delimiters.nvim',

  config = function ()
    vim.g.rainbow_delimiters = { highlight = {
      "RainbowYellow",
      "RainbowRed",
      "RainbowGreen",
    }}
  end
}
