return {
  -- better escape
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
    event = "InsertEnter",
  },

  -- Neo scroll
  {
    "karb94/neoscroll.nvim",
    -- lazy = "VeryLazy",
    config = function()
      require("neoscroll").setup()
    end,
    event = "BufRead",
  },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "right",
        mappings = {
          ["<space>"] = "none",
          ["n"] = "close_node",
          ["o"] = "open",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            modified = "",
            deleted = " ",
            unstaged = " ",
            untracked = " ",
          },
        },
      },
    },
    keys = {
      {
        "<leader>n",
        "<cmd>Neotree toggle<CR>",
        desc = "Open Neotree",
      },
      {
        "<leader>gn",
        "<cmd>Neotree float git_status<CR>",
        desc = "Neotree status",
      },
    },
  },

  -- comments
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = "<leader>/",
        comment_line = "<leader>/",
        textobject = "",
      },
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "InsertEnter",
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
  },
}
