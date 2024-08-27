-- See `:help lua-guide`

-- Set leader key to <SPACE>
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Unset Nerd Font support
vim.g.have_nerd_font = false

-- Unset Go recommended styles
vim.g.go_recommended_style = false

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

-- [[ Configure and install plugins ]]
-- See `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
}, {
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "⚒",
            event = "",
            ft = "",
            init = "",
            keys = "",
            plugin = "",
            runtime = "",
            require = "",
            source = "",
            start = "",
            task = "",
            lazy = "",
        },
    },
})

-- See `:help modeline`
-- vim: ts=8 sts=-1 et sw=4
