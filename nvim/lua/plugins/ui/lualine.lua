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
					function()
						local cmd = [[
              echo -e "status\nquit" | nc 127.0.0.1 23333 2>/dev/null | grep 'lyric-s:' | sed 's/^.\{12\}//'
            ]]
						-- 使用 io.popen 执行命令并读取结果
						local handle = io.popen(cmd)
						local lyric = handle:read("*a") -- 读取全部输出
						handle:close() -- 关闭进程
						-- 清理结果（移除末尾换行符和空格）
						lyric = lyric:gsub("%s+$", "")
						-- 如果无结果，返回提示信息
						return lyric ~= "" and lyric or "No lyric"
					end,
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
