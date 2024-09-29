-- [[ Setting Keymaps ]]
-- See `:help vim.keymap.set`

-- Set clear highlights on serach when pressing <ESC> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<ENTER>")

-- Set diagnostic keymaps
vim.keymap.set("n", "<LEADER>q", vim.diagnostic.setloclist, { desc = "Open Diagnostic [Q]uickfix List" })

-- Set exit terminal mode keymaps
vim.keymap.set("n", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Unset arrow keys
vim.keymap.set("n", "<LEFT>", '<CMD>echo "use h to move left"<ENTER>')
vim.keymap.set("n", "<RIGHT>", '<CMD>echo "use l to move right"<ENTER>')
vim.keymap.set("n", "<UP>", '<CMD>echo "use k to move up"<ENTER>')
vim.keymap.set("n", "<DOWN>", '<CMD>echo "use j to move down"<ENTER>')

-- Set split navigation keymaps
-- See `:help wincmd`
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the top window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the bottom window" })

-- Experimenting
vim.keymap.set("n", "<LEADER>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<LEADER>p", '"_dP')
