-- theme stuff
vim.opt.termguicolors = true
vim.o.guifont = "Hack"
vim.opt.colorcolumn = "80"
vim.opt.background = "dark"
vim.g.embark_terminal_italics = 1

vim.cmd("colorscheme embark")
-- vim.cmd("hi Normal guibg=NONE") -- no background for dracula

-- lualine
require("lualine").setup({
    -- tabline = {
    --     lualine_a = { "buffers" },
    --     lualine_z = { "tabs" },
    -- },
})

require("bufferline").setup({
    highlights = {
        buffer_selected = {
            italic = false,
        },
    },
    options = {
        diagnostics = "nvim_lsp",
    },
})

-- make buffers exclusive to their tabs
require("scope").setup()

require("indent_blankline").setup()
require("colorizer").setup()
