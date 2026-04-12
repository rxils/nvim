return {
  'nvim-tree/nvim-tree.lua',

  opts = {
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = false,
          git = true,
          modified = false,
          hidden = false,
          diagnostics = false,
          bookmarks = false
        },
        glyphs = {
          default = " ",
          symlink = "@",
          git = {
            unstaged = "?",
            staged = "O",
            unmerged = "M",
            renamed = "R",
            deleted = "D",
            untracked = "-",
            ignored = "X"
          },
          folder = {
            default = " ",
            open = " ",
            empty = " ",
            empty_open = " ",
            symlink = "@",
          },
        }
      }
    }
  },

  config = function (_, opts)
    require('nvim-tree').setup(opts)

    vim.keymap.set({ 'n', 'i', 'v' }, '<C-s>', '<Esc>:NvimTreeToggle<CR>')
  end,
}
