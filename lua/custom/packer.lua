-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({
		"nyoom-engineering/oxocarbon.nvim",
		as = "oxocarbon",
		config = function()
			vim.cmd("colorscheme oxocarbon")
		end,
	})
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("tpope/vim-fugitive")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("nvim-lualine/lualine.nvim")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-buffer")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("akinsho/bufferline.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("glepnir/lspsaga.nvim")
	use("MDeiml/tree-sitter-markdown")
	use("MunifTanjim/prettier.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("lewis6991/gitsigns.nvim")
	use("MunifTanjim/nui.nvim")
	use("nvim-neo-tree/neo-tree.nvim")
	use("numToStr/Comment.nvim")
	use("goolord/alpha-nvim")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("jay-babu/mason-nvim-dap.nvim")
	use("simrat39/rust-tools.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
end)
