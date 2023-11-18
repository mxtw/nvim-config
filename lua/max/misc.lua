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

require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size",
    },
    skip_confirm_for_simple_edits = true,
})

local gen = require("gen")

gen.model = "mistral:instruct"
gen.prompts["Generate_Code"] = {
    prompt =
    "Generate code based on the following description: '$input'. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    extract = "```$filetype\n(.-)```",
    replace = true,
}
