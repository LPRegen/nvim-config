return {
  -- LSPconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- By adding the server name, it will be automatically installed by Mason.
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

  -- Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- Python
          nls.builtins.diagnostics.mypy.with({
            extra_args = function()
              local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
              return { "--python-executable", virtual .. "/bin/python3" }
            end,
          }),
          nls.builtins.diagnostics.ruff,
          nls.builtins.formatting.black,

          -- TS / JSX
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "stylua",

        -- JS/TS
        "prettierd",

        -- Py
        "mypy",
        "ruff",
        "black"
      },
    },
  },
}
