vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>pv", ':NvimTreeOpen<CR>')

vim.keymap.set("n", "<leader>]", function() vim.diagnostic.jump({ count = 1, float = true }) end)

vim.keymap.set("n", "<leader>[", function() vim.diagnostic.jump({ count = -1, float = true }) end)

vim.api.nvim_set_keymap('n', '<Tab>', ':tabnext<CR>', { noremap = true, silent = true })      -- Switch to next tab
vim.api.nvim_set_keymap('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true }) -- Switch to previous tab
vim.api.nvim_set_keymap('n', '<F1>', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
