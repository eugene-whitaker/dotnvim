return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        { "williamboman/mason-lspconfig.nvim" },
        { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        { "j-hui/fidget.nvim", opts = {} },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
        -- [[ Configure LSP ]]
        -- See `:help lsp-vs-treesitter`
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                local builtin = require("telescope.builtin")
                map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
                map("gr", builtin.lsp_references, "[G]oto [R]eferences")
                map("gI", builtin.lsp_implementations, "[G]oto [I]mplemenatino")
                map("<LEADER>D", builtin.lsp_type_definitions, "Type [D]efinition")
                map("<LEADER>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
                map("<LEADER>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
                map("<LEADER>rn", vim.lsp.buf.rename, "[R]e[N]ame")
                map("<LEADER>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                -- highlight references under cursor when cursor is at rest
                -- See `:help CursorHold`
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_decumentHighlight) then
                    local cursor_hold_augroup = vim.api.nvim_create_augroup("cursor-hold", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = cursor_hold_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = cursor_hold_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                        callback = function(subevent)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "cursor-hold", buffer = subevent.buf })
                        end,
                    })
                end

                if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                    map("<LEADER>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "[T]oggle Inlay [H]ints")
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- See `:help lspconfig-all`
        local servers = {
            clangd = {},
            gopls = {},
            pyright = {},
            rust_analyzer = {},
            tsserver = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            "stylua", -- used to format Lua code
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })
    end,
}
