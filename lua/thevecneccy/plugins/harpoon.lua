return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>m", mark.add_file)
        vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader><Tab>", ui.nav_next)
    end
}
