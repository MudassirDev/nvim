-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--         require("rose-pine").setup({
--             variant = "main",
--             palette = {
--                 main = {
--                     base = '#000000',
--                 },
--             },
--         })
--         vim.cmd("colorscheme rose-pine")
--         vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#000000"})
--     end
-- }
return {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
}
