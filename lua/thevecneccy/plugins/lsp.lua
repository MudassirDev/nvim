return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            'saghen/blink.cmp',
        },
        config = function()
            local capabilites =  require('blink.cmp').get_lsp_capabilities()
            -- configure all the servers here
            vim.lsp.config['luals'] = {
                cmd = { 'lua-language-server' },
                filetypes = { 'lua' },
                root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
                capabilites = capabilites,
            }
            vim.lsp.enable('luals')
            vim.lsp.config['gopls'] = {
                cmd = { 'gopls' },
                filetypes = { 'go' },
                root_markers = { { 'go.mod' }, '.git' },
                capabilites = capabilites,
            }
            vim.lsp.enable('gopls')

            -- some keybindings to help me go kaboom
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

            -- to see errors
            vim.keymap.set('n', '<leader>k', function()
                vim.diagnostic.open_float({ scope = 'line' })
            end, { noremap = true, silent = true })

            -- to navigate errors
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, buffer = bufnr })
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, buffer = bufnr })
        end,
    },
    {
        "mason-org/mason.nvim",
        opts = {}
    }
}
