-- Plugin to show pending keybinds
-- Configured to load on 'VimEnter' event
-- See `:help autocmd-events`
return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup({
            icons = {
                mappings = vim.g.have_nerd_font,
                keys = vim.g.have_nerd_font and {} or {
                    Up = "<UP>",
                    Down = "<DOWN>",
                    Left = "<LEFT>",
                    Right = "<RIGHT>",
                    C = "<C-…>",
                    M = "<M-…>",
                    D = "<D-…>",
                    S = "<S-…>",
                    CR = "<CR>",
                    Esc = "<ESC>",
                    ScrollWheelDown = "<SCROLLWHEELDOWN>",
                    ScrollWheelUp = "<SCROLLWHEELUP>",
                    NL = "<NL>",
                    BS = "<BS>",
                    Space = "<SPACE>",
                    Tab = "<TAB>",
                    F1 = "<F1>",
                    F2 = "<F2>",
                    F3 = "<F3>",
                    F4 = "<F4>",
                    F5 = "<F5>",
                    F6 = "<F6>",
                    F7 = "<F7>",
                    F8 = "<F8>",
                    F9 = "<F9>",
                    F10 = "<F10>",
                    F11 = "<F11>",
                    F12 = "<F12>",
                },
            },
        })

        require("which-key").add({
            { "<LEADER>c", group = "[C]ode", mode = { "n", "x" } },
            { "<LEADER>d", group = "[D]ocument" },
            { "<LEADER>r", group = "[R]ename" },
            { "<LEADER>s", group = "[S]earch" },
            { "<LEADER>w", group = "[W]orkspace" },
            { "<LEADER>t", group = "[T]oggle" },
            { "<LEADER>gh", group = "[G]it [H]unk", mode = { "n", "v" } },
        })
    end,
}
