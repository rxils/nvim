require("nvim-tree").setup({
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
        symlink = " ",
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
          symlink = " ",
        },
      }
    }
  }
})
