return {

    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.*",
        config = function()
            local ls = require("luasnip")
            require("luasnip.loaders.from_vscode").lazy_load()

            vim.keymap.set("i", "<C-K>", function() ls.expand() end, { silent = true })
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, { silent = true })
        end
    }

}
