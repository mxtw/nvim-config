-- code completion
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
        -- TODO scroll docs

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

vim.opt.completeopt = "menuone,noinsert,noselect,preview"

-- lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- autoformatting
require("lsp-format").setup({})

vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = { "*.py" }, command = "Black" }
)

-- mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "dockerls",
        "gopls",
        "sumneko_lua",
        "pyright",
        "rust_analyzer",
        "terraformls",
        "tsserver",
        "yamlls",
    }
})

-- crates.io
require("crates").setup()

-- telescope binds
local tb = require("telescope.builtin")

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require("lsp-format").on_attach(client)

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, bufopts)
    -- vim.keymap.set('n', '<space>wl', function()
    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', function() tb.lsp_references() end, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- languages
require("lspconfig").pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- rust handled by rust-tools.nvim
require("rust-tools").setup({
    server = {
        on_attach = on_attach,
        standalone = false,
    }
})

require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").terraformls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").dockerls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").hls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            telemetry = {
                enable = false,
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            }
        },
    },
})
