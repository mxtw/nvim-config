return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", "<cmd>Git<cr>", desc = "Fugitive Status" }
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
        event = "VeryLazy",
        keys = {
            { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Blame" },
            { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview Hunk" },
            { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Previous Hunk" },
            { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next Hunk" },
            { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",                desc = "Reset Hunk" },
        }
    },
    {
        "sindrets/diffview.nvim",
        opts = {
            use_icons = true,
        },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
        }
    },
    {
        "kdheepak/lazygit.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGitCurrentFile<cr>", desc = "Open Lazygit" },
        }
    },
}
