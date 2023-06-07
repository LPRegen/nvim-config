return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Neorg",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {
					config = {
						folds = false,
						icon_preset = "diamond",
						icons = {
							todo = {
								uncertain = {
									icon = "",
								},
								urgent = {
									icon = "",
								},
							},
						},
					},
				}, -- Adds pretty icons to your documents
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							notes = "~/dev/personalNotes/Neorg",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,
	keys = {
		{ "<leader>ni", "<cmd>Neorg index<cr>", desc = "Index" },
		{ "<leader>nt", "<cmd>Neorg journal today<cr>", desc = "Today's journal" },
		{ "<leader>nT", "<cmd>Neorg journal tomorrow<cr>", desc = "Tomorrow's journal" },
		{ "<leader>ny", "<cmd>Neorg journal yesterday<cr>", desc = "Yesterday's journal" },
	},
}
