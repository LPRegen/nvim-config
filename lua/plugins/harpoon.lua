return {
  -- NOTE: https://github.com/ThePrimeagen/harpoon

  "ThePrimeagen/harpoon",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon a file" },
    { "<leader>hs", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },

    -- Navigate to files directly
    { "<A-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to mark 1" },
    { "<A-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to mark 2" },
    { "<A-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to mark 3" },
  },
}
