local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name for setting keymaps
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For Testing
vim.g.VimuxUseNearestPane = 1
vim.g["test#strategy"] = {
	nearest = "vimux",
	file = "vimux",
	suite = "vimux",
}

local keymap_table = {
	-- Normal mode remappings
	n = {
		-- Better window navigation using Ctrl + hjkl
		{ "<C-h>", "<C-w>h" },
		{ "<C-j>", "<C-w>j" },
		{ "<C-k>", "<C-w>k" },
		{ "<C-l>", "<C-w>l" },

    -- Buffer explorer
		{ "<leader>be", ":ToggleBufExplorer<cr>" },

		-- Open file explorer with <leader>e
		{ "<leader>e", ":Lex 30<cr>" },

		-- Toggle file tree with <leader>n
		{ "<leader>n", ":NvimTreeToggle<cr>" },

		-- Resize window using Ctrl + arrow keys
		{ "<c-up>", ":resize +2<cr>" },
		{ "<c-down>", ":resize -2<cr>" },
		{ "<c-left>", ":vertical resize -2<cr>" },
		{ "<c-right>", ":vertical resize +2<cr>" },

		-- Navigate buffers with Shift + hj
		{ "<s-l>", ":bnext<cr>" },
		{ "<s-h>", ":bprevious<cr>" },

		-- Run tests with different <leader> combinations
		{ "<leader>rc", ":TestContext<CR>" },
		{ "<leader>rb", ":wa<CR>:TestFile<CR>" },
		{ "<leader>rf", ":wa<CR>:TestNearest<CR>" },
		{ "<leader>rl", ":wa<CR>:TestLast<CR>" },
		{ "<leader>rx", ":wa<CR>:VimuxCloseRunner<CR>" },
		{ "<leader>ri", ":wa<CR>:VimuxInspectRunner<CR>" },

		-- Comment code with <leader>cc
		{ "<leader>cc", ":TComment<CR>" },

		-- Go to definition with gd
		{ "gd", ":Telescope lsp_definitions<CR>" },

		-- Find references with gr
		{ "gr", ":Telescope lsp_references<CR>" },

		-- Telescope emoji picker
		{ "<Leader>te", "<cmd>IconPickerNormal<cr>" },

		-- Close buffer with leader bd
		{ "<leader>bd", ":bd<CR>" },
	},

	-- Insert mode remappings
	i = {
		-- Press jk quickly to exit insert mode
		{ "jk", "<esc>" },
	},

	-- Visual mode remappings
	v = {
		-- Keep selection when shifting text left or right
		{ "<", "<gv" },
		{ ">", ">gv" },

		-- Move selected lines up or down with Alt + jk
		{ "<A-j>", ":m .+1<CR>==" },
		{ "<A-k>", ":m .-2<CR>==" },

		-- Paste without overwriting the register contents
		{ "p", '"_dP' },

		-- Comment selected lines with <leader>cc
		{ "<leader>cc", ":TComment<CR>" },
	},

	-- Visual Block mode remappings
	x = {
		-- Move selected block of text up or down with J and K
		{ "J", ":move '>+1<CR>gv-gv" },
		{ "K", ":move '<-2<CR>gv-gv" },

		-- Move selected block of text up or down with Alt + jk
		{ "<A-j>", ":move '>+1<CR>gv-gv" },
		{ "<A-k>", ":move '<-2<CR>gv-gv" },
	},

	-- Terminal mode remappings
	t = {
		-- Better terminal navigation using Ctrl + hjkl
		{ "<C-h>", "<C-\\><C-N><C-w>h" },
		{ "<C-j>", "<C-\\><C-N><C-w>j" },
		{ "<C-k>", "<C-\\><C-N><C-w>k" },
		{ "<C-l>", "<C-\\><C-N><C-w>l" },
	},
}

-- Loop through and apply the key remappings
for mode, mappings in pairs(keymap_table) do
	for _, mapping in pairs(mappings) do
		local lhs, rhs = unpack(mapping)
		if mode == "t" then
			keymap(mode, lhs, rhs, term_opts)
		else
			keymap(mode, lhs, rhs, opts)
		end
	end
end
