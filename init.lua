-- Set <SPACE> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Unset Nerd Font support
vim.g.have_nerd_font = false

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- See `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
require("lazy").setup({
    require("plugins.vim-sleuth"),
    require("plugins.gitsigns"),
    require("plugins.which-key"),
    require("plugins.telescope"),
    require("plugins.lazydev"),
    require("plugins.luvit-meta"),
    require("plugins.nvim-lspconfig"),
    require("plugins.conform"),
    require("plugins.nvim-cmp"),
    require("plugins.tokyonight"),
    require("plugins.todo-comments"),
    require("plugins.mini"),
    require("plugins.nvim-treesitter"),
})
