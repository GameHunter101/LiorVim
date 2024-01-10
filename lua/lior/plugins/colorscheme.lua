return {
    "uncleTen276/dark_flat.nvim",
	lazy = false,
	priority = 1000,
	config = function()
        require("dark_flat").setup({
            colors = {
                gray = "#61646A",
                cyan = "#3EDAD2",
                light_green = "#F69E09",
                -- pink = "#C9304C",
                dark_gray = "#3C3C44",
            },
            themes = function(colors)
                return {
                    ["@lsp.mod.documentation"] = { link = "@lsp.type.comment"}
                }
            end,
            italics = false,
        })
        vim.cmd("colorscheme dark_flat")
    end,
}
