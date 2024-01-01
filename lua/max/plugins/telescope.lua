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
        }
    }
}
