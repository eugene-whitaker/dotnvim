-- Plugin to configure Lua LSP
return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = {
            { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
    },
}
