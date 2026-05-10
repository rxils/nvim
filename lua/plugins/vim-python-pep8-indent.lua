return {
  'Vimjas/vim-python-pep8-indent',

  ft = 'python',

  init = function ()
    vim.g.python_pep8_indent_hang_closing = 0
  end
}
