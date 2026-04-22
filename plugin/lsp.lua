require("lazyload").on_vim_enter(function()
    vim.pack.add({
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/mason-org/mason.nvim" },
        { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
        { src = "https://github.com/zapling/mason-lock.nvim" },
    })

    require("mason").setup({ PATH = "append" })

    require("mason-lspconfig").setup({
        automatic_enable = true
    })

    require("mason-lock").setup({
        lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json"
    })

    local ensure_installed = {
        "tinymist",
        "codelldb",
        "lua-language-server",
        "markdownlint",
        "clangd",
        "typescript-language-server"
    }

    local mason_registry = require("mason-registry")
    mason_registry.refresh(function()
        for _, pkg_name in ipairs(ensure_installed) do
            local ok, pkg = pcall(mason_registry.get_package, pkg_name)
            if ok and not pkg:is_installed() then
                pkg:install()
            end
        end
    end)

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

    -- vim.lsp.codelens.enable()


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
        filetypes = { "typst" }
    })
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(e)
            local opts = { buffer = e.buf }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
            vim.keymap.set("n", "do", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
            vim.keymap.set("n", "cl", function() vim.lsp.codelens.run() end)
        end
    })
end)
