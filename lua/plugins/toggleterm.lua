return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
    },
    open_mapping = [[<c-\>]],
  },
  cmd = "ToggleTerm",
  keys = {
    {
      "<C-\\>",
      "<cmd>ToggleTerm<cr>",
      desc = "Toggle terminal",
    },
  },
}
