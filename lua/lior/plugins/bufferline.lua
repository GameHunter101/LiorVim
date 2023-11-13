return {
    "akinsho/bufferline.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},
	version = "*",
	opts = {
		options = {
			separator_style = "slope",
			always_show_bufferline = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
			diagnostics = "nvim_lsp",
		}
	}
}
