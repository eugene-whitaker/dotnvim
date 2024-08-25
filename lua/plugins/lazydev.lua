-- Plugin to configure Lua LSP
return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = {
            -- load luvit types when the 'vim.uv' word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
    },
}
