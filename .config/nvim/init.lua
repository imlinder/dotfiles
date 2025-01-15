vim.opt.shortmess:append("I")
vim.opt.undodir = "~/.vimundo/"
vim.opt.undofile = true
vim.opt.directory = "~/.vimswap"
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.fixendofline = false
vim.opt.showmode = false

vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.guicursor = "i:block"

vim.opt.listchars = "tab:▸ ,trail:·"
vim.opt.list = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.g.netrw_banner = 0

-- Use space as leader
vim.g.mapleader = " "

-- Mappings

-- Escape from insert mode.
vim.keymap.set('i', 'jk', '<esc>')

-- Keep cursor in the center when moving to next/previous search match.
vim.keymap.set('n', 'n', 'nzz', { noremap = true })
vim.keymap.set('n', 'N', 'Nzz', { noremap = true })

vim.keymap.set('i', '<C-j>', '<CR><Esc>O')

-- Toggle line numbers
vim.keymap.set('n', '<leader>nu', ':set nu!<CR>', { silent = true })

require("config")
