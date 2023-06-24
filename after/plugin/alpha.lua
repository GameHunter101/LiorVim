local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return datetime .. "   " .. total_plugins .. " plugins" .. nvim_version_info
end

dashboard.section.header.val = {
[[                                                                          ]], 
[[                                                                          ]], 
[[                                                                          ]], 
[[  ___       ___  ________  ________  ___      ___ ___  ____________       ]],
[[ |\  \     |\  \|\   __  \|\   __  \|\  \    /  /|\  \|\   _    _   \     ]], 
[[ \ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \    ]], 
[[  \ \  \    \ \  \ \  \\\  \ \   _  _\ \  \/  / / \ \  \ \  \\|__| \  \   ]], 
[[   \ \  \____\ \  \ \  \\\  \ \  \\  \\ \    / /   \ \  \ \  \    \ \  \  ]], 
[[    \ \_______\ \__\ \_______\ \__\\ _\\ \__/ /     \ \__\ \__\    \ \__\ ]], 
[[     \|_______|\|__|\|_______|\|__|\|__|\|__|/       \|__|\|__|     \|__| ]], 
[[                                                                          ]], 
[[                                                                          ]], 
[[                                                                          ]], 
}

dashboard.section.buttons.val = {
    dashboard.button("<C-e>", "  File Explorer"),
    dashboard.button("<leader>ff", "  Project files"),
    dashboard.button("<leader>ps", "  Update plugins"),
    dashboard.button("q", "  Quit", ":qa<cr>")
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Constant"

alpha.setup(dashboard.opts)

vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
