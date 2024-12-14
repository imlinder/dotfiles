local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

require("lsp-format").setup {}

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

-- cmp capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- For prettier / js
null_ls.setup({
  sources = { null_ls.builtins.formatting.prettier },
  on_attach = require "lsp-format".on_attach
})

-- Tsserver
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client)
    keymap()
  end,
}

local servers = { "tailwindcss", "intelephense", "gopls", "svelte" }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      require("lsp-format").on_attach(client)
      keymap()
    end;
  }
end

-- Lua lsp for primarilly working on nvim configs
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.opt.completeopt={"menu", "menuone", "noselect"}

