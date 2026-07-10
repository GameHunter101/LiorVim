require("lazyload").on_vim_enter(function()
    vim.pack.add({'https://github.com/vieitesss/minifugit.nvim'})

    require("minifugit").setup()
    vim.keymap.set("n", "<leader>gs", require("minifugit").status)
end)
