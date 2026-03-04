-- Server mapping
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md

local servers = {
	"lua_ls",
	-- "ruby_ls",
	"solargraph",
	"jsonls",
	"emmet_ls",
	"prettierd",
	"prettier",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local use_vim_lsp_api = vim.lsp and vim.lsp.config and vim.lsp.enable
local legacy_lspconfig = nil
if not use_vim_lsp_api then
	local lspconfig_status_ok
	lspconfig_status_ok, legacy_lspconfig = pcall(require, "lspconfig")
	if not lspconfig_status_ok then
		return
	end
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("zmum.lsp.handlers").on_attach,
		capabilities = require("zmum.lsp.handlers").capabilities,
	}

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "zmum.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	if use_vim_lsp_api then
		vim.lsp.config(server, opts)
		vim.lsp.enable(server)
	else
		legacy_lspconfig[server].setup(opts)
	end
end
