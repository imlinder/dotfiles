return {
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      "echasnovski/mini.icons",
      opts = {},
      lazy = true,
      specs = {
        { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
      },
      init = function()
        package.preload["nvim-web-devicons"] = function()
          require("mini.icons").mock_nvim_web_devicons()
          return package.loaded["nvim-web-devicons"]
        end
      end,
    },
    opts = {
      hijack_netrw = false,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    },
    init = function()
      vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<CR>')
    end,
  }
}
