local dap = require('dap')

vim.keymap.set('n', '<F5>', function() dap.continue() end) -- Will run the app
vim.keymap.set('n', '<C-b>', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<C-n>', function() dap.step_over() end)
vim.keymap.set('n', '<C-i>', function() dap.step_into() end)
vim.keymap.set('n', '<leader>i', function() dap.repl.open() end)

vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

-- Flutter tools
require('flutter-tools').setup({
	debugger = {
		enabled = true,
		run_via_dap = true,
		exception_breakpoints = { "raised" }
	},
	dev_log = {
		enabled = false,
		notify_errors = true
	},
	color = {
		color = { -- show the derived colours for dart variables
			enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
			background = true, -- highlight the background
			background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
			foreground = false, -- highlight the foreground
			virtual_text = true, -- show the highlight using virtual text
			virtual_text_str = "■", -- the virtual text character to highlight
		}
	}
})
