require("lazyload").on_vim_enter(function()
    vim.pack.add({
        { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
        { src = "https://github.com/rafamadriz/friendly-snippets" },
    })

    require("blink.cmp").setup({
        keymap = {
            preset = "default",
            ["<C-b>"] = { "show" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            ["<C-n>"] = { "select_next", "fallback" },
            ["<C-p>"] = { "select_prev", "fallback" },
            ["<Tab>"] = false,
            ["<S-Tab>"] = false,
        },
        appearance = { nerd_font_variant = "mono" },
        completion = {
            documentation = { auto_show = true },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false,
                }
            },
            ghost_text = { enabled = true },
            menu = {
                draw = {
                    treesitter = { "lsp" }
                }
            },
        },
        signature = {
            enabled = true,
            trigger = { show_on_insert = true }
        },
        sources = { default = { "lsp", "path", "snippets" } },
        fuzzy = { implementation = "prefer_rust" },
    })
end)
