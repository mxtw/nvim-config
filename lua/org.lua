local org = require("orgmode")

org.setup_ts_grammar()

-- conceal links
vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"org"},
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "go",
        "hcl",
        "markdown",
        "org",
        "python",
        "rust",
        "yaml",
    },
})

require("orgmode").setup({
    org_agenda_files = {"~/org/**/*"},
    org_hide_leading_stars = true,
})
