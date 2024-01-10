return {
    {
        "nvimdev/lspsaga.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        event = "LspAttach",
        config = function()
            local lspsaga = require("lspsaga")
            lspsaga.setup({
                symbol_in_winbar = {
                    enable = false
                },
                definition = {
                    keys = {
                        edit = "i",
                        vsplit = "sv",
                        split = "sh",
                        close = "<C-x>",
                    }
                },
                finder = {
                    keys = {
                        shuttle = "<C-k>",
                        toggle_or_open = "<CR>",
                        vsplit = "sv",
                        split = "sh",
                        close = "<C-x>"
                    }
                },
                rename = {
                    keys = {
                        quit = "<C-x>",
                    }
                },
            })

        vim.keymap.set("n", "ca", ":Lspsaga code_action<cr>")
        vim.keymap.set("n", "pd", ":Lspsaga peek_definition<cr>")
        vim.keymap.set("n", "gd", ":Lspsaga goto_definition<cr>")
        vim.keymap.set("n", "pt", ":Lspsaga peek_type_definition<cr>")
        vim.keymap.set("n", "gt", ":Lspsaga goto_type_definition<cr>")
        vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<cr>")
        vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>")
        vim.keymap.set("n", "<leader>lf", ":Lspsaga finder<cr>")
        vim.keymap.set({"n", "t"}, "<C-t>", "<cmd>Lspsaga term_toggle<cr>")
        vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
        vim.keymap.set("n", "<F12>", ":Lspsaga rename<cr>")

        end
    }
}
