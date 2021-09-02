require('telescope').setup {
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
	}
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<c-p>',      '<cmd>lua require("telescope.builtin").find_files()<cr>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>',   { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-/>',      '<cmd>lua require("telescope.builtin").live_grep()<cr>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>',    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>',      { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fe', '<cmd>lua require("telescope.builtin").file_browser()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>',    { noremap = true, silent = true })

