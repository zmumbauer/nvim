return {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	{ "github/copilot.vim" },
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", version = nil },
	"HiPhish/rainbow-delimiters.nvim",
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"stevearc/dressing.nvim",
	{
		"ziontee113/icon-picker.nvim",
		config = function()
			require("icon-picker").setup({
				disable_legacy_commands = true,
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	"tpope/vim-fugitive",
	"tpope/vim-rails",
	"tpope/vim-endwise",
	"mechatroner/rainbow_csv",
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
	},
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	
	-- "vim-test/vim-test",
	-- "preservim/vimux",
	"tomtom/tcomment_vim",
	"jlanzarotta/bufexplorer",
	"windwp/nvim-autopairs",

	-- themes
	"EdenEast/nightfox.nvim",
	"kvrohit/substrata.nvim",
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	"sonph/onehalf",
	"navarasu/onedark.nvim",
	"rebelot/kanagawa.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"ayu-theme/ayu-vim",
	"nyoom-engineering/oxocarbon.nvim",

	"lewis6991/gitsigns.nvim",
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufRead", "BufNewFile", "VimEnter" },
		dependencies = { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
		opts = {},
	},
	"mfussenegger/nvim-dap",
	-- { "zmumbauer/nvim-dap-ruby", dependencies = "mfussenegger/nvim-dap" },
	"tpope/vim-endwise",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		-- -@type render.md.UserConfig
		opts = {},
	},
	{ "stevearc/conform.nvim", opts = {} },
	{ "mfussenegger/nvim-lint" },
}