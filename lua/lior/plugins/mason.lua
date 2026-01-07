return {
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        event = { "VeryLazy", "BufReadPre", "BufNewFile" },
        opts =
        {
            ensure_installed = {
                "clangd",
                "tinymist",
            },
            automatic_enable = true,
        }
    }
}
