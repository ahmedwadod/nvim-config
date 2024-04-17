vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My Shortcuts
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Telescope Shortcuts
local ts = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', ts.find_files, {})
vim.keymap.set('n', '<leader>ss', ts.git_files, {})
vim.keymap.set('n', '<leader>sr', ts.lsp_references, {})
vim.keymap.set('n', '<leader><leader>', ts.buffers, {})
