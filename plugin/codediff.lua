require("lazyload").on_vim_enter(function()
    vim.pack.add({"https://github.com/esmuellert/codediff.nvim"})

    require("codediff").setup({
        explorer = {
            view_mode = "tree",
            flatten_dirs = "false",
        }
    })

    vim.keymap.set("n", "<leader>gd", "<cmd>CodeDiff<CR>")
end)
