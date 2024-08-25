-- Plugin to fuzzy find files
return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup`
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<LEADER>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<LEADER>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<LEADER>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
        vim.keymap.set("n", "<LEADER>st", builtin.builtin, { desc = "[S]earch Select [T]elescope" })
        vim.keymap.set("n", "<LEADER>sw", builtin.grep_string, { desc = "[S]earch Current [W]ord" })
        vim.keymap.set("n", "<LEADER>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<LEADER>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
        vim.keymap.set("n", "<LEADER>sr", builtin.resume, { desc = "[S]earch [R]esume" })
        vim.keymap.set("n", "<LEADER>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set("n", "<LEADER><LEADER>", builtin.buffers, { desc = "[ ] Find Existing Buffers" })

        vim.keymap.set("n", "<LEADER>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Search Current Buffer" })

        vim.keymap.set("n", "<LEADER>s/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title = "Live Grep in Open Files",
            })
        end, { desc = "[S]earch [/] in Open Files" })

        vim.keymap.set("n", "<LEADER>sn", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config"),
            })
        end, { desc = "[S]earch [N]eovim Files" })
    end,
}
