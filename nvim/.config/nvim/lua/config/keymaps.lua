-- lua/user/keymaps.lua
local builtin = require('telescope.builtin')

-- Telescope key mappings
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- File explorer key mapping
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Diagnostics key mappings
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
