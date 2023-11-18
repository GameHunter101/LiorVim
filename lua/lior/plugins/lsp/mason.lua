return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup({

            ensure_installed = {
                "tsserver",
                "html",
                "css",
                "tailwindcss",
                "lua_ls",
                "rust_analyzer",
                "pyright"
            },
            automatic_installation = true,
        })

    end
}
