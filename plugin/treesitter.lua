vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
    "lua",
    "vimdoc",
    "rust",
    "javascript",
    "typescript",
    "python",
    "html",
    "jsx",
    "tsx",
    "markdown",
    "markdown_inline",
    "wgsl",
    "java",
    "regex"
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

require("treesitter-context").setup({
    max_lines = 5,
    multiwindow = false,
    separator = "─",
    mode = "topline",
    trim_scope = "inner",
})
