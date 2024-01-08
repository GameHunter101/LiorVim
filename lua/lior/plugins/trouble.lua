return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            height = 20,
            action_keys = {
                open_split = { "<C-s>" },
                close = "<C-q>",
                open_tab = { "<cr>" },
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
