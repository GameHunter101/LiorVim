require("lazyload").on_vim_enter(function ()
    vim.pack.add({"https://github.com/akinsho/toggleterm.nvim"})

    if jit.os == "Windows" then
        vim.opt.shell = "powershell"
        vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
        vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
        vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
        vim.opt.shellquote = ""
        vim.opt.shellxquote = ""
    end

    require("toggleterm").setup({
        open_mapping = "<C-t>",
        -- direction = "float",
        close_on_exit = false,
        --[[ float_opts = {
            border = "curved",
            title_pos = "center"
        } ]]
    })
end)
