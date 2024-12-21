require('ahmedwadod.settings')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "rose-pine/neovim",                 lazy = false },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup {
				defaults = {
					file_ignore_patterns = { "build/", "node_modules/" },
				}
			}
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },

	-- dap
	{ 'mfussenegger/nvim-dap' },

	-- Flutter tools
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = true,
	},

	-- Other
	"github/copilot.vim",
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("lualine").setup()
		end
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require("nvim-tree").setup({
				filters = {
					dotfiles = false,
					git_ignored = false,
					custom = { "node_modules", ".cache", ".git", ".DS_Store" },
				}
			})
		end

	},
})

-- Needs to be here!
require('ahmedwadod.color')
require('ahmedwadod.keymaps')
require('ahmedwadod.lsp')
require('ahmedwadod.dap')
