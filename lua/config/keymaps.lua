local Util = require("lazyvim.util")

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

-- split buffer vertically
map("n", "<leader>bv", "<cmd>vert sb<cr>", { desc = "Split buffer vertically" })
-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- terminal
map("t", "<C-\\>", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- save file
map({ "v", "n", "s" }, "<leader>a", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Colemak
-- querty - Colemak
-- e        f
-- w        w
-- i        u
-- y        j
-- better up/down
map({ "n", "x" }, "e", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "i", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-n>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-e>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-i>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-o>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Move Lines
map("n", "<A-e>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-i>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-e>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-i>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-e>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-i>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

--TODO: configure bufferline

if require("lazy.core.config").spec.plugins["bufferline.nvim"] then
  map("n", "<S-n>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-o>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-n>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-o>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
