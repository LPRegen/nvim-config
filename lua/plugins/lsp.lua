return {
  -- LSPconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- By adding the server, will be automatically installed by Mason.
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

        -- Python
        pyright = {},

        -- JS/TS
        html = {},
        cssmodules_ls = {},
        cssls = {},
        tailwindcss = {},
      },
    },
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
      },
    },
  },
}
