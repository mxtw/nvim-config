-- theme stuff
vim.opt.termguicolors = true
vim.o.guifont = "Hack"
vim.opt.colorcolumn = "80"
vim.opt.background = "dark"

vim.cmd("colorscheme dracula")
-- vim.cmd("hi Normal guibg=NONE") -- no background for dracula

-- lualine
require("lualine").setup({
    options = {
        section_separators = "",
        component_separators = "",
    },
    tabline = {
        lualine_a = { "buffers" },
        lualine_z = { "tabs" },
    },
})

require("indent_blankline").setup()
