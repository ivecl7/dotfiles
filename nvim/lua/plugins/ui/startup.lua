return {
	"startup-nvim/startup.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		require("startup").setup({
			header = {
				type = "text",
				align = "center",
				margin = 5,
				content = {
					" ██████╗░███████╗░█████╗░░█████╗░██████╗░████████╗░░░████████╗███████╗░█████╗░██╗░░██╗",
					" ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝░░░╚══██╔══╝██╔════╝██╔══██╗██║░░██║",
					" ██║░░██║█████╗░░██║░░╚═╝██║░░██║██████╔╝░░░██║░░░░░░░░░██║░░░█████╗░░██║░░╚═╝███████║",
					" ██║░░██║██╔══╝░░██║░░██╗██║░░██║██╔══██╗░░░██║░░░░░░░░░██║░░░██╔══╝░░██║░░██╗██╔══██║",
					" ██████╔╝███████╗╚█████╔╝╚█████╔╝██║░░██║░░░██║░░░██╗░░░██║░░░███████╗╚█████╔╝██║░░██║",
					" ╚═════╝░╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░╚═╝░░░╚══════╝░╚════╝░╚═╝░░╚═╝",
				},
				highlight = "Statement",
			},
			body = {
				type = "mapping",
				align = "center",
				margin = 5,
				content = {
					{ " Find File", "Telescope find_files", "ff" },
					{ "󰍉 Find Word", "Telescope live_grep", "fr" },
					{ " Recent Files", "Telescope oldfiles", "fg" },
					{ " File Browser", "Telescope file_browser", "fe" },
					{ "󰧑 SecondBrain", "VimwikiIndex", "ww" },
				},
				highlight = "string",
			},

			parts = { "header", "body" },
		})
	end,
}
