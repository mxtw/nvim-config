-- theme stuff
vim.opt.termguicolors = true
vim.o.guifont = "Hack"
vim.opt.colorcolumn = "80"
vim.opt.background = "dark"
vim.g.embark_terminal_italics = 1

require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd("colorscheme catppuccin-mocha")

-- lualine
require("lualine").setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "diagnostics" },
        lualine_c = { "buffers" },
        lualine_x = {},
        lualine_y = { "branch", "diff" },
        lualine_z = { "location", "selectioncount" },
    },
})

require("noice").setup({
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        -- override = {
        --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        --     ["vim.lsp.util.stylize_markdown"] = true,
        --     ["cmp.entry.get_documentation"] = true,
        -- },
    },
    presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    cmdline = {
        view = "cmdline",
    },
})


require("org-bullets").setup()

require("ibl").setup({
    scope = {
        enabled = false,
    },
})
require("colorizer").setup()

-- highlight motions
require("flash").setup({
    jump = {
        autojump = false
    }
})

require("dressing").setup()


require("twilight").setup()
require("zen-mode").setup({
    window = {
        width = 90,
        options = {
            number = true,
            relativenumber = true,
        }
    },
    plugins = {
        gitsigns = {
            enabled = true
        },
        wezterm = {
            enabled = true
        }
    },
})
