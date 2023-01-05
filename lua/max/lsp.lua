local lsp = require("lsp-zero")
local lsp_format = require("lsp-format")

-- set the recommended preset
lsp.preset("recommended")

-- ensure some common servers
lsp.ensure_installed({
    "bashls",
    "clangd",
    "dockerls",
    "eslint",
    "gopls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "terraformls",
    "tsserver",
    "yamlls",
})

-- custom cmp sources
lsp.setup_nvim_cmp({
    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "orgmode" },
        { name = "path" },
        { name = "crates" },
    }
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

-- rust specifics
require("crates").setup()

local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.setup()

-- Initialize rust_analyzer with rust-tools
require('rust-tools').setup({ server = rust_lsp })


-- python specifics
vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    { pattern = { "*.py" }, command = "Black" }
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

