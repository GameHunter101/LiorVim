return {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
        indent = {
            char = "▏"
        },
        scope = {
            enabled = false
        },
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "lazy",
                "mason",
            }
        }
    },
    main = "ibl",
}
