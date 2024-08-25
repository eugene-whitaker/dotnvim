-- Plugin for autocompletion
return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = "make nstall_jsregexp",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
            dependencies = {
                "rafamadriz/friendly-snippets",
                config = function()
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            },
        },
        { "saadparwaiz1/cmp_luasnip" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-path" },
    },
    config = function()
        -- See `:help cmp`
        local luasnip = require("luasnip")
        luasnip.config.setup({})

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = "menu,menuone,noinsert" },

            -- See `:help ins-completion`
            mapping = cmp.mapping.preset.insert({
                -- select the [N]ext item
                ["<C-n>"] = cmp.mapping.select_next_item(),
                -- select the [P]revious item
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                -- scroll documentation window [B]ackward
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                -- scroll documentation window [F]orward
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- accept ([Y]es) the completion
                ["<TAB>"] = cmp.mapping.confirm({ select = true }),
                -- manually trigger completion
                ["<C-SPACE>"] = cmp.mapping.complete({}),
                -- move forward over expansion locations
                ["<C-l>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                -- move backward over expansion locations
                ["<C-h>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            sources = {
                {
                    name = "lazydev",
                    -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                    group_index = 0,
                },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            },
        })
    end,
}
