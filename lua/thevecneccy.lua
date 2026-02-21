require("thevecneccy.lazy")
require("thevecneccy.keymaps")
require("thevecneccy.options")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp.format", { clear = true }),
    callback = function(args)
        -- Set up format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end,
})
