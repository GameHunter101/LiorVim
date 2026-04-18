vim.pack.add({{
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
}})

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
    "java"
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
		pcall(vim.treesitter.start)
	end,
})
