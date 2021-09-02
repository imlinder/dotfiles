require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'ayu_mirage',
		component_separators = '',
	},
	sections = {
		--lualine_b = {'branch', 'diff'},
	}
}
