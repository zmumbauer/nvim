
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For Testing
vim.g.VimuxUseNearestPane = 1
vim.g['test#strategy'] = {
  nearest = 'vimux',
  file = 'vimux',
  suite = 'vimux'
}

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- keymap("n", "<leader>n", ":NERDTreeToggle<cr>", opts)
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- Cursor stays in center when paging up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- cursor stays in center when searching text
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- keep yanked text in buffer after paste
vim.keymap.set("x", "<leader>p", "\"_dp")

-- disable q
vim.keymap.set("n", "q", "<nop>")

-- resize with arrows
keymap("n", "<c-up>", ":resize +2<cr>", opts)
keymap("n", "<c-down>", ":resize -2<cr>", opts)
keymap("n", "<c-left>", ":vertical resize -2<cr>", opts)
keymap("n", "<c-right>", ":vertical resize +2<cr>", opts)

-- navigate buffers
keymap("n", "<s-l>", ":bnext<cr>", opts)
keymap("n", "<s-h>", ":bprevious<cr>", opts)

-- insert --
-- press jk fast to enter
keymap("i", "jk", "<esc>", opts)

-- visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Testing --
-- Remapping for vim-test
keymap("n", "<leader>rc", ":TestContext<CR>", opts)
keymap("n", "<leader>rb", ":wa<CR>:TestFile<CR>", opts)
keymap("n", "<leader>rf", ":wa<CR>:TestNearest<CR>", opts)
keymap("n", "<leader>rl", ":wa<CR>:TestLast<CR>", opts)
keymap("n", "<leader>rx", ":wa<CR>:VimuxCloseRunner<CR>", opts)
keymap("n", "<leader>ri", ":wa<CR>:VimuxInspectRunner<CR>", opts)

-- Commenting
keymap("n", "<leader>cc", ":TComment<CR>", opts)
keymap("v", "<leader>cc", ":TComment<CR>", opts)

-- LSP
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)

