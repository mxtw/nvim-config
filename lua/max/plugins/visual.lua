return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        opts = {
            transparent_background = true,
        },
        init = function()
            vim.cmd("colorscheme catppuccin-mocha")
        end
    },

    { "kyazdani42/nvim-web-devicons", lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
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

        }
    },

    {
        "folke/noice.nvim",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
                hover = {
                    enabled = false
                },
                signature = {
                    enabled = false
                }
            },
            presets = {
                -- bottom_search = true,         -- use a classic bottom cmdline for search
                long_message_to_split = true, -- long messages will be sent to a split
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
            cmdline = {
                -- view = "cmdline",
            },
        },
        lazy = false,
        keys = {
            { "<leader>hn", "<cmd>NoiceHistory<cr>", desc = "Noice History" }
        }
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {
            scope = {
                enabled = false,
            },
        }
    },

    { "norcalli/nvim-colorizer.lua",  config = true },
}
