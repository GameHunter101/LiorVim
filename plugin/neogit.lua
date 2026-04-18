require("lazyload").on_vim_enter(function ()
    vim.pack.add({
        {src = "https://github.com/neogitorg/neogit"},
        {src = "https://github.com/nvim-lua/plenary.nvim"},
        {src = "https://github.com/esmuellert/codediff.nvim"}
    })

    require("neogit").setup({
        mappings = {
            status = {
                ["Q"] = false,
                ["G"] = "Command"
            }
        }
    })


    vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>")
end)
