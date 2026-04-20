require("lazyload").on_vim_enter(function()
    vim.pack.add({
        "https://github.com/MunifTanjim/nui.nvim",
        "https://github.com/nvim-tree/nvim-web-devicons",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/SuperBo/fugit2.nvim"
    })

    require("fugit2").setup({
        libgit2_path = "C:\\ProgramData\\chocolatey\\lib\\libgit2\\tools\\libgit2.dll"
    })

    vim.keymap.set("n", "<leader>gs", "<cmd>Fugit2<CR>")
end)
