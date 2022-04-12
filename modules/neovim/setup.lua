require'lualine'.setup()
require'nvim-tree'.setup {
  filters = { dotfiles = true, },
  hijack_unnamed_buffer_when_opening = false,
}
require'bufferline'.setup {
  options = {
    --mode = 'tabs',
    numbers = 'buffer_id',
    always_show_bufferline = false,
    --sort_by = 'tabs';
  }
}
