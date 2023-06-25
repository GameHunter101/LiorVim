local onedark = require("onedark")

onedark.setup({
	style = "warmer",
	colors = {
		bg0 = "#141415",
		bg1 = "#1D1E20",
		bg2 = "#27272B",
		bg3 = "#222225",
		bg_d = "#0F0F10",
	},
	highlights = {
		NeoTreeGitUntracked = { fg = "$green" },
		NeoTreeGitConflict = { fg = "$blue" },
	},
})
onedark.load()
vim.cmd.colorscheme("onedark")
