local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	print("Error: ", null_ls)
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- Lua
		formatting.stylua,
		diagnostics.luacheck,
		-- Ruby
		formatting.rubocop,
		diagnostics.reek,
		diagnostics.rubocop,
		-- Typescript
		formatting.prettier,
		diagnostics.eslint,
	},
})
