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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
