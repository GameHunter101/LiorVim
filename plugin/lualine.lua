require("lazyload").on_vim_enter(function()
    vim.pack.add({
        'https://github.com/nvim-tree/nvim-web-devicons',
        'https://github.com/nvim-lualine/lualine.nvim'
    })

    require("lualine").setup({
        options = {
            disabled_filetypes = {
                statusline = {"alpha"}
            },
            refresh = {
                statusline = 500,
            },
            component_separators = "",
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_b = {
                {
                    "filename",
                    symbols = {
                        modified = "",
                        readonly = "󰛐"
                    }
                },
                "diff",
                {
                    "diagnostics",
                    update_in_insert = true
                },
            },
            lualine_c = {},
            --[[ lualine_c = {
                {
                    "buffers",
                    mode = 2
                }
            }, ]]
            lualine_x = {"searchcount", "lsp_status", "filetype"},
            lualine_y = {"progress" }
        }
    })
end)
