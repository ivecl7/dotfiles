return {
	"akinsho/toggleterm.nvim",
	keys = {
		{
			"<leader>tv",
			"<cmd>ToggleTerm direction=vertical<cr>",
			"n",
			desc = "Toggle Vertical Terminal Window",
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm direction=horizontal<cr>",
			"n",
			desc = "Toggle Horizontal Terminal Window",
		},
		{
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<cr>",
			"n",
			desc = "Toggle Floating Terminal Window",
		},
	},
	opts = {
		size = function(term)
			if term.direction == "horizontal" then
				return 20
			elseif term.direction == "vertical" then
				return vim.o.columns * 0.4
			end
		end,
		open_mapping = [[<c-\>]],
		insert_mappings = true,
		persist_mode = true,
	},
}
