-- copilot-cmp is not good to use
-- return {
-- 	{
-- 		"zbirenbaum/copilot-cmp",
-- 		lazy = true,
-- 		event = "InsertEnter",
-- 		opts = {},
-- 		config = function(_, opts)
-- 			local copilot_cmp = require("copilot_cmp")
-- 			copilot_cmp.setup(opts)
-- 			-- attach cmp source whenever copilot attaches
-- 			-- fixes lazy-loading issues with the copilot cmp source
-- 			-- LazyVim.lsp.on_attach(function()
-- 			-- 	copilot_cmp._on_insert_enter({})
-- 			-- end, "copilot")
-- 		end,
-- 	},
-- 	{
-- 		"zbirenbaum/copilot.lua",
-- 		cmd = "Copilot",
-- 		build = ":Copilot auth",
-- 		event = "BufReadPost",
-- 		opts = {
-- 			suggestion = {
-- 				enabled = not vim.g.ai_cmp,
-- 				auto_trigger = true,
-- 				hide_during_completion = vim.g.ai_cmp,
-- 				keymap = {
-- 					next = "<M-]>",
-- 					prev = "<M-[>",
-- 				},
-- 			},
-- 			panel = { enabled = false },
-- 			filetypes = {
-- 				markdown = true,
-- 				help = true,
-- 			},
-- 		},
-- 	},
-- }
return {
	"github/copilot.vim",
	lazy = false,
	init = function()
		vim.g.copilot_proxy = "http://127.0.0.1:1080"
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
