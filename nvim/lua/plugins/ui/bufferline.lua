return {
	"akinsho/bufferline.nvim",
	lazy = false,
	priority = 1000,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			mode = "buffers",
			close_icon = " ",
			buffer_close_icon = "󰱝 ",
			modified_icon = "󰔯 ",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
	keys = {
		{ "]b", "<cmd>BufferLineCycleNext<cr>", "n", { desc = "Cycle to next buffer" } },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", "n", { desc = "Cycle to previous buffer" } },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", "n", { desc = "Cycle to next buffer" } },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", "n", { desc = "Cycle to previous buffer" } },
		{ "<leader>bd", "<cmd>bdelete<cr>", "n", { desc = "Delete buffer" } },
		{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", "n", { desc = "Delete buffers to the left" } },
		{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", "n", { desc = "Delete other buffers" } },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", "n", { desc = "Toggle pin" } },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", "n", { desc = "Delete non-pinned buffers" } },
	},
}
