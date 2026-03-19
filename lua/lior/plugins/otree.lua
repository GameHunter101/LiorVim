return {
    {
        "Eutrius/Otree.nvim",
        lazy = false,
        dependencies = {
            "stevearc/oil.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("Otree").setup({
                keymaps = {
                    ["<C-h>"] = "actions.goto_home_dir",
                    ["<C-p>"] = "actions.goto_parent",
                    ["q"] = "actions.close_win",
                }
            })
            vim.keymap.set("n", "<C-e>", ":Otree<CR>")
        end
    }
}
