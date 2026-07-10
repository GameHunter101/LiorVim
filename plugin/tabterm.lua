require("lazyload").on_vim_enter(function ()
    if jit.os == "Windows" then
        vim.opt.shell = "powershell"
        vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
        vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
        vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
        vim.opt.shellquote = ""
        vim.opt.shellxquote = ""
    end
    --[[ vim.pack.add({"https://github.com/akinsho/toggleterm.nvim"})

    require("toggleterm").setup({
        open_mapping = "<C-t>",
        -- direction = "float",
        close_on_exit = false,
    }) ]]
    vim.pack.add({
        { src = "https://github.com/kremovtort/tabterm.nvim" },
    }, { load = true })

    require("tabterm").setup({
        cmd = vim.opt.shell
    })

    vim.keymap.set({"n", "t"}, "<C-t>", function()
        require("tabterm").toggle()
    end, { desc = "Toggle tabterm" })

    vim.keymap.set("n", "<C-n>", function()
        require("tabterm").new_shell()
    end, { desc = "New tabterm shell" })
end)
