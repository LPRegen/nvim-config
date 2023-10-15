return {
  {
    -- NOTE: https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        groups = {
          options = {
            toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
          },
          items = {
            {
              name = " ",
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

        -- Disable buffer icons
        -- show_buffer_icons = true,
        -- Removes file extension if present, otherwise returns filename
        name_formatter = function(buf)
          if buf.name:find("%.") then
            return buf.name:match("(.+)%..+$")
          else
            return buf.name
          end
        end,
      },
    },
    keys = {
      { "<leader>bg", "<cmd>BufferLineGroupToggle _<cr>", desc = "Index" },
    },
  },
}
