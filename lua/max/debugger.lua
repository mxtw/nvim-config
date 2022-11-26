local dap = require("dap")

-- virtualtext setup
require("nvim-dap-virtual-text").setup()

-- dapui
local dapui = require("dapui")
dapui.setup()

-- auto open dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.after.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.open()
end

-- python
dap.adapters.python = {
    type = "executable";
    command = "/usr/bin/python";
    args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return "/usr/bin/python"
        end;
    },
}

-- lldb (rust, c, cpp)
dap.adapters.lldb = {
    type = "executable";
    command = "/usr/bin/lldb-vscode";
    name = "lldb";
}

dap.configurations.rust = {
    {
        type = "lldb";
        request = "launch";
        name = "Launch file";
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end;
        cwd = "${workspaceFolder}"
    },
}

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

-- delve (go)
dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

-- nodejs (need to install 'node-debug2-adapter' with mason)
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}
