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
		{ "<leader>Ni", "<cmd>Neorg index<cr>", desc = "Index" },
		{ "<leader>Nt", "<cmd>Neorg journal today<cr>", desc = "Today's journal" },
	},
}
