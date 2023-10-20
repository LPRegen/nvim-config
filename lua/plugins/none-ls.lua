return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {

        -- NOTE: sources
        -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

        -- Fish
        nls.builtins.formatting.fish_indent,
        nls.builtins.diagnostics.fish,

        -- Lua
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.shfmt,

        nls.builtins.formatting.prettierd,

        -- Django
        nls.builtins.formatting.djlint,
      },
    }
  end,
}
