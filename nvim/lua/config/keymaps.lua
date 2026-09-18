local map = vim.keymap.set

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Reload config
map("n", "<leader>r", "<cmd>source $MYVIMRC<cr><cmd>echo 'nvim config reloaded'<cr>", { desc = "Reload config" })

-- Clear search highlight
map("n", "<leader><space>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

-- Save / quit
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Quit all" })

-- Quickfix
map("n", "<leader>n", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
map("n", "<leader>p", "<cmd>cprev<cr>", { desc = "Prev quickfix item" })

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontally" })

-- Stay in visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selection up / down
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
