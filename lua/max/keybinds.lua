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
