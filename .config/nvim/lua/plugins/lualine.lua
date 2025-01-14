return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { "echasnovski/mini.icons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
      },
    }
  },
}
