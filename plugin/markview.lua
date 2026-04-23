vim.pack.add({"https://github.com/OXY2DEV/markview.nvim"})

require("markview").setup({
    markdown = {
        enable = true,
    },
    latex = {
        enable = true,
    },
    typst = {
        enable = true,
        subscripts = {
            fake_preview = false,
        },
        superscripts = {
            fake_preview = false,
        }
    }
})
