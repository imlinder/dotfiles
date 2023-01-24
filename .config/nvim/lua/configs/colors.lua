require('nightfox').setup({
  options = {
  }
})

require('catppuccin').setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 1,
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    vimwiki = true,
    native_lsp = {
      enabled = true,
    }
  }
})

vim.cmd.colorscheme "catppuccin"

require('dark_notify').run({
  onchange = function(mode)
    if mode == 'dark' then
      vim.o.background = "dark"
    else
      vim.o.background = "light"
    end
  end,
})

