return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      autotag = {
        enable = true,
      },
      dependencies = {
        {
          "windwp/nvim-ts-autotag",
        },
      },
    },
  },

  -- Auto tag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    event = "BufEnter",
  },
}
