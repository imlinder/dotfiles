require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "vim", "vimdoc", "javascript", "typescript", "html", "css" },
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
