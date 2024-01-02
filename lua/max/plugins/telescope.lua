return {
    { "nvim-telescope/telescope-file-browser.nvim", event = "VeryLazy" },
    { 'nvim-telescope/telescope-fzf-native.nvim',   build = 'make' },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = {
            function()
                local telescope = require("telescope")

                telescope.setup({
                    defaults = {
                        mappings = {
                            i = {
                                ["<C-j>"] = "move_selection_next",
                                ["<C-k>"] = "move_selection_previous",
                            }
                        },
                        layout_strategy = "vertical",
                    },
                    extensions = {
                        file_browser = {
                            hijack_netrw = false, -- netrw is default vim dir viewer
                            hide_parent_dir = true,
                            theme = "ivy",
                            hidden = false,
                            path = "%:p:h",     -- use path of file in current buffer
                            cwd_to_path = true, -- open file browser using path instead of cwd
                        },
                        fzf = {},
                    },
                })

                telescope.load_extension("file_browser")
                telescope.load_extension("fzf")
            end
        },
        keys = {
            { "<leader><space>", function()
                require("telescope.builtin").find_files()
            end },
            { "<leader>,", function()
                require("telescope.builtin").buffers()
            end },
            { "<leader>/", function()
                require("telescope.builtin").live_grep()
            end },

            { "<leader>ff", function()
                require("telescope").extensions.file_browser.file_browser()
            end },
            { "<leader>fp", function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "$HOME/.config/nvim",
                    depth = 3,
                })
            end },
            { "<leader>fr", function()
                require("telescope.builtin").oldfiles()
            end },

            { "<leader>nf", function()
                require("telescope").extensions.file_browser.file_browser({
                    path = "$HOME/org",
                })
            end },
            { "<leader>ns", function()
                require("telescope.builtin").live_grep({
                    cwd = "$HOME/org",
                })
            end },

            { "<leader>cx", function()
                require("telescope.builtin").diagnostics()
            end },
            { "<leader>cs", function()
                require("telescope.builtin").lsp_document_symbols()
            end },
            { "<leader>cS", function()
                require("telescope.builtin").lsp_workspace_symbols()
            end },

            { "<leader>hh", function()
                require("telescope.builtin").help_tags()
            end },
            { "<leader>hm", function()
                require("telescope.builtin").man_pages()
            end },
            { "<leader>ht", function()
                require("telescope.builtin").colorscheme()
            end },
        },
    }
}
