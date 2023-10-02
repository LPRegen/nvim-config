return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
    },
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
