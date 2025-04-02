local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		-- Add other file types as needed
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

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
