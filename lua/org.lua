local org = require("orgmode")

org.setup_ts_grammar()

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
})
