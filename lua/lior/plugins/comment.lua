return {
    "numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = {
        padding = true,
        sticky = true,
        toggler = {
            line = "<C-s>",
            block = "<C-m>",
        },
        opleader = {
            line = "<C-s>",
            block = "<C-m>",
        }
    }
}
