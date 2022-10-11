-- some custom functions

-- toggle visibility of diagnostics
local diag_enabled = true
function toggle_diagnostics()
    if diag_enabled then
        vim.diagnostic.hide()
        diag_enabled = false
    else
        vim.diagnostic.show()
        diag_enabled = true
    end
end
