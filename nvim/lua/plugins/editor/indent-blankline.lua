return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		require("ibl").setup({
			debounce = 200,
			viewport_buffer = {
				min = 30,
				max = 500,
			},
			indent = {
				char = "▏",
				smart_indent_cap = true,
				repeat_linebreak = false,
				priority = 1,
			},

			whitespace = {
				highlight = { "Whitespace", "NonText", "Function", "Label" },
				remove_blankline_trail = false,
			},

			scope = {
				enabled = false,
				show_start = false,
				show_end = false,
				show_exact_scope = false,
				injected_languages = true,
				priority = 1024,
			},

			exclude = {
				filetypes = {
					"lspinfo",
					"packer",
					"checkhealth",
					"help",
					"man",
					"gitcommit",
					"TelescopePrompt",
					"TelescopeResults",
					"''",
				},
				buftypes = {
					"terminal",
					"nofile",
					"quickfix",
					"prompt",
				},
			},
		})
	end,
}
