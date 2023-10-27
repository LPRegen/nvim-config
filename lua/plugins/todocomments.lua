return {
  {
    -- INFO: https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        NTH = { icon = " ", color = "test" },
        TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
  },
}
