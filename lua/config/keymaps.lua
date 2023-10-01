-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- lazy
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Launch Lazy" })
map("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Lazy sync" })

map({ "v", "n" }, ";", ":", { silent = false, desc = "Command mode" })

-- Delete backwards
map("n", "dw", 'vb"_d', { nowait = true, silent = true, desc = "Delete backwards" })

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- save file
map({ "v", "n", "s" }, "<leader>a", "<cmd>w<cr><esc>", { desc = "Save file" })
