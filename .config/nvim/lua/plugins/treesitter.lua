return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "json",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "markdown",
        "dockerfile",
        "bash",
      },
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "vin", -- set to `false` to disable one of the mappings
          node_incremental = ".",
          scope_incremental = false,
          node_decremental = ",",
        },
      },
      indent = {
        enable = true,
      },
    },
  }
}
