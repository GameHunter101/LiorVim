return {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
        --[[ require("rustaceanvim").setup({
            tools = {
                enable_clippy = false,
            }
        }) ]]
        vim.g.rustaceanvim = {
            tools = {
                enable_clippy = false,
            }
        }
    end
}
