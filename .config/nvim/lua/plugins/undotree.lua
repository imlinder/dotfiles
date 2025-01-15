return {
  'mbbill/undotree',
  init = function()
    vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })
  end
}
