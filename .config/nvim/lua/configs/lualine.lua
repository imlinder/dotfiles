local colors = {
	cyan = '#95E6CB',
	green = '#BAE67E',
	red = '#FF3333',
	white = '#C7C7C7',
	yellow = '#FFA759',
}

require('lualine').setup {
	options = {
		icons_enabled = false,
		theme = 'ayu_mirage',
		component_separators = '',
	},
	sections = {
		--lualine_a = {'g:coc_status'},
		lualine_b = {
			'branch',
			{
				"diff",
				colored = false,
			},
		},
		lualine_c = {
			'filename',
			{
				'diagnostics',
				sources = {'coc'},
				sections = { 'error', 'warn', 'info', 'hint' },
				color_error = colors.red,
				color_warn = colors.yellow,
				color_info = colors.yellow,
				color_hint = colors.white,
				symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
			}
		},
	}
}
