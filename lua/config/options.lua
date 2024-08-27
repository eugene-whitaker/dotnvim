-- [[ Setting Options ]]
-- See `:help vim.opt` and `:help option-list`

-- Set relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Set mouse support to all modes
vim.opt.mouse = "a"

-- Unset show mode
vim.opt.showmode = false

-- Set clipboard to sync between OS and Neovim
-- See `:help clipboard`
vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

-- Set break indent
vim.opt.breakindent = true

-- Set undo history
vim.opt.undofile = true

-- Set case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set draw signcolumn to always
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Set split open directions
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Set display for whitespace characters
-- See `:help list` and `:help listchars`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set substitutions previews
vim.opt.inccommand = "split"

-- Set show cursor line
vim.opt.cursorline = true

-- Set number of lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Set tab size
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- Unset word wrap
vim.opt.wrap = false
