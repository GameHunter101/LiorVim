return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("Comment").setup({
            padding = true,
            sticky = true,
            toggler = {
                line = "<C-s>",
                block = "<C-m>",
            },
            opleader = {
                line = "<C-s>",
                block = "<C-m>",
            },
        })

        vim.keymap.set("n", "<CR>", "<CR>");
    end
}
