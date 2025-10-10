return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    opts = {
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<C-Tab>'] = { 'select_prev', 'fallback' },
            ['<Enter>'] = { 'accept', 'fallback' },
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        signature = {enabled = true},
    },
}
