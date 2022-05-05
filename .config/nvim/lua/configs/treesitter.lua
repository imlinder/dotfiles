require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust" },
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}
