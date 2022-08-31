vim.g.mapleader = " " -- set leader key to space

local wk = require("which-key")

-- plugin specific binds
local dap = require("dap") -- for binding dap stuff
local tb = require("telescope.builtin")
local te = require("telescope").extensions

wk.register({
    f = {
        name = "file",
        f = { function() te.file_browser.file_browser() end, "File Browser" },
        p = { function() te.file_browser.file_browser({
            path = "$HOME/.config/nvim",
            depth = 2,
        }) end, "Neovim Config Files" },
        r = { function() tb.oldfiles() end, "Recent Files" },
    },
    n = {
        name = "notes",
        f = { function() te.file_browser.file_browser({
            path = "$HOME/org",
        }) end, "Org Files" },
    },
    g = {
        name = "git",
        g = { "<cmd>Neogit<cr>", "Open Neogit" },
        b = { function() tb.git_branches() end , "List Branches" },
        p = { "<cmd>VGit buffer_hunk_preview<cr>", "Preview Hunk" },
        k = { "<cmd>VGit hunk_up<cr>", "Previous Hunk" },
        j = { "<cmd>VGit hunk_down<cr>", "Next Hunk" },
    },
    w = {
        name = "window",
        s = { "<cmd>split<cr>", "Horizontal Split" },
        v = { "<cmd>vsplit<cr>", "Vertical Split" },
    },
    c = {
        name = "code",
        x = {  function() tb.diagnostics() end, "Diagnostics" },
        s = {  function() tb.lsp_document_symbols() end, "Symbols" },
        c = {  function() tb.command_history() end, "Command History" },
    },
    o = {
        name = "open",
    },
    h = {
        name = "help",
        h = { function() tb.help_tags() end, "Help Tags" },
        m = { function() tb.man_pages() end, "Man Pages" },
        t = { function() tb.colorscheme() end, "Colorscheme" },
    },
    p = {
        name = "project",
        p = { function() te.project.project() end, "List Projects" },
    },
    q = {
        name = "quit",
        q = { "<cmd>x<cr>", "Save Buffer and Quit" },
        Q = { "<cmd>q!<cr>", "Quit without saving" },
    },
    d = {
        name = "debug",
        c = { function() dap.continue() end, "Continue" },
        r = { function() dap.run_to_cursor() end, "Run To Cursor" },
        s = { function() dap.step_into() end, "Step Into" },
        o = { function() dap.step_over() end, "Step Over" },
        u = { function() dap.step_out() end, "Step Out" },
        b = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint" },
        B = { function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, "Set Breakpoint (conditional)" }, -- stolen from theprimeagen
    },
    [","] = { function() tb.buffers() end, "List Buffers" },
    ["/"] = { function() tb.live_grep() end, "Grep CWD" },
    [" "] = { function() tb.find_files() end, "Find Files" },
}, { prefix = "<leader>" })
