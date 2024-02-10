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
            local luasnip = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

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
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        local has_words_before = function()
                            unpack = unpack or table.unpack
                            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                            return col ~= 0 and
                                vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
                        end

                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ['<C-Space>'] = function(fallback)
                        if cmp.visible() then
                            cmp.close()
                        else
                            cmp.complete()
                        end
                    end,
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

                    -- TODO get this to work on nightly
                    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
                    -- if client.server_capabilities.inlayHintProvider then
                    --     vim.lsp.inlay_hint.enable(event.buf, true)
                    -- end

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

            vim.api.nvim_create_autocmd(
                { "BufWritePost" },
                { pattern = { "*.py" }, command = "!black %" }
            )

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
            { "<leader>ct", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" }
        },
        cmd = "TroubleToggle"
    },

    -- filetype specifics
    --- rust
    { "saecki/crates.nvim",      ft = "toml", config = true },
    --- csv
    { "mechatroner/rainbow_csv", ft = "csv" },
}
