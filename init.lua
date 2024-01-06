-- lazy plugin manager
require("lazy-config")

-- tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

-- whitespace display
vim.opt.listchars:append({ space = "·" })
vim.opt.list = true

-- line numbers
vim.opt.number = true

-- share clipboard with the system
vim.opt.clipboard:append('unnamedplus')
