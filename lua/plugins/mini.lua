-- Plugin for various small utilities
return {
    "echasnovski/mini.nvim",
    config = function()
        -- better [A]round/[I]nside textobjects
        require("mini.ai").setup({ n_lines = 500 })

        -- add/delete/replace surroundings
        require("mini.surround").setup()

        -- simple statusline
        local statusline = require("mini.statusline")
        statusline.setup({ use_icons = vim.g.have_nerd_font })

        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return "%21:%-2v"
        end
    end,
}
