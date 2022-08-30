local telescope = require("telescope")

telescope.setup({
    extensions = {
        file_browser = {
            hijack_netrw = true, -- netrw is default vim dir viewer
            hide_parent_dir = true,
            dir_icon = "",
            theme = "ivy",
            hidden = false,
            path = "%:p:h", -- use path of file in current buffer
            cwd_to_path = true, -- open file browser using path instead of cwd
        },
    },
})

telescope.load_extension("file_browser")
