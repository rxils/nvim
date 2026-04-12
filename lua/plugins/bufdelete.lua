return {
  'famiu/bufdelete.nvim',

  config = function ()
    vim.cmd('cnoreabbrev bdd bd')
    vim.cmd('cnoreabbrev bd Bd')
    vim.cmd('cnoreabbrev bww bw')
    vim.cmd('cnoreabbrev bw Bw')
  end
}
