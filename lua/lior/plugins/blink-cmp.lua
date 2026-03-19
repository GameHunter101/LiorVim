return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
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
                border = "solid",
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

    },
    opts_extend = { "sources.default" },
}
