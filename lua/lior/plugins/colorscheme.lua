return {
    --[[ {
        "ramojus/mellifluous.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("mellifluous").setup({
                colorset = "mountain",
                mountain = {
                    color_overrides = {
                        dark = {
                            colors = function(colors)
                                return {
                                    main_keywords = "#c82b1d",
                                    operators = colors.functions:desaturated(4)
                                }
                            end
                        }
                    }
                }
            })
            vim.cmd("colorscheme mellifluous")
        end
    }, ]]
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- transparent_background = true,
            gamma = 0.9,
            styles = {
                comments = { italic = true },
                keywords = { italic = false }, -- style for keywords
                identifiers = { italic = true }, -- style for identifiers
                functions = {},          -- style for functions
                variables = {},          -- style for variables
            },
        },
        config = function(_, opts)
            require("tokyodark").setup(opts)
            vim.cmd("colorscheme tokyodark")
        end,
    }
}
