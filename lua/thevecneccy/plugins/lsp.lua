return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                },
                automatic_installation = true,
            })

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- OPTIONAL: nvim-cmp or other plugins can enhance this
            -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>ss", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>k", function()
                    vim.diagnostic.open_float()
                end,opts)
            end

            -- Minimal LSP configs
            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            vim.lsp.config("gopls", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("clangd", {
                on_attach = on_attach,
                capabilities = capabilities,
            })

            vim.lsp.config("tsserver", {
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
                root_markers = { "package.json", "tsconfig.json", ".git" },
            })

            -- Enable them all
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("gopls")
            vim.lsp.enable("tsserver")
        end,
    },
}
