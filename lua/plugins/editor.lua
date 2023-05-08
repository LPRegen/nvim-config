return {
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			window = {
				position = "right",
				mappings = {
					["<space>"] = "none",
					["h"] = "close_node",
					["l"] = "open",
				},
			},
		},
		keys = {
			{
				"<leader>e",
				"<cmd>Neotree toggle<CR>",
				desc = "Open Neotree",
			},
		},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		keys = {
			{ "<leader>fw", "<cmd>Telescope live_grep<CR>", "Live grep" },
		},
	},

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["<leader>g"] = { name = "+ git" },
				["<leader><tab>"] = { name = "+ tabs" },
				["<leader>d"] = { name = "+ dap" },
				["<leader>c"] = { name = "+ code" },
				["<leader>b"] = { name = "+ buffer" },
				["<leader>f"] = { name = "+ find" },
				["<leader>q"] = { name = "+ session" },
				["<leader>x"] = { name = "+ trouble" },
				["<leader>l"] = { name = "+ lazy" },
				["<leader>h"] = { name = "+ hop" },
				["<leader>s"] = { name = "+ todo" },
			},
		},

		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},

	-- Git signs
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end
				map("n", "]c", gs.next_hunk, "Next Hunk")
				map("n", "[c", gs.prev_hunk, "Prev Hunk")
				map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>ghb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
				map("n", "<leader>ghd", gs.diffthis, "Diff This")
				map("n", "<leader>ghD", function()
					gs.diffthis("~")
				end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},

	-- references
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)

			local function map(key, dir, buffer)
				vim.keymap.set("n", key, function()
					require("illuminate")["goto_" .. dir .. "_reference"](false)
				end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
			end

			map("]]", "next")
			map("[[", "prev")

			-- also set it after loading ftplugins, since a lot overwrite [[ and ]]
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local buffer = vim.api.nvim_get_current_buf()
					map("]]", "next", buffer)
					map("[[", "prev", buffer)
				end,
			})
		end,
		keys = {
			{ "]]", desc = "Next Reference" },
			{ "[[", desc = "Prev Reference" },
		},
	},

	--buffer remove

	{
		"echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      {
        "<leader>bd",
        function() require("mini.bufremove").delete(0, false) end,
        { desc = "Delete Buffer" },
      },
      {
          "<leader>bD",
          function() require("mini.bufremove").delete(0, true) end,
          { desc = "Delete Buffer (Force)"}
        },
    },
	},

	-- better diagnostics, lists and others.
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
			{ "<leader>xL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprev()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},

	-- todo comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
    -- stylua: ignore
    keys = {
      { "]t",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>",    desc = "Todo/Fix/Fixme" },
    },
	},

	-- better escape
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
		event = "InsertEnter",
	},

	-- find and replace
	{
		"nvim-pack/nvim-spectre",
  -- stylua: ignore
    keys = {
     { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
	},

	-- motion
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		lazy = "VeryLazy",
		event = "BufRead",
		keys = {
			{ "<leader>hw", "<cmd>HopWord<cr>", desc = "Search word" },
			{ "<leader>hl", "<cmd>HopLineStart<cr>", desc = "Go to line start" },
			{ "<leader>hc", "<cmd>HopChar2<cr>", desc = "Go to characters" },
		},
	},
}
