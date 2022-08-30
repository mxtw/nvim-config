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

