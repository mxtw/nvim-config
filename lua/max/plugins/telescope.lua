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
            {
                "<leader><space>",
                function()
                    builtin = require("telescope.builtin")
                    is_inside_work_tree = {}

                    local cwd = vim.fn.getcwd()
                    if is_inside_work_tree[cwd] == nil then
                        vim.fn.system("git rev-parse --is-inside-work-tree")
                        is_inside_work_tree[cwd] = vim.v.shell_error == 0
                    end

                    if is_inside_work_tree[cwd] then
                        builtin.git_files({ show_untracked = true })
                    else
                        builtin.find_files({})
                    end
                end,
                desc = "Fuzzy Find Files"
            },
            {
                "<leader>,",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Buffers"
            },
            {
                "<leader>/",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Live Grep"
            },

            {
                "<leader>ff",
                function()
                    require("telescope").extensions.file_browser.file_browser()
                end,
                desc = "File Browser"
            },
            {
                "<leader>fr",
                function()
                    require("telescope.builtin").oldfiles()
                end,
                desc = "Previous Files"
            },

            {
                "<leader>cx",
                function()
                    require("telescope.builtin").diagnostics()
                end,
                desc = "Search Diagnostics"
            },
            {
                "<leader>cs",
                function()
                    require("telescope.builtin").lsp_document_symbols()
                end,
                desc = "Search Document Symbols",
            },
            {
                "<leader>cS",
                function()
                    require("telescope.builtin").lsp_workspace_symbols()
                end,
                desc = "Search Workspace Symbols",
            },

            {
                "<leader>hh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Help Tags",
            },
            {
                "<leader>hm",
                function()
                    require("telescope.builtin").man_pages()
                end,
                desc = "Man Pages",
            },
            {
                "<leader>ht",
                function()
                    require("telescope.builtin").colorscheme()
                end,
                desc = "Colorschemes",
            },
        },
    }
}
