local neotree = require("neo-tree")

neotree.setup({
	filesystem = {
		filtered_items = {
			visible = true,
			hijack_netrw_behavior = "open_current",
		},
	},
	default_component_configs = {

		git_status = {
			symbols = {
				unstaged = "U",
			},
		},
	},
})
