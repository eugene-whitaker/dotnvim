return {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function() -- load the colorscheme
        vim.cmd.colorscheme("tokyonight-night")
        vim.cmd.hi("Comment gui=none")
    end,
}
