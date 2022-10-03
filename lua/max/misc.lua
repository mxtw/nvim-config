-- rest client
require("rest-nvim").setup({
    result_split_horizontal = true,
    result_split_in_place = true,
})

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
