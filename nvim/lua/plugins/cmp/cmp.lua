return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "hrsh7th/nvim-cmp" },
		{ "windwp/nvim-autopairs" },
	},
	opts = {
		autoEnableSources = true,
		experimental = {
			ghost_text = false,
		},
		performance = {
			debounce = 60,
			fetchingTimeout = 200,
			maxViewEntries = 30,
		},
		snippet = {
			expand = "luasnip",
		},
		formatting = {
			fields = {
				"kind",
				"abbr",
				"menu",
			},
		},
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- Navigate between completion items
				["<C-j>"] = cmp.mapping.select_prev_item(),
				["<C-k>"] = cmp.mapping.select_next_item(),

				-- `Enter` key to confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				["<C-Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{
					name = "buffer",
					keyword_length = 3,
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{
					name = "git",
					option = {
						keyword_length = 3,
					},
				},
				{
					name = "nvim_lsp",
					option = {
						keyword_length = 3,
					},
				},
				{
					name = "emoji",
					option = {
						keyword_length = 3,
					},
				},
				{ name = "copilot" },
				{
					name = "path",
					option = {
						keyword_length = 3,
					},
				},
				{
					name = "luasnip",
					option = {
						keyword_length = 3,
					},
				},
			}),
		})
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
