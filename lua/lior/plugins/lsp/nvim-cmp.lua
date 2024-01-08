return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function ()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function (args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = {
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["C-n"] = cmp.mapping.select_next_item(),
                ["C-p"] = cmp.mapping.select_prev_item(),
                ["<C-c>"] = cmp.mapping.abort(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        })

        cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
        )
    end
}