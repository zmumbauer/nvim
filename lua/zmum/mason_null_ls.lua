local status_ok, mason_null_ls = pcall(require, "mason-null-ls")

if not status_ok then
	print("Error: ", mason_null_ls)
	return
end

mason_null_ls.setup({
	ensure_installed = { "stylua", "luacheck", "markdownlint", "eslint", "prettier", "prettierd" },
})
