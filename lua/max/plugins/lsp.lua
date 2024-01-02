return {
    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        lazy = true,
        config = false,
        init = function()
            vim.g.lsp_zero_extend_cmp = 0
            vim.g.lsp_zero_extend_lspconfig = 0
        end,
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = true,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
        },
        config = function()
            local cmp = require("cmp")
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ['<C-Space>'] = function(fallback)
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end,
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                },
                sources = {
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "orgmode" },
                    { name = "path" },
                    { name = "crates" },
                },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            { "lukas-reineke/lsp-format.nvim" },
            { "simrat39/rust-tools.nvim",         ft = "rust" },
        },
        config = function()
            local lsp = require("lsp-zero")
            local lsp_format = require("lsp-format")
            lsp_format.setup()

            -- set the recommended preset
            lsp.preset("recommended")

            -- ensure some common servers
            lsp.ensure_installed({
                "bashls",
                "clangd",
                "dockerls",
                "eslint",
                "gopls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "terraformls",
                "tsserver",
                "yamlls",
            })

            local tb = require("telescope.builtin")

            -- custom on_attach
            lsp.on_attach(
                function(client, bufnr)
                    -- lsp-format for autoformatting
                    lsp_format.on_attach(client)
                    local bufopts = { noremap = true, silent = true, buffer = bufnr }

                    -- some custom keybinds
                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, bufopts)
                    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                    vim.keymap.set('n', 'gr', function() tb.lsp_references() end, bufopts)
                end
            )

            local rust_lsp = lsp.build_options('rust_analyzer', {})

            lsp.setup()

            -- Initialize rust_analyzer with rust-tools
            require('rust-tools').setup({ server = rust_lsp })

            -- diagnostics
            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
                update_in_insert = false,
                underline = true,
                severity_sort = false,
                float = true,
            })
        end,
    },

    {
        "folke/trouble.nvim",
        config = true,
        keys = {
            { "<leader>ct", "<cmd>TroubleToggle<cr>" }
        },
        cmd = "TroubleToggle"
    },

    -- filetype specifics
    --- rust
    { "saecki/crates.nvim",      ft = "toml", config = true },
    --- python
    {
        "psf/black",
        ft = "python",
        config = function()
            vim.api.nvim_create_autocmd(
                { "BufWritePre" },
                { pattern = { "*.py" }, command = "Black" }
            )
        end
    },
    --- csv
    { "mechatroner/rainbow_csv", ft = "csv" },
}
