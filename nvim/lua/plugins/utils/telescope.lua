return {
	{
		"nvim-telescope/telescope.nvim",
		version = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>sd",
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				"n",
				desc = "Document diagnostics",
			},
			{
				"<leader><space>",
				function()
					require("telescope.builtin").find_files()
				end,
				"n",
				desc = "Find project files",
			},
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				"n",
				desc = "Grep (root dir)",
			},
			{
				"<leader>:",
				function()
					require("telescope.builtin").command_history()
				end,
				"n",
				desc = "Command History",
			},
			{
				"<leader>b",
				function()
					require("telescope.builtin").buffers()
				end,
				"n",
				desc = "+buffer",
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				"n",
				desc = "Find project files",
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").live_grep()
				end,
				"n",
				desc = "Find text",
			},
			{
				"<leader>fR",
				function()
					require("telescope.builtin").resume()
				end,
				"n",
				desc = "Resume",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").oldfiles()
				end,
				"n",
				desc = "Recent",
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").buffers()
				end,
				"n",
				desc = "Buffers",
			},
			{
				"<C-p>",
				function()
					require("telescope.builtin").git_files()
				end,
				"n",
				desc = "Search git files",
			},
			{
				"<leader>gc",
				function()
					require("telescope.builtin").git_commits()
				end,
				"n",
				desc = "Commits",
			},
			{
				"<leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				"n",
				desc = "Status",
			},
			{
				"<leader>sa",
				function()
					require("telescope.builtin").autocommands()
				end,
				"n",
				desc = "Auto Commands",
			},
			{
				"<leader>sb",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				"n",
				desc = "Buffer",
			},
			{
				"<leader>sc",
				function()
					require("telescope.builtin").command_history()
				end,
				"n",
				desc = "Command History",
			},
			{
				"<leader>sC",
				function()
					require("telescope.builtin").commands()
				end,
				"n",
				desc = "Commands",
			},
			{
				"<leader>sD",
				function()
					require("telescope.builtin").diagnostics()
				end,
				"n",
				desc = "Workspace diagnostics",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				"n",
				desc = "Help pages",
			},
			{
				"<leader>sH",
				function()
					require("telescope.builtin").highlights()
				end,
				"n",
				desc = "Search Highlight Groups",
			},
			{
				"<leader>sk",
				function()
					require("telescope.builtin").keymaps()
				end,
				"n",
				desc = "Keymaps",
			},
			{
				"<leader>sM",
				function()
					require("telescope.builtin").man_pages()
				end,
				"n",
				desc = "Man pages",
			},
			{
				"<leader>sm",
				function()
					require("telescope.builtin").marks()
				end,
				"n",
				desc = "Jump to Mark",
			},
			{
				"<leader>so",
				function()
					require("telescope.builtin").vim_options()
				end,
				"n",
				desc = "Options",
			},
			{
				"<leader>sR",
				function()
					require("telescope.builtin").resume()
				end,
				"n",
				desc = "Resume",
			},
			{
				"<leader>uC",
				function()
					require("telescope.builtin").colorscheme()
				end,
				"n",
				desc = "Colorscheme preview",
			},
		},
		opts = {
			defaults = {
				mappings = {
					i = {},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							-- your custom insert mode mappings
						},
						["n"] = {
							-- your custom normal mode mappings
						},
					},
				},
			},
		},
	},
}
