--[[ vim.pack.add({"https://github.com/tiagovla/tokyodark.nvim"})
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

vim.cmd("colorscheme tokyodark") ]]

vim.pack.add({"https://github.com/folke/tokyonight.nvim"})

require("tokyonight").setup({
    style = "night",
    on_colors = function(colors)
        colors.bg = "#161722"
        colors.bg_dark = "#0A0F28"
        colors.bg_dark1 = "#120E22"
        colors.bg_float = "#120E22"
    end
})

vim.cmd("colorscheme tokyonight")
