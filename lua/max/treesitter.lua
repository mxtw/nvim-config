require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
    },
    indent = {
        enable = true,
    },
    ensure_installed = {
        "bash",
        "c",
        "go",
        "hcl",
        "http",
        "javascript",
        "json",
        "markdown",
        "org",
        "python",
        "rust",
        "typescript",
        "yaml",
    },
})
