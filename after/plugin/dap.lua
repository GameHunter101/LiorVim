local status, dap = pcall(require, "dap")
if (not status) then return end

dap.adapters.codelldb = {
    type = "server",
    port = 13000,
    executable = {
        command = "C:\\Users\\liors\\.vscode\\extensions\\vadimcn.vscode-lldb-1.9.2\\adapter\\codelldb.exe",
        args = {"--port", "13000"},
        detached = false,
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}


vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>bs', function() dap.toggle_breakpoint() end)
