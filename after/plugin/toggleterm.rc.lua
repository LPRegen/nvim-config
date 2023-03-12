local status, toggleterm = pcall(require, 'toggleterm')
if (not status) then return end

toggleterm.setup {
  direction = 'float',
  open_mapping = [[<c-\>]],
  float_opts = {
    border = 'single',
  },
}
