local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
    -- dependency stuff
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")

    -- git stuff
    use("TimUntersberger/neogit")
    use({
        "tanvirtin/vgit.nvim",
        config = function() require("vgit").setup() end
    })

    -- telescope
    use("nvim-telescope/telescope-file-browser.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x"
    })

    -- lsp
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("lukas-reineke/lsp-format.nvim")
    use("psf/black")

    -- debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- colorschemes
    use({
        "dracula/vim",
        as = "dracula"
    })
    use("folke/tokyonight.nvim")

    -- visual stuff
    use("vim-airline/vim-airline")
    use("ap/vim-css-color")
    use("folke/which-key.nvim")

    use("nvim-treesitter/nvim-treesitter")
    use({"nvim-treesitter/nvim-treesitter-context",
        config = function() require("nvim-treesitter-context") end
    }) -- sticky headers

    -- other
    use({
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end
    })

    use("nvim-orgmode/orgmode")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
