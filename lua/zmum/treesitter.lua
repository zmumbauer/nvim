require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"ruby",
		"html",
		"sql",
		"terraform",
		"yaml",
		"markdown",
		"kotlin",
		"javascript",
		"hcl",
		"dockerfile",
		"bash",
	},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},

	indent = { enable = true },

})
