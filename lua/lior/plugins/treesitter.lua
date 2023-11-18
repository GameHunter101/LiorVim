return {
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        local configs = require("nvim-treesitter.configs")
        local install = require("nvim-treesitter.install")

        install.update({ with_sync = true })()

        configs.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "rust",
                "javascript",
                "typescript",
                "python",
                "html",
                "css",
                "json",
                "tsx",
                "markdown",
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-n>",
                    node_incremental = "<C-n>",
                    scope_incremental = false,
                    node_decremental = "<C-p>"
                }
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,


            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        })
    end,
}
