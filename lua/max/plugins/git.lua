return {
    { "tpope/vim-fugitive", event = "VeryLazy" },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = true
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        opts = {
            use_icons = true,
        }
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
