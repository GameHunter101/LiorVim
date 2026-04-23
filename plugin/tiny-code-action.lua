require("lazyload").on_vim_enter(function ()
    vim.pack.add({"https://github.com/rachartier/tiny-code-action.nvim"})

    require("tiny-code-action").setup({
        picker = {
            "buffer",
        }
    })

    vim.keymap.set({"n", "x"}, "<leader>ca", require("tiny-code-action").code_action)
end)
