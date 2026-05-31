require("lazyload").on_vim_enter(function()
    vim.pack.add({
        { src = "https://github.com/igorlfs/nvim-dap-view" },
        { src = "https://codeberg.org/mfussenegger/nvim-dap" },
    })

    require("dap-view").setup({
        windows = {
            position = "right"
        }
    })

    local dap = require('dap')
    dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
        -- detached = false,
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
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    vim.keymap.set("n", "<leader>db", "<cmd>DapViewToggle<CR>")
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

    vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
    vim.keymap.set("n", "<S-F5>", function() require("dap").terminate() end)
    vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
    vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
    vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
    vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end)
    vim.keymap.set("n", "<Leader>B", function() require("dap").set_breakpoint() end)
    vim.keymap.set("n", "<Leader>lp",
        function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
        require("dap.ui.widgets").hover()
    end)
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
        require("dap.ui.widgets").preview()
    end)
    vim.keymap.set("n", "<Leader>df", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<Leader>ds", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
    end)

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
end)
