require("lazyload").on_vim_enter(function()
    vim.pack.add({ "https://github.com/stevearc/quicker.nvim" })

    require("quicker").setup({
        keys = {
            {
                ">",
                function()
                    require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
                end,
                desc = "Expand quickfix context",
            },
            {
                "<",
                function()
                    require("quicker").collapse()
                end,
                desc = "Collapse quickfix context",
            },
        },
        borders = {
            vert = "│",
            strong_header = "─",
            strong_cross = "┼",
            strong_end = "┤",
        }
    })
    vim.keymap.set("n", "<leader>q", function() require("quicker").toggle() end)
end)
