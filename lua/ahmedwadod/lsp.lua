local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
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

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"ts_ls"
	},
})

-- automatically install ensure_installed servers
require("mason-lspconfig").setup_handlers({
	-- Will be called for each installed server that doesn't have
	-- a dedicated handler.
	--
	function(server_name) -- default handler (optional)
		-- https://github.com/neovim/nvim-lspconfig/pull/3232
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig")[server_name].setup({

			capabilities = capabilities,
		})
	end,
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = cmp.PreselectMode.Item,
	mapping = cmp.mapping.preset.insert({
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = true }),

		-- Ctrl+. to toggle completion
		['<C-.>'] = function()
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end,
	})
})


-- Auto format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

vim.api.nvim_create_autocmd('BufWritePre', {
	group = augroup,
	callback = function()
		local clients = vim.lsp.get_active_clients()
		for _, client in ipairs(clients) do
			if client.server_capabilities.documentFormattingProvider then
				vim.lsp.buf.format({ async = false })
				break
			end
		end
	end,
})
