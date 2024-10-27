return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
        { "rafamadriz/friendly-snippets" },
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lsp = require("lsp-zero").preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
        lsp.ensure_installed({
            "codelldb",
            "clangd",
            "tsserver",
        })

        lsp.configure("clangd", {
            cmd = {
                "C:\\Users\\liors\\scoop\\apps\\mingw-winlibs-llvm\\current\\bin\\clangd",
                "--fallback-style=chromium"
            }
        })
        require("lspconfig").typst_lsp.setup({
            settings = {
                exportPdf = "onSave",
            }
        })

        lsp.setup()

        local cmp = require("cmp")

        cmp.setup({
            mapping = {
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end
            }
        })

        local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            signs = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
