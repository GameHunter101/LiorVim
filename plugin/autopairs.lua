require("lazyload").on_vim_enter(function ()
    vim.pack.add({"https://github.com/altermo/ultimate-autopair.nvim"})

    require("ultimate-autopair").setup({
        {"$", "$"},
    })
end)
