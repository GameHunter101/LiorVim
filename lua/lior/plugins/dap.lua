return {
    "rcarriga/nvim-dap-ui",
    version = "4.0.0",
    dependencies = {
        "mfussenegger/nvim-dap",
        "folke/neodev.nvim",
        "nvim-neotest/nvim-nio",
        {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && move dist out",
        },
        {
            "mxsdev/nvim-dap-vscode-js",
            config = function()
                require("dap-vscode-js").setup({
                    debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
                })
            end
        }
    },
    config = function()
        local dap = require("dap")
        dap.adapters.codelldb = {
            type = 'server',
            port = "${port}",
            executable = {
                command = "C:\\Users\\liors\\AppData\\Local\\nvim\\codelldb\\extension\\adapter\\codelldb.exe",
                args = { "--port", "${port}" },
            }
        }
        --[[ dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                -- 💀 Make sure to update this path to point to your installation
                args = { "C:\\Users\\liors\\AppData\\Local\\nvim\\js-debug-dap-v1.100.0\\js-debug\\src\\dapDebugServer.js", "${port}" },
            }
        } ]]

        dap.configurations.rust = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
            }
        }

        dap.configurations.c = dap.configurations.rust;
        dap.configurations.cpp = dap.configurations.rust;

        dap.configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,
            },
            {
                type = "pwa-node",
                request = "attach",
                name = "Attach",
                processId = require("dap.utils").pick_process,
                cwd = "${workspaceFolder}",
                sourceMaps = true,
            }
        }

        require("neodev").setup({
            library = {
                plugins = {
                    "nvim-dap-ui"
                },
                types = true
            },
        })

        local dapui = require("dapui")
        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>db", function() dapui.toggle() end)
        vim.keymap.set("n", "<leader>dk", function() dapui.eval() end)

        vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
        vim.keymap.set('n', '<S-F5>', function() require('dap').terminate() end)
        vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
        vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
        vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
        vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
        vim.keymap.set('n', '<Leader>lp',
            function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
            require('dap.ui.widgets').hover()
        end)
        vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
            require('dap.ui.widgets').preview()
        end)
        vim.keymap.set('n', '<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end)
        vim.keymap.set('n', '<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end)

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
    end
}
