require("configs.colors")
require("configs.git")
require("configs.lsp")
require("configs.lualine")
require("configs.nvim-tree")
require("configs.telescope")
require("configs.treesitter")


-- function format_prettier()
--    return {
--      exe = "npx",
--      args = {"prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0)},
--      stdin = true
--    }
-- end

-- require('formatter').setup {
--   logging = true,
--   filetype = {
--     typescript = { format_prettier },
--     typescriptreact = { format_prettier },
--     javascript = { format_prettier },
--     javascriptreact = { format_prettier },
--   }
-- }

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx FormatWrite
-- augroup END
-- ]], true)

