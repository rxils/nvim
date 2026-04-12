return {
  'nvim-tree/nvim-tree.lua',

  opts = {
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
  end
}
