vim.keymap.set("n", "<leader>.", "<cmd>e#<cr>")

vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>")

vim.keymap.set("n", "<leader>cD", function() toggle_diagnostics() end)

vim.keymap.set("n", "<leader>dd", "<cmd>windo diffthis<cr>")
vim.keymap.set("n", "<leader>dD", "<cmd>diffthis<cr>")

vim.keymap.set("n", "<leader>qQ", "<cmd>qa!<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>xa<cr>")

vim.keymap.set("n", "<leader>wh", "<cmd>vertical resize -10<cr>")
vim.keymap.set("n", "<leader>wj", "<cmd>resize -5<cr>")
vim.keymap.set("n", "<leader>wk", "<cmd>resize +5<cr>")
vim.keymap.set("n", "<leader>wl", "<cmd>vertical resize +10<cr>")
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")

-- these move the selected line(s) up or down, stolen from theprimeagen
-- https://github.com/ThePrimeagen/init.lua/blob/97c039bb88d8bbbcc9b1e3d0dc716a2ba202c6d2/lua/theprimeagen/remap.lua#L5-L6
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
