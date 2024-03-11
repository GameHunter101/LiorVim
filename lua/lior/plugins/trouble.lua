return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            height = 20,
            action_keys = {
                open_split = { "sh" },
                open_vsplit = {"sv"},
                close = "<C-x>",
                open_tab = { "<CR>" },
                jump_close = {"<CR>"}
            }
        })

        vim.keymap.set("n", "tn", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)

        vim.keymap.set("n", "tp", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end
}
