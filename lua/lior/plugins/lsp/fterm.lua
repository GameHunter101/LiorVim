return {
    {
        "numToStr/FTerm.nvim",
        config = function ()
            require("FTerm").setup({
                border = "single",
                cmd = os.getenv("SHELL") or "powershell"
            })
            vim.keymap.set("n", "<C-t>", "<CMD>lua require('FTerm').toggle()<CR>")
            vim.keymap.set("t", "<C-t>", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>")
            vim.keymap.set("t", "<C-a>", "<C-\\><C-n>")
        end
    }
}
