-- theme stuff
vim.opt.termguicolors = true
vim.o.guifont = "Hack"
vim.opt.colorcolumn = "80"
vim.opt.background = "dark"
vim.g.embark_terminal_italics = 1

require("catppuccin").setup({
    transparent_background = false,
})
vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("hi Normal guibg=NONE") -- no background for dracula

-- csv.vim autocommands
vim.api.nvim_create_autocmd(
    { "BufRead", "BufWritePost" },
    {
        pattern = { "*.csv" },
        command = "%ArrangeColumn",
    }
)
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = { "*.csv" },
        command = "%UnArrangeColumn",
    }
)

-- lualine
require("lualine").setup({
    -- tabline = {
    --     lualine_a = { "buffers" },
    --     lualine_z = { "tabs" },
    -- },
})

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    cmdline = {
        view = "cmdline",
    },
})

require("org-bullets").setup()

-- make buffers exclusive to their tabs
require("scope").setup()

require("indent_blankline").setup()
require("colorizer").setup()
