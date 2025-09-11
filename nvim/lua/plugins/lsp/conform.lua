return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		setup = {
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b({ bufnr }).disable_autoformat then
					return
				end

				if slow_format_filetypes({ vim.bo({ bufnr }).filetype }) then
					return
				end

				local function on_format(err)
					if err and err:match("timeout$") then
						return slow_format_filetypes({ vim.bo({ bufnr }).filetype })
					end
				end

				return { timeout_ms = 200, lsp_fallback = true }
			end,

			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b({ bufnr }).disable_autoformat then
					return
				end

				if not slow_format_filetypes({ vim.bo({ bufnr }).filetype }) then
					return
				end

				return { lsp_fallback = true }
			end,

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
				nix = { "nixfmt-rfc-style" },
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
				bicep = { "bicep" },
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
				rust = { "rustfmt" },
				_ = { "trim_whitespace" },
			},

			formatters = {
				black = {
					"black",
				},
				["clang-format"] = {
					"clang-format",
				},
				isort = {
					"isort",
				},
				["nixfmt-rfc-style"] = {
					"nixfmt-rfc-style",
				},
				alejandra = {
					"alejandra",
				},
				jq = {
					"jq",
				},
				prettierd = {
					"prettierd",
				},
				stylua = {
					"stylua",
				},
				shellcheck = {
					"shellcheck",
				},
				shfmt = {
					"shfmt",
				},
				shellharden = {
					"shellharden",
				},
				bicep = {
					"bicep",
				},
			},
		}
	end,
}
