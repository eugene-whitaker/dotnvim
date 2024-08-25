-- [[ Setting Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Set highlight when yanking text
-- See `:help vim.highlight.on_yank()`

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highliht when yanking text',
    group = vim.api.nvim_create_augroup('highlight-onyank', { clear = true }),
    callback = function()
	vim.highlight.on_yank()
    end,
})
