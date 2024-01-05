return {
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
                    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
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
        },
        config = function()
            local lsp_format = require("lsp-format")
            lsp_format.setup()

            local tb = require("telescope.builtin")


            vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float)

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP Actions",
                callback = function(event)
                    local opts = { noremap = true, silent = true, buffer = event.buf }

                    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<space>cr', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gr', function() tb.lsp_references() end, opts)

                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                end
            })

            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                lsp_format.on_attach(client, bufnr)
            end

            local default_setup = function(server)
                require("lspconfig")[server].setup({
                    capabilities = lsp_capabilities,
                    on_attach = on_attach,
                })
            end

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
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
                },
                handlers = {
                    default_setup,
                },
            })

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
