local map = vim.keymap.set

map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Tree" })
map("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal File In Tree" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to Left Window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to Lower Window" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to Upper Window" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to Right Window" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

map("n", "<leader>te", "<cmd>IconPickerNormal<cr>", { desc = "Pick Icon" })
map("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

map("i", "jk", "<esc>", { desc = "Escape Insert Mode" })

map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("v", "p", '"_dP', { desc = "Paste Without Overwrite" })

map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move Block Down" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move Block Up" })
map("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = "Move Block Down" })
map("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = "Move Block Up" })
