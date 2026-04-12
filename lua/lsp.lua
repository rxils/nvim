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

lsp_setup('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true)
      }
    }
  }
})

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
