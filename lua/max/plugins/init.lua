return {
    -- dependency stuff
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",

    -- lsp
    { "VonHeikemen/lsp-zero.nvim",         event = "VeryLazy" },
    { "neovim/nvim-lspconfig",             event = "VeryLazy" },
    { "L3MON4D3/LuaSnip",                  event = "VeryLazy" },
    { "rafamadriz/friendly-snippets",      event = "VeryLazy" },
    { "lukas-reineke/lsp-format.nvim",     event = "VeryLazy" },
    { "williamboman/mason.nvim",           event = "VeryLazy" },
    { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
    { "folke/trouble.nvim",                event = "VeryLazy" },

    -- filetype specifics
    --- rust
    { "saecki/crates.nvim",                ft = "toml" },
    { "simrat39/rust-tools.nvim",          ft = "rust" },
    --- python
    { "psf/black",                         ft = "python" },
    --- csv
    { "mechatroner/rainbow_csv",           ft = "csv" },

    -- completion
    { "hrsh7th/cmp-nvim-lsp",              event = "VeryLazy" },
    { "hrsh7th/cmp-buffer",                event = "VeryLazy" },
    { "hrsh7th/cmp-path",                  event = "VeryLazy" },
    { "saadparwaiz1/cmp_luasnip",          event = "VeryLazy" },
    { "hrsh7th/nvim-cmp",                  event = "VeryLazy" },

    -- debugging
    { "mfussenegger/nvim-dap",             event = "VeryLazy" },
    { "rcarriga/nvim-dap-ui",              event = "VeryLazy" },
    { "theHamsta/nvim-dap-virtual-text",   event = "VeryLazy" },

    -- colorschemes
    { "catppuccin/nvim",                   name = "catppuccin" },

    -- visual stuff
    "nvim-lualine/lualine.nvim",
    { "norcalli/nvim-colorizer.lua",         event = "VeryLazy" },
    "folke/which-key.nvim",
    "kyazdani42/nvim-web-devicons",
    { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
    { "akinsho/org-bullets.nvim",            ft = "org" },
    "MunifTanjim/nui.nvim",
    "folke/noice.nvim",
    { "folke/flash.nvim",       event = "VeryLazy" },
    { "folke/zen-mode.nvim",    event = "VeryLazy" },
    { "folke/twilight.nvim",    event = "VeryLazy" },
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",

    -- other
    { "windwp/nvim-autopairs", event = "VeryLazy" },
    { "nvim-orgmode/orgmode",  event = "VeryLazy" },
    { "mbbill/undotree",       event = "VeryLazy" },
    { "numToStr/Comment.nvim", event = "VeryLazy" },
    { "metakirby5/codi.vim",   event = "VeryLazy" },
    { "stevearc/oil.nvim",     event = "VeryLazy" },
    { "David-Kunz/gen.nvim",   event = "VeryLazy" },

}
