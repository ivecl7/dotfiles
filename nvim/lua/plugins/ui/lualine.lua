return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			globalstatus = true,
			extensions = {
				"fzf",
				"neo-tree",
			},
			disabledFiletypes = {
				statusline = {
					"startup",
					"alpha",
				},
			},
			theme = "catppuccin",
			component_separators = "",
			section_separators = "",
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icon = "",
				},
			},
			lualine_b = {
				{
					"branch",
					icon = "",
				},
				{
					"diff",
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
				},
			},
			lualine_c = {
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					symbols = {
						error = " ",
						warn = " ",
						info = " ",
						hint = "󰝶 ",
					},
				},
				{
					"navic",
				},
			},
			lualine_x = {
				{
					"filetype",
					icon_only = true,
					separator = "",
					padding = {
						left = 1,
						right = 0,
					},
				},
				{
					"filename",
					path = 1,
				},
				{
					function()
						local icon = " "
						local status = require("copilot.api").status.data
						return icon .. (status.message or " ")
					end,

					cond = function()
						local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
						return ok and #clients > 0
					end,
				},
			},
			lualine_y = {
				{
					"progress",
				},
			},
			lualine_z = {
				{
					"location",
				},
			},
		},
	},
}
