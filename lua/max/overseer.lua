local overseer = require("overseer")

overseer.setup()

-- python templates
-- TODO add support for tests etc
overseer.register_template({
    name = "python run current",
    builder = function(params)
        return {
            cmd = { "python" },
            args = { vim.fn.expand("%:p") },
        }
    end,
    condition = {
        filetype = { "python" },
    },
})

-- bash templates
overseer.register_template({
    name = "bash run current",
    builder = function(params)
        return {
            cmd = { "bash" },
            args = { vim.fn.expand("%:p") },
        }
    end,
    condition = {
        filetype = { "bash", "sh" },
    },
})

-- go templates
-- TODO add support for tests etc
overseer.register_template({
    name = "go run",
    builder = function(params)
        return {
            cmd = { "go" },
            args = { "run", vim.fn.expand("%:p") },
        }
    end,
    condition = {
        filetype = { "go" },
    },
})

overseer.register_template({
    name = "go build",
    builder = function(params)
        return {
            cmd = { "go" },
            args = { "build", vim.fn.expand("%:p") },
        }
    end,
    condition = {
        filetype = { "go" },
    },
})
