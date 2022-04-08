require('lualine').setup()
require'nvim-tree'.setup {
  filters = { dotfiles = true, },
}
require("bufferline").setup {
  options = {
    --mode = "tabs",
    numbers = "buffer_id",
    always_show_bufferline = false,
  }
}
