return {
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require('copilot').setup({
        panel = {
          keymap = {
            open = '<M-c>',
          }
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-f>',
          },
        },
        filetypes = {
          gitcommit = true,
        }
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

