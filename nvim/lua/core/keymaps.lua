local keymap = vim.keymap

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Save and quit file.
keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Exit file' })

-- Split window.
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })

-- Better indenting.
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Move selection.
keymap.set('v', 'J', ":m '>+1<cr>gv=gv", {desc = 'Move selection down' })
keymap.set('v', 'K', ":m '<-2<cr>gv=gv", {desc = 'Move selection up' })
