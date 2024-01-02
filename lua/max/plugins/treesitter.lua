return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        init = function()
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldlevel = 99
        end,
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    disable = { "po" },
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
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "org",
                    "python",
                    "regex",
                    "rust",
                    "typescript",
                    "vim",
                    "yaml",
                },
            })
        end
    },

    { "nvim-treesitter/nvim-treesitter-context", config = true },


}
