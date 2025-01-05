return {
  {
  "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        colors = {
          theme = {
            all = {
              ui = {
                -- bg_gutter = "none"
              }
            }
          }
        }
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  'christoomey/vim-tmux-navigator',
  'williamboman/mason.nvim',

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

  -- LSP
  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'lukas-reineke/lsp-format.nvim',

  -- Treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- LSP Autocomplete
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',

  -- Snippets
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',

  -- Formatting
  'mhartington/formatter.nvim',

  -- File tree
  'kyazdani42/nvim-tree.lua',

  -- Git
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'seanbreckenridge/gitsigns-yadm.nvim',

  'mbbill/undotree',

  'mattn/emmet-vim',
  'tpope/vim-surround',
  'numToStr/Comment.nvim',
  'vimwiki/vimwiki',
  'jinh0/eyeliner.nvim',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', config = function() require('telescope').load_extension('fzf') end },
    }
  },

  {
    "pschmitt/telescope-yadm.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Lualine
  'hoob3rt/lualine.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Syntax
  'cakebaker/scss-syntax.vim',
  {
    'f-person/auto-dark-mode.nvim',
    config = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
      end,
    },
  }

}
