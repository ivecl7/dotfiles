local ag = vim.api.nvim_create_augroup
local ac = vim.api.nvim_create_autocmd

ag("restore_cursor", { clear = true })
ac({ "BufReadPost" }, {
	group = "restore_cursor",
	pattern = "*",
	callback = function()
		if
			vim.fn.line("'\"") > 1
			and vim.fn.line("'\"") <= vim.fn.line("$")
			and vim.bo.filetype ~= "commit"
			and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
		then
			vim.cmd('normal! g`"')
		end
	end,
})
