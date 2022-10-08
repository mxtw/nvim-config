-- autopairs
require("nvim-autopairs").setup()

-- org
require("orgmode").setup({
    org_agenda_files = { "~/org/**/*" },
    org_hide_leading_stars = true,
})

require("orgmode").setup_ts_grammar()

-- toggleterm
require("toggleterm").setup()

require("Comment").setup({
    mappings = {
        basic = false,
        extra = false,
    },
})
