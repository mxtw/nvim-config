local nvim_share = os.getenv("HOME") .. "/.local/share/nvim"

vim.opt.encoding = "utf-8"
vim.opt.langmenu = "en_US.UTF-8"

vim.cmd 'syntax enable'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.backspace = "2"
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.wrap = false

vim.opt.swapfile = true
vim.opt.directory = nvim_share .. "/swap"

vim.opt.undodir = nvim_share .. "/undo"
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.updatetime = 100
vim.opt.showmatch = true

vim.opt.errorbells = false
vim.opt.visualbell = true

vim.opt.list = true
vim.opt.cursorline = true

vim.wo.signcolumn = "yes"

vim.g.python3_host_prog = "/usr/bin/python3"

vim.opt.splitbelow = true

-- conceal links
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.g.mapleader = " " -- set leader key to space
