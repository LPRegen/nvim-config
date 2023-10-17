return {
  -- NOTE: https://github.com/nvim-neorg/neorg
  -- https://github.com/nvim-neorg/neorg/wiki

  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  cmd = "Neorg",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default modules
        ["core.concealer"] = {
          config = {
            folds = true,
            icon_preset = "diamond",
            icons = {
              todo = {
                uncertain = {
                  icon = "",
                },
                urgent = {
                  icon = "",
                },
              },
            },
          },
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.summary"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/dev/zk/",
            },
            default_workspace = "notes",
          },
        },
        ["core.export"] = {
          config = {
            export_dir = "~/dev/mdExported",
          },
        },
        ["core.integrations.treesitter"] = {},
        ["core.integrations.telescope"] = {},
      },
    })
  end,
  keys = {
    { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
    { "<leader>nw", "<cmd>Neorg workspace<cr>", desc = "Index" },
    { "<leader>nt", "<cmd>Neorg journal today<cr>", desc = "Today's journal" },
    { "<leader>nT", "<cmd>Neorg journal tomorrow<cr>", desc = "Tomorrow's journal" },
    { "<leader>ny", "<cmd>Neorg journal yesterday<cr>", desc = "Yesterday's journal" },
    { "<leader>nl", "<cmd>Telescope neorg insert_file_link<cr>", desc = "Insert link to file" },
    { "<leader>ns", "<cmd>Telescope neorg find_norg_files<cr>", desc = "Search files" },
  },
}
