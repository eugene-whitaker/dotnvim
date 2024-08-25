-- [[ Setting Keymaps ]]
-- See `:help vim.keymap.set`

-- Set highlights on serach when pressing <ESC> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<ESC>', '<CMD>nohlsearch<ENTER>')

-- Set diagnostic keymaps
vim.keymap.set('n', '<LEADER>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix [L]ist' })

-- Set exit terminal mode
vim.keymap.set('n', '<ESC><ESC>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Unset arrow keys
vim.keymap.set('n', '<LEFT>', '<CMD>echo "use h to move left"<ENTER>')
vim.keymap.set('n', '<RIGHT>', '<CMD>echo "use l to move right"<ENTER>')
vim.keymap.set('n', '<UP>', '<CMD>echo "use k to move up"<ENTER>')
vim.keymap.set('n', '<DOWN>', '<CMD>echo "use j to move down"<ENTER>')

-- Set split navigation
-- See `:help wincmd`
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the top window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the bottom window' })
