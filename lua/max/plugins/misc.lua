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
        cmd = "Oil",
        keys = {
            { "<leader>-", "<cmd>Oil<cr>", desc = "Oil" }
        }
    },

    {
        "David-Kunz/gen.nvim",
        config = {
            function()
                local gen = require("gen")

                gen.model = "mistral:instruct"
                gen.prompts["Generate_Code"] = {
                    prompt =
                    "Generate code based on the following description: '$input'. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
                    extract = "```$filetype\n(.-)```",
                    replace = true,
                }
            end
        },
        keys = {
            { "<leader>aa", "<cmd>Gen<cr>", desc = "Use ollama" },
            { "<leader>aa", ":Gen<cr>",     desc = "Use ollama", mode = "v" }, -- use : instead of <cmd> so it inserts the selection marks
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

    {
        "numToStr/Comment.nvim",
        opts = {
            mappings = {
                basic = false,
                extra = false,
            },
        },
        keys = {
            { "<leader>a;", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Toggle Comment" }
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
    { "metakirby5/codi.vim",   cmd = "Codi" },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")

            wk.register({
                a = { name = "actions" },
                b = { name = "buffer" },
                c = { name = "code" },
                d = { name = "debug" },
                f = { name = "file" },
                g = { name = "git" },
                h = { name = "help" },
                n = { name = "notes" },
                o = { name = "open" },
                q = { name = "quit" },
                w = { name = "window" },
                z = { name = "zen" },
            }, { prefix = "<leader>" })

            wk.register({
                a = { name = "actions" }
            }, { prefix = "<leader>", mode = "v" })
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
