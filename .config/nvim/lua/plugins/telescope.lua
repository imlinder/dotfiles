return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', config = function() require('telescope').load_extension('fzf') end },
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          }
        }
      },
      mappings = {
        i = {
          ['<c-d>'] = require('telescope.actions').delete_buffer
        }
      },
    },
    config = function(PluginSpec, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('yadm_files')

      vim.api.nvim_set_keymap('n', '<c-p>',      '<cmd>lua require("telescope.builtin").git_files()<cr>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>',   { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fs', '<cmd>lua require("telescope.builtin").git_status()<cr>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>',      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<c-b>',      '<cmd>lua require("telescope.builtin").buffers()<cr>',      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fe', '<cmd>lua require("telescope.builtin").file_browser()<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>',    { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>ft', '<cmd>lua require("telescope.builtin").builtin()<cr>',      { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>fd', '<cmd>lua require("telescope.builtin").diagnostics()<cr>',      { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope yadm_files <cr>", {noremap= true, silent = true})
    end,
  },
  {
    "pschmitt/telescope-yadm.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  }
}

