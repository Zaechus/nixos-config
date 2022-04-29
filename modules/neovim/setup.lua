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
require'toggleterm'.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.25
    end
  end,

  open_mapping = [[<c-\>]],
  insert_mappings = true,
  terminal_mappings = true,

  shade_terminals = false,
}
require'colorizer'.setup({'*'}, {
  names = false,
})
