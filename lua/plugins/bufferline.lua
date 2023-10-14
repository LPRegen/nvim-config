return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        groups = {
          options = {
            toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          },
          items = {
            {
              name = "Ng",
              highlight = { undercurl = false, sp = "orange" },
              auto_close = false,
              matcher = function(buf)
                -- NOTE: group buffers by path
                return vim.fn.expand(vim.api.nvim_buf_get_name(buf.id) .. ":p:h"):match("/zk")
                -- NOTE: group buffers by extension
                -- return vim.api.nvim_buf_get_name(buf.id):match("%.md")
              end,
              -- separator = { -- Optional
              --   style = require("bufferline.groups").separator.tab,
              -- },
            },
          },
        },
      },
    },
  },
}
