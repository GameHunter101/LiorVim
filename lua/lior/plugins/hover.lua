return {
    "lewis6991/hover.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        local hover = require("hover")

        hover.setup({
            init = function ()
                require("hover.providers/lsp")
            end,
            preview_opts = {
                border = "rounded",
            },
            preview_window = false,
            title = false,
            mouse_providers = {
                "LSP"
            },
            mouse_delay = 1000
        })
        -- Setup keymaps
        vim.keymap.set("n", "K", hover.hover, {desc = "hover.nvim"})

    end
}
