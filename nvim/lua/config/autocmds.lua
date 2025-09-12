local a = vim.api

a.nvim_create_augroup("restore_cursor", { clear = true })
a.nvim_create_autocmd({ "BufReadPost" }, {
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
