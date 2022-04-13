require'lualine'.setup()
require'nvim-tree'.setup {
  filters = { dotfiles = true, },
  hijack_unnamed_buffer_when_opening = false,
}
require'bufferline'.setup {
  options = {
    numbers = 'buffer_id',
    always_show_bufferline = false,
  }
}
