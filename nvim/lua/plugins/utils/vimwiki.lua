return {
	"ivecl7/vimwiki",
	lazy = false,
	-- The event that triggers the plugin
	event = "BufEnter *.md",
	-- The keys that trigger the plugin
	keys = {
		"<leader>ww",
		"<leader>wt",
		{ "r", "<cmd>Vimwiki2HTMLBrowse<cr>", "n", { desc = "Show vimwiki in browser" } },
		{
			"<leader>r",
			function()
				local current_line = vim.api.nvim_get_current_line()
				if current_line:sub(1, 1) == ":" then
					vim.cmd(current_line)
				end
			end,
			"n",
			{ desc = "Show vimwiki in browser" },
		},
	},
	-- The configuration for the plugin
	init = function()
		vim.g.vimwiki_auto_header = 1
		vim.g.vimwiki_list = {
			{
				-- Here will be the path for your wiki
				path = "~/.data/",
				-- The syntax for the wiki
				-- syntax = "markdown",
				ext = "md",
			},
		}
	end,
}
