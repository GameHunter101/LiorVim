vim.pack.add({"https://github.com/tiagovla/tokyodark.nvim"})
require("tokyodark").setup({
    -- transparent_background = true,
    gamma = 0.9,
    styles = {
        comments = { italic = true },
        keywords = { italic = false }, -- style for keywords
        identifiers = { italic = true }, -- style for identifiers
        functions = {},          -- style for functions
        variables = {},          -- style for variables
    },
})

vim.cmd("colorscheme tokyodark")
