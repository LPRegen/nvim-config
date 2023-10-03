return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = "markdown",
  lazy = true,
  keys = { { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Md preview toggle" } },
  config = function()
    vim.g.mkdp_auto_close = true
    vim.g.mkdp_open_to_the_world = false
    vim.g.mkdp_open_ip = "127.0.0.1"
    vim.g.mkdp_port = "8888"
    vim.g.mkdp_browser = ""
    vim.g.mkdp_echo_preview_url = true
    vim.g.mkdp_page_title = "${name}"
  end,
}
