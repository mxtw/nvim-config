return {
    {
        "stevearc/oil.nvim",
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
            },
            skip_confirm_for_simple_edits = true,
        },
        lazy = false,
        keys = {
            { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" }
        }
    },

    {
        "folke/flash.nvim",
        opts = {
            jump = {
                autojump = false
            }
        },
        event = "VeryLazy",
        keys = {
            {
                "s",
                function()
                    require("flash").jump()
                end,
                desc = "Jump"
            },
            {
                "S",
                function()
                    require("flash").treesitter()
                end,
                desc = "Select with Treesitter"
            },
        }
    },

    { "windwp/nvim-autopairs", event = "VeryLazy", config = true },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>bu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" }
        }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")

            wk.add({
                { "<leader>a", group = "actions", mode = { "n", "v" } },
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code" },
                { "<leader>d", group = "debug" },
                { "<leader>f", group = "file" },
                { "<leader>g", group = "git" },
                { "<leader>h", group = "help" },
                { "<leader>n", group = "notes" },
                { "<leader>o", group = "open" },
                { "<leader>q", group = "quit" },
                { "<leader>w", group = "window" },
                { "<leader>z", group = "zen" },
            })
        end
    },

    {
        "luckasRanarison/nvim-devdocs",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {},
        cmd = { "DevdocsOpen", "DevdocsInstall", "DevdocsUpdate", "DevdocsUpdateAll" },
        keys = {
            { "<leader>hd", "<cmd>DevdocsOpen<cr>",    desc = "Open Devdocs" },
            { "<leader>hD", "<cmd>DevdocsInstall<cr>", desc = "Install Devdocs" }
        }
    },

    {
        'samharju/yeet.nvim',
        dependencies = {
            "stevearc/dressing.nvim"
        },
        cmd = 'Yeet',
        opts = {},
        keys = {
            {
                "<leader>yt",
                function() require("yeet").select_target() end,
                desc = "Set Yeet Target"
            },
            {
                "<leader>yc",
                function() require("yeet").set_cmd() end,
                desc = "Set Yeet Command"
            },
            {
                "<leader>yy",
                function() require("yeet").execute() end,
                desc = "Yeet"
            },
            {
                "<leader>yp",
                function() require("yeet").toggle_post_write() end,
                desc = "Toggle Post Write"
            },
        }
    }
}
