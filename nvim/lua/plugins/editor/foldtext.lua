return {
	"OXY2DEV/foldtext.nvim",
	lazy = false,
	version = "v1.0.0",
	opts = {
		default = {
			{
				type = "raw",
				text = function(_, buf)
					local ln = vim.fn.getbufline(buf, vim.v.foldstart)
					return ln
				end,
			},
			{
				type = "raw",
				text = function(win, buf)
					local ln = vim.fn.getbufline(buf, vim.v.foldstart)[1]:len()
					local w = vim.api.nvim_win_get_width(win)
					local off = vim.fn.getwininfo(win)[1].textoff
					local diff = vim.fn.strchars(" " .. tostring(vim.v.foldend - vim.v.foldstart) .. " lines ")
					return string.rep("─", math.floor((w - off - diff - ln) / 2))
				end,
				hl = "Comment",

				gradient_repeat = true,
			},
			{
				type = "fold_size",
				prefix = " ",
				postfix = " lines ",
			},
			{
				type = "raw",
				text = function(win, buf)
					local ln = vim.fn.getbufline(buf, vim.v.foldstart)[1]:len()
					local w = vim.api.nvim_win_get_width(win)
					local off = vim.fn.getwininfo(win)[1].textoff
					local diff = tostring(vim.v.foldend - vim.v.foldstart)

					return string.rep("─", math.ceil((w - off - 2 - ln - vim.fn.strchars(diff)) / 2))
				end,
				hl = "Comment",

				gradient_repeat = true,
			},
		},
	},
}
