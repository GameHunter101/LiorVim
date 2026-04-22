require("lazyload").on_vim_enter(function ()
    vim.pack.add({"https://github.com/numToStr/Comment.nvim"})

    require("Comment").setup({
        toggler = {
            line = "<C-s>",
            block = "<C-m>"
        },
        opleader = {
            block = "<C-m>"
        },
        mappings = {
            extra = false,
        }
    })

    vim.keymap.set("n", "<CR>", function () end)
end)
