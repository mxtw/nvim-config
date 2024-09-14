return {

    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = "markdown",
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },

    {
        "epwalsh/obsidian.nvim",
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            ui = {
                enable = false,
            },
            workspaces = {
                {
                    name = "notes",
                    path = "~/notes",
                },
            },
            daily_notes = {
                folder = "daily",
                date_format = "%Y-%m-%d",
                alias_format = "%B %-d, %Y",
                template = nil
            },
            templates = {
                subdir = "templates",
            },
            completion = {
                min_chars = 1,
            },
            notes_subdir = "notes",
            new_notes_location = "notes_subdir",
            note_id_func = function(title)
                -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                -- In this case a note with the title 'My new note' will be given an ID that looks
                -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                local suffix = ""
                if title ~= nil then
                    -- If title is given, transform it into valid file name.
                    suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                else
                    -- If title is nil, just add 4 random uppercase letters to the suffix.
                    for _ = 1, 4 do
                        suffix = suffix .. string.char(math.random(65, 90))
                    end
                end
                return tostring(os.time()) .. "-" .. suffix
            end,
        },
        keys = {
            { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "Find Notes" },
            { "<leader>ns", "<cmd>ObsidianSearch<cr>",      desc = "Search Note Contents" },
            { "<leader>nn", "<cmd>ObsidianNew<cr>",         desc = "Create New Note" },
            { "<leader>nc", "<cmd>ObsidianTemplate<cr>",    desc = "Insert Template" },
            { "<leader>no", "<cmd>ObsidianOpen<cr>",        desc = "Open in Obsidian" },
            { "<leader>na", "<cmd>e ~/notes/index.md<cr>",  desc = "Open Index" },
            { "<leader>nb", "<cmd>ObsidianBacklinks<cr>",   desc = "Show Backlinks" },
            { "<leader>nn", ":ObsidianLinkNew<cr>",         mode = "v",                   desc = "New Note from Selection" },

            { "<leader>nt", "<cmd>ObsidianToday<cr>",       desc = "Open Todays Note" },
            { "<leader>nm", "<cmd>ObsidianTomorrow<cr>",    desc = "Open Tomorrows Note" },
            { "<leader>ny", "<cmd>ObsidianYesterday<cr>",   desc = "Open Yesterdays Note" },
        }
    }
}
