-- Plugin to highlight todo comments
return {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
        highlight = {
            before = "fg",
            keyword = "bg",
            after = "fg",
            pattern = {
                [[.*<(KEYWORDS)\s*:]],
                [[.*<(KEYWORDS)\s*\(.*\):]],
            },
        },
    },
}
