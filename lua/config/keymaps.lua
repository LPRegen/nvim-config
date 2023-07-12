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
