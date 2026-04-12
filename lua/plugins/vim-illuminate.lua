return {
  'RRethy/vim-illuminate',

  config = function ()
    vim.cmd('hi def IlluminatedWordText gui=bold,underline')
    vim.cmd('hi def IlluminatedWordRead gui=bold,underline')
    vim.cmd('hi def IlluminatedWordWrite gui=bold,underline')
  end
}
