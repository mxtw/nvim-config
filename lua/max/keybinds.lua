vim.g.mapleader = " " -- set leader key to space


local wk = require("which-key")

-- for plugin specific binds
local dap = require("dap") -- for binding dap stuff
local tb = require("telescope.builtin")
local te = require("telescope").extensions

-- which-key binds
wk.register({
    f = {
        name = "file",
        f = { function() te.file_browser.file_browser() end, "File Browser" },
        p = { function()
            te.file_browser.file_browser({
                path = "$HOME/.config/nvim",
                depth = 3,
            })
        end, "Neovim Config Files" },
        r = { function() tb.oldfiles() end, "Recent Files" },
    },
    n = {
        name = "notes",
        f = { function()
            te.file_browser.file_browser({
                path = "$HOME/org",
            })
        end, "Org Files" },
        s = { function()
            tb.live_grep({
                cwd = "$HOME/org",
            })
        end, "Search Notes" },
    },
    g = {
        name = "git",
        g = { "<cmd>Git<cr>", "Open Fugitive" },
        d = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
        b = { function() tb.git_branches() end, "List Branches" },
        p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
        k = { "<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk" },
        j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
        u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    },
    w = {
        name = "window",
        s = { "<cmd>split<cr>", "Horizontal Split" },
        v = { "<cmd>vsplit<cr>", "Vertical Split" },
        l = { "<cmd>vertical resize +10<cr>", "increase width" },
        h = { "<cmd>vertical resize -10<cr>", "decrease width" },
        k = { "<cmd>resize +5<cr>", "increase height" },
        j = { "<cmd>resize -5<cr>", "decrease heigth" },
    },
    c = {
        name = "code",
        x = { function() tb.diagnostics() end, "Diagnostics" },
        s = { function() tb.lsp_document_symbols() end, "Workspace Symbols" },
        S = { function() tb.lsp_workspace_symbols() end, "Symbols" },
        D = { function() toggle_diagnostics() end, "Toggle Diagnostics" },
        t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
    },
    a = {
        name = "actions",
        [";"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment linewise", mode = "v" },
    },
    o = {
        name = "open",
    },
    h = {
        name = "help",
        h = { function() tb.help_tags() end, "Help Tags" },
        n = { function() te.notify.notify() end, "Notifications" },
        m = { function() tb.man_pages() end, "Man Pages" },
        t = { function() tb.colorscheme() end, "Colorscheme" },
    },
    b = {
        name = "buffer",
        k = { "<cmd>bd<cr>", "Close Current Buffer" },
        u = { "<cmd>UndotreeToggle<cr>", "Undotree" },
    },
    q = {
        name = "quit",
        q = { "<cmd>xa<cr>", "Save Buffers and Quit" },
        Q = { "<cmd>qa!<cr>", "Quit without saving" },
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
        t = { function() dap.terminate() end, "Terminate Session" },
    },
    [","] = { function() tb.buffers() end, "List Buffers" },
    ["/"] = { function() tb.live_grep() end, "Grep CWD" },
    [" "] = { function() tb.find_files() end, "Find Files" },
}, { prefix = "<leader>" })

-- other binds
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- make esc key work in terminal
vim.keymap.set("n", "<Leader>.", "<C-^>")   -- alternate-file to more convenient keybind
