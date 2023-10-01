return {
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
          ["h"] = "close_node",
          ["l"] = "open",
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
        "<leader>e",
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
}
