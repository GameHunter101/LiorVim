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
            ["<C-d>"] = { "scroll_documentation_down", "fallback" }
        },
        appearance = { nerd_font_variant = "mono" },
        completion = {
            documentation = { auto_show = true },
            list = {
                selection = {
                    preselect = true,
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
        fuzzy = { implementation = "prefer_rust_with_warning" },

    },
    opts_extend = { "sources.default" },
}
