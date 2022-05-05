require('nightfox').setup({
  options = {
  }
})

require('dark_notify').run({
  onchange = function(mode)
    if mode == 'dark' then
      vim.cmd [[
        set background="dark"
        colorscheme nightfox
      ]]
    else
      vim.cmd [[
        set background="light"
        colorscheme dayfox
      ]]
    end
  end,
})
