return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'hrsh7th/cmp-path'
  },

  config = function ()
    local cmp = require('cmp')

    local cmp_f = function(f)
      return function(fallback)
        if cmp.visible() then
          f()
        else
          fallback()
        end
      end
    end

    cmp.setup({
      snippet = {
        expand = function (args)
          vim.snippet.expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_f(cmp.mapping.select_next_item()),
        ['<S-Tab>'] = cmp_f(cmp.mapping.select_prev_item()),
        ['<C-q>'] = cmp_f(cmp.mapping.abort()),
        ['<CR>'] = cmp_f(cmp.mapping.confirm({ select = true })),
        ['<C-j>'] = cmp_f(cmp.mapping.scroll_docs(4)),
        ['<C-k>'] = cmp_f(cmp.mapping.scroll_docs(-4))
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' }
      }
    })
  end
}
