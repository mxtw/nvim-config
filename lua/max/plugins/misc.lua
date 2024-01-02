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
            { "<leader>-", "<cmd>Oil<cr>" }
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
            { "<leader>aa", "<cmd>Gen<cr>" },
            { "<leader>aa", ":Gen<cr>",    mode = "v" }, -- use : instead of <cmd> so it inserts the selection marks
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
            { "s", function()
                require("flash").jump()
            end },
            { "S", function()
                require("flash").treesitter()
            end },
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
            { "<leader>a;", "<Plug>(comment_toggle_linewise_visual)", mode = "v" }
        }
    },

    { "windwp/nvim-autopairs", event = "VeryLazy", config = true },

    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>bu", "<cmd>UndotreeToggle<cr>" }
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



}
