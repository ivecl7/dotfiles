return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		opts = {
			transparent_background = true,
			flavour = "mocha",
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				cmp = true,
				notify = true,
				gitsigns = true,
				neotree = true,
				which_key = true,
				illuminate = {
					enabled = true,
					lsp = true,
				},
				navic = {
					enabled = true,
					custom_bg = "NONE",
				},
				treesitter = true,
				telescope = {
					enabled = true,
				},
				indent_blankline = {
					enabled = true,
					scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
					colored_indent_levels = false,
				},
				mini = {
					enabled = true,
					indentscope_color = "rosewater",
				},
				bufferline = true,
				vimwiki = true,
			},
		},
		config = function()
			vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
