return {
  'nvim-tree/nvim-tree.lua',

  opts = {
    view = { adaptive_size = true },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        git_placement = "signcolumn",
        show = {
          file = false,
          folder = false,
          folder_arrow = false,
          git = true,
          modified = false,
          hidden = false,
          diagnostics = false,
          bookmarks = false
        },
        glyphs = {
          git = {
            unstaged = "?",
            staged = "O",
            unmerged = "M",
            renamed = "R",
            deleted = "D",
            untracked = "-",
            ignored = "X"
          }
        }
      }
    }
  },

  config = function (_, opts)
    require('nvim-tree').setup(opts)

    vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:NvimTreeToggle<CR>')

    vim.api.nvim_create_user_command('E', function (opts_)
      local path = opts_.args ~= "" and opts_.args or vim.fn.getcwd()
      vim.api.nvim_cmd({ cmd = "NvimTreeOpen", args = { path }}, {})
    end, {
      nargs = '?',
      complete = 'dir'
    })
  end
}
