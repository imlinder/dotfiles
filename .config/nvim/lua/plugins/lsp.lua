local keymap = function()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
  vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
  vim.keymap.set("n", "<Leader>rr", vim.lsp.buf.rename, {buffer=0})
  vim.keymap.set("n", "<Leader>ra", vim.lsp.buf.code_action, {buffer=0})
  vim.keymap.set("n", "<Leader>dn", vim.diagnostic.goto_next, {buffer=0})
  vim.keymap.set("n", "<Leader>dN", vim.diagnostic.goto_prev, {buffer=0})
  vim.keymap.set("n", "<Leader>D", vim.diagnostic.open_float, {buffer=0})
end

return {
  {
    'neovim/nvim-lspconfig',

    dependencies = {
      { 'saghen/blink.cmp' },
      {
        {
          "folke/lazydev.nvim",
          ft = "lua", -- only load on lua files
          opts = {
            library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
          },
        },
      }
    },

    opts = {
      servers = {
        lua_ls = {},
        ts_ls = {},
        tailwindcss = {},
        intelephense = {},
        gopls = {},
        emmet_language_server = {},
      },
    },

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      keymap()
    end,

  },
}
