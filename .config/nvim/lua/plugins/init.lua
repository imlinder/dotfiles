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
      vim.opt.background = ""
    end,
  },
  'christoomey/vim-tmux-navigator',
  'williamboman/mason.nvim',
  -- 'https://github.com/github/copilot.vim',
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
    branch = "canary",
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

  'mbbill/undotree',

  'mattn/emmet-vim',
  'tpope/vim-surround',
  --Plug 'tpope/vim-commentary',
  'numToStr/Comment.nvim',
  'sagarrakshe/toggle-bool',
  -- Plug 'Raimondi/delimitMate',
  'vimwiki/vimwiki',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', config = function() require('telescope').load_extension('fzf') end },
    }
  },

  -- Lualine
  'hoob3rt/lualine.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Syntax
  'norcalli/nvim-colorizer.lua',
  'cakebaker/scss-syntax.vim',
  --  'yuezk/vim-js',
  --  'maxmellon/vim-jsx-pretty',
  'zaiste/tmux.vim',
  --  'StanAngeloff/php.vim',
  --  'nelsyeung/twig.vim',

  -- 'cormacrelf/dark-notify',
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
