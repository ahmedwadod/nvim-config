local lsp_zero = require('lsp-zero')
require("lsp-format").setup({})

lsp_zero.on_attach(function(client, bufnr)
	require("lsp-format").on_attach(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls' },
	handlers = {
		lsp_zero.default_setup,
	},
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = cmp.PreselectMode.Item,
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		-- Tab to navigate
		['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = function()
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end,

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	})
})
