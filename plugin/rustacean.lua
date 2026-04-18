require("lazyload").on_vim_enter(function()
    vim.pack.add({ {
        src = 'https://github.com/mrcjkb/rustaceanvim',
        version = vim.version.range('^9')
    } })
end)
