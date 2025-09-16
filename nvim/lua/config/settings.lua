vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = vim.fn.exepath("python3")
local o = vim.opt

-- Show line numbers
o.number = true
-- Show relative line numbers
o.relativenumber = true

-- Use the system clipboard
o.clipboard = "unnamedplus"

-- Number of spaces that represent a <TAB>
o.tabstop = 2
o.softtabstop = 2

-- Show tabline always
o.showtabline = 2

-- Use spaces instead of tabs
o.expandtab = true

-- Enable smart indentation
o.smartindent = true

-- Number of spaces to use for each step of (auto)indent
o.shiftwidth = 2

-- Enable break indent
o.breakindent = true

-- Highlight the screen line of the cursor
o.cursorline = true

-- Minimum number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Enable mouse support
o.mouse = "a"

-- Set folding method to manual
o.foldmethod = "manual"

-- Disable folding by default
o.foldenable = false

-- Wrap long lines at a character in 'breakat'
o.linebreak = false

-- Disable spell checking
o.spell = false

-- Disable swap file creation
o.swapfile = false

-- Time in milliseconds to wait for a mapped sequence to complete
o.timeoutlen = 300

-- Enable 24-bit RGB color in the TUI
o.termguicolors = true

-- Don't show mode in the command line
o.showmode = false

-- Open new split below the current window
o.splitbelow = true

-- Keep the screen when splitting
o.splitkeep = "screen"

-- Open new split to the right of the current window
o.splitright = true

-- Hide command line unless needed
o.cmdheight = 0

-- Remove EOB
o.fillchars = {
	eob = " ",
}

o.wrap = false

o.sms = true

o.breakat = [[ 	!;:,.?]]
o.whichwrap = "h,l,<,>,[,],~"
o.columns = 200
o.textwidth = 100
o.breakindentopt = "min:80,shift:-99,list:-1"
o.formatoptions = "jcroqlntw"

o.list = true

o.lcs = {
	tab = "  ",
	trail = "-",
	nbsp = "‿",
}

o.wiw = 50
o.wmw = 50
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

o.fileencodings = { "utf-8", "euc-cn" }
