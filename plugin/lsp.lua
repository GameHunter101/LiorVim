require("lazyload").on_vim_enter(function()
    vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities()
    })

    local config = {
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "󰌶",
                [vim.diagnostic.severity.INFO] = "",
            },
        },
        update_in_insert = true,
        underline = true,
        -- severity_sort = true,
        --[[float = {
            border = "solid",
            source = false,
            header = "",
            prefix = "",
            suffix = "",
        },--]]
        -- virtual_text = false,
        -- virtual_lines = true,
    }

    vim.lsp.codelens.enable()


    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.foldingRange = {
        dynamicRegistration = true,
        lineFoldingOnly = true,
    }

    capabilities.textDocument.semanticTokens.multilineTokenSupport = true
    capabilities.textDocument.completion.completionItem.snippetSupport = true


    vim.diagnostic.config(config)

    vim.lsp.config("luals", {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc" },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    })

    local servers = {
        "clangd",
        "tinymist",
        "lua_ls",
    }
    vim.lsp.enable(servers)

    vim.lsp.config("clangd", {
        cmd = {
            "clangd",
            "--fallback-style=chromium"
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }
    })

    vim.lsp.config("tinymist", {
        filetypes = {"typst"}
    })
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
            local opts = { buffer = e.buf }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count = 1, float = true}) end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count = -1, float = true}) end, opts)
            vim.keymap.set("n", "do", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
            vim.keymap.set("n", "cl", function () vim.lsp.codelens.run() end)
        end
    })
end)
