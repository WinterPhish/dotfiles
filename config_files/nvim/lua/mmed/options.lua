local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- turn off swapfile
opt.swapfile = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
