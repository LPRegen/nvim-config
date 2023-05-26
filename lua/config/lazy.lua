local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.extras.lang.typescript" },
		{ import = "plugins.extras.lang.markdown" },
	},
	defaults = {
		lazy = true,
		version = false,
	},
	checker = {
		enabled = true,
	},
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
