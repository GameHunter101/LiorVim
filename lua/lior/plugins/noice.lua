return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            opts = {
                on_open = function (win)
                    local config = vim.api.nvim_win_get_config(win)
                    config.border = "solid"
                    vim.api.nvim_win_set_config(win, config)
                end
            }
        },
    },
    config = function()
        require("noice").setup({
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
                hover = {
                    enabled = false,
                    silent = false,
                },
                message = {
                    enabled = false,
                }
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            views = {
                notify = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                split = {
                    enter = true,
                    border = { style = "none", padding = { 1, 2 } },
                },
                vsplit = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                popup = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                mini = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                cmdline = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                cmdline_popup = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                cmdline_output = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                messages = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                confirm = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                hover = {
                    border = { style = "none", padding = { 1, 2 } },
                },
                popupmenu = {
                    border = { style = "none", padding = { 1, 2 } },
                },
            },
        })
    end
}
