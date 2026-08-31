require("lazyload").on_vim_enter(function()
    --[[ vim.pack.add({'https://github.com/vieitesss/minifugit.nvim'})

    require("minifugit").setup()
    vim.keymap.set("n", "<leader>gs", require("minifugit").status) ]]

    vim.pack.add({"https://github.com/Darkskittlz/GitCompanion"})
    require("gitcompanion").setup({})

    vim.keymap.set("n", "<leader>gs", "<CMD>GitCompanion<CR>")
end)
