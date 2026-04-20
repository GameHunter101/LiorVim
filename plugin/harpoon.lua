require("lazyload").on_vim_enter(function()
    vim.pack.add({
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        {
            src = "https://github.com/ThePrimeagen/harpoon",
            version = "harpoon2"
        }
    })

    require("harpoon").setup()
end)
