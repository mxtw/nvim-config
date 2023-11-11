local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- dependency stuff
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",

    -- git stuff
    { "tpope/vim-fugitive",                         event = "VeryLazy" },
    { "lewis6991/gitsigns.nvim",                    event = "VeryLazy" },
    { "sindrets/diffview.nvim",                     event = "VeryLazy" },
    { "kdheepak/lazygit.nvim",                      event = "VeryLazy" },

    -- telescope
    { "nvim-telescope/telescope.nvim",              branch = "0.1.x",   event = "VeryLazy" },
    { "nvim-telescope/telescope-file-browser.nvim", event = "VeryLazy" },
    { 'nvim-telescope/telescope-fzf-native.nvim',   build = 'make' },

    -- lsp
    { "VonHeikemen/lsp-zero.nvim",                  event = "VeryLazy" },
    { "neovim/nvim-lspconfig",                      event = "VeryLazy" },
    { "L3MON4D3/LuaSnip",                           event = "VeryLazy" },
    { "rafamadriz/friendly-snippets",               event = "VeryLazy" },
    { "lukas-reineke/lsp-format.nvim",              event = "VeryLazy" },
    { "williamboman/mason.nvim",                    event = "VeryLazy" },
    { "williamboman/mason-lspconfig.nvim",          event = "VeryLazy" },
    { "folke/trouble.nvim",                         event = "VeryLazy" },

    -- filetype specifics
    --- rust
    { "saecki/crates.nvim",                         ft = "toml" },
    { "simrat39/rust-tools.nvim",                   ft = "rust" },
    --- python
    { "psf/black",                                  ft = "python" },
    --- csv
    { "mechatroner/rainbow_csv",                    ft = "csv" },

    -- completion
    { "hrsh7th/cmp-nvim-lsp",                       event = "VeryLazy" },
    { "hrsh7th/cmp-buffer",                         event = "VeryLazy" },
    { "hrsh7th/cmp-path",                           event = "VeryLazy" },
    { "saadparwaiz1/cmp_luasnip",                   event = "VeryLazy" },
    { "hrsh7th/nvim-cmp",                           event = "VeryLazy" },

    -- debugging
    { "mfussenegger/nvim-dap",                      event = "VeryLazy" },
    { "rcarriga/nvim-dap-ui",                       event = "VeryLazy" },
    { "theHamsta/nvim-dap-virtual-text",            event = "VeryLazy" },

    -- colorschemes
    { "catppuccin/nvim",                            name = "catppuccin" },

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

})
