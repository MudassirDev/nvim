return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        require("rose-pine").setup({
            variant = "main",
            palette = {
                main = {
                    base = '#000000',
                },
            },
        })
        vim.cmd("colorscheme rose-pine")
    end
}
