return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
	local neotree = require("neo-tree")

	neotree.setup({
	    window = {
		filesystem = {
		    filtered_items = {
			visible = true,
			hijak_netrw_behavior = "open_current",
		    },
		},
	    },
	})

	local keymap = vim.keymap

	keymap.set("n", "<C-e>", ":Neotree toggle<CR>")
    end,
}
