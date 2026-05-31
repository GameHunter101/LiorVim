vim.pack.add({"https://github.com/folke/snacks.nvim"})

require("snacks").setup({
    input = {
        enabled = true
    },
    indent = {
        enabled = true
    },
    quickfile = {
        enabled = true
    },
    image = {
        enabled = true
    }
})
