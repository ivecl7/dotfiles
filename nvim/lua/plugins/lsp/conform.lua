return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},

		format_after_save = { lsp_fallback = true },

		notify_on_error = true,
		formatters_by_ft = {
			html = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			css = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			cpp = { "clang-format" },
			javascript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			kdl = {
				"prettier",
			},
			typescript = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			python = {
				"black",
				"isort",
			},
			lua = { "stylua" },
			nix = { "nixfmt" },
			markdown = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			yaml = {
				"prettierd",
				"prettier",
				stop_after_first = true,
			},
			terraform = { "terraform_fmt" },
			sh = {
				"shellcheck",
				"shellharden",
				"shfmt",
			},
			bash = {
				"shellcheck",
				"shellharden",
				"shfmt",
			},
			json = { "jq" },
			jsonc = { "prettier" },
			rust = { "rustfmt" },
			_ = { "trim_whitespace" },
		},
	},
}
