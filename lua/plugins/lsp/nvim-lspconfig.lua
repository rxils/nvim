return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp'
  },

  config = function ()
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

    lsp_setup('clangd', {})

    lsp_setup('r_language_server', {})

    lsp_setup('julials', {})

    lsp_setup('jdtls', {})

    --lsp_setup('kotlin_lsp', {})

    vim.o.updatetime = 100
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function (args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method('textDocument/documentHighlight') then
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            callback = function ()
              pcall(vim.lsp.buf.document_highlight)
            end
          })
          vim.api.nvim_create_autocmd('CursorMoved', {
            buffer = args.buf,
            callback = function ()
              pcall(vim.lsp.buf.clear_references)
            end
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      once = true,
      callback = function ()
        vim.cmd[[hi! LspReferenceText cterm=bold,underline]]
        vim.cmd[[hi! LspReferenceRead cterm=bold,underline]]
        vim.cmd[[hi! LspReferenceWrite cterm=bold,underline]]
      end
    })

    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function ()
        for _, client in ipairs(vim.lsp.get_clients()) do
          client:stop(true)
        end
      end
    })

    vim.keymap.set({ 'n', 'i', 'v' }, '<C-p>', '',
      { callback = function ()
        vim.lsp.buf.hover()
      end })
  end
}
