require("lazyload").on_vim_enter(function ()
    vim.pack.add({
       { src = "https://github.com/nvim-tree/nvim-web-devicons"},
        { src = "https://github.com/folke/trouble.nvim"}
    })
    require("trouble").setup({
        auto_close = true,
        focus = true,
        mode = {
            lsp_base = {
                params = {
                    include_current = true
                }
            }
        }
    })

    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
    vim.keymap.set("n", "<leader>q", "<cmd>Trouble qflist toggle<CR>")
    vim.keymap.set("n", "<leader>gr", "<cmd>Trouble lsp toggle<CR>")
end)
