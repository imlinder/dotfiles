local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("config.colors")
require("config.git")
require("config.lsp")
require("config.cmp")
require("config.luasnip")
require("config.lualine")
require("config.nvim-tree")
require("config.telescope")
require("config.treesitter")

require('Comment').setup()

require("mason").setup()
