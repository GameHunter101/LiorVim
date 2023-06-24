function colorize(color)
	color = color or "oxocarbon"
	vim.cmd.colorscheme(color)

	-- Uncomment below for transparent backgrounds
	-- vim.api.nvim_set_hl(0,"Normal", {bg = "none"})
	-- vim.api.nvim_set_hl(0,"NormalFloat", {bg = "none"})
end

colorize()
