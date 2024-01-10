return {
    "numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = {
        padding = true,
        sticky = true,
        toggler = {
            line = "<C-l>",
            block = "<C-b>",
        },
        opleader = {
            line = "<C-l>",
            block = "<C-b>",
        }
    }
}
