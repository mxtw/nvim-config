local telescope = require("telescope")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            }
        }
    },
    extensions = {
        file_browser = {
            hijack_netrw = false, -- netrw is default vim dir viewer
            hide_parent_dir = true,
            theme = "ivy",
            hidden = false,
            path = "%:p:h", -- use path of file in current buffer
            cwd_to_path = true, -- open file browser using path instead of cwd
        },
    },
})

telescope.load_extension("file_browser")
telescope.load_extension("project")
telescope.load_extension("zoxide")
