return {
    "RaafatTurki/hex.nvim",
    config = function ()
        local hex = require("hex")
        hex.setup()
        vim.keymap.set("n", "<leader>he", function() hex.toggle() end)
    end
}
