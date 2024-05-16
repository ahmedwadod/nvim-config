vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- My Shortcuts
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')
vim.keymap.set({ 'n' }, '<S-D-.>', '5<C-w>>')
vim.keymap.set({ 'n' }, '<S-D-,>', '5<C-w><')
vim.keymap.set({ 'n' }, '<C-=>', '5<C-w>+')
vim.keymap.set({ 'n' }, '<C-->', '5<C-w>-')
-- Navigate windows with <D-jkl> key
vim.keymap.set({ 'n' }, '<D-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<D-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<D-l>', '<C-w>w')

-- Telescope Shortcuts
local ts = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', ts.find_files, {})
vim.keymap.set('n', '<leader>ss', ts.git_files, {})
vim.keymap.set('n', '<leader>sr', ts.lsp_references, {})
vim.keymap.set('n', '<leader><leader>', ts.buffers, {})

-- Nvim Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {})
