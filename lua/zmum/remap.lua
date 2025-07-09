local keymap = vim.keymap.set

-- General

keymap("n", "<leader>e", ":Lex 30<cr>")
keymap("n", "<leader>n", ":NvimTreeToggle<cr>")
keymap("n", "<leader>be", ":ToggleBufExplorer<cr>")
keymap("n", "<leader>bd", ":bd<CR>")

-- Window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Window resizing
keymap("n", "<c-up>", ":resize +2<cr>")
keymap("n", "<c-down>", ":resize -2<cr>")
keymap("n", "<c-left>", ":vertical resize -2<cr>")
keymap("n", "<c-right>", ":vertical resize +2<cr>")

-- Buffer navigation
keymap("n", "<s-l>", ":bnext<cr>")
keymap("n", "<s-h>", ":bprevious<cr>")



-- Markdown
keymap("n", "<leader>md", ":Glow<CR>")

-- Comments
keymap("n", "<leader>cc", ":TComment<CR>")
keymap("v", "<leader>cc", ":TComment<CR>")

-- LSP
keymap("n", "gd", ":Telescope lsp_definitions<CR>")
keymap("n", "gr", ":Telescope lsp_references<CR>")

-- Telescope
keymap("n", "<Leader>te", "<cmd>IconPickerNormal<cr>")

-- Insert mode
keymap("i", "jk", "<esc>")

-- Formatting
keymap("n", "<leader>lf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Visual mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")
keymap("v", "p", '"_dP')

-- Visual Block mode
keymap("x", "J", ":move '>+1<CR>gv-gv")
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal mode
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l")