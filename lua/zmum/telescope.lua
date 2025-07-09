-- Remap
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>d", builtin.git_files, {})
vim.keymap.set("n", "<leader>ts", ":Telescope colorscheme<CR>", {})
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<C-s>", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

local telescope = require("telescope")

telescope.setup({
	defaults = {
		hidden = true,
		file_ignore_patterns = {".git/"},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
})
