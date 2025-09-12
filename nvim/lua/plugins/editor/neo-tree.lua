return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", "n", { desc = "Open/Close Neotree" } },
	},
	opts = {
		indent = {
			withExpanders = true,
			expanderCollapsed = "󰅂",
			expanderExpanded = "󰅀",
			expanderHighlight = "NeoTreeExpander",
		},
		gitStatus = {
			symbols = {
				added = " ",
				conflict = "󰩌 ",
				deleted = "󱂥",
				ignored = " ",
				modified = " ",
				renamed = "󰑕",
				staged = "󰩍",
				unstaged = "",
				untracked = " ",
			},
		},
	},
}
