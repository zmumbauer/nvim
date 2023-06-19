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
		formatting.stylua,
		diagnostics.luacheck,
		formatting.rubocop.with({
			command = "bundle",
			args = {
				"exec",
				"rubocop",
				"-a",
				"-f",
				"quiet",
				"--stderr",
				"--stdin",
				"$FILENAME",
			},
			to_stdin = true,
		}),
		diagnostics.rubocop.with({
			command = "bundle",
			args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
		}),
		diagnostics.reek,
		formatting.prettier,
		formatting.prettierd,
		diagnostics.eslint,
	},
})
