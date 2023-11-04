-- autopairs
require("nvim-autopairs").setup()

-- org
require("orgmode").setup({
    org_agenda_files = { "~/org/**/*" },
    org_default_notes_file = "~/org/notes.org",
    org_hide_leading_stars = true,
    org_todo_keywords = {
        "TODO",
        "WAIT",
        "|",
        "DONE",
        "DELEGATED",
    },
    org_hide_emphasis_markers = true,
})

require("orgmode").setup_ts_grammar()

require("Comment").setup({
    mappings = {
        basic = false,
        extra = false,
    },
})

require("leap").add_default_mappings()
