return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",

            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            { "antosha417/nvim-lsp-file-operations", config = true },
            "j-hui/fidget.nvim",
        },
        config = function()
            require("fidget").setup({})
            require("mason").setup()

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "tsserver",
                    "html",
                    "tailwindcss",
                    "lua_ls",
                    "rust_analyzer",
                    "pyright"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                },
            })

            local cmp = require("cmp")

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["C-n"] = cmp.mapping.select_next_item(cmp_select),
                    ["C-p"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true })
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = "path" },
                    { name = "buffer" },
                }),
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

            local lspui = require("lspconfig.ui.windows")
            lspui.default_options.border = "double"

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })
        end

    }
}
