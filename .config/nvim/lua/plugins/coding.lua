return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    { -- autocompletion --
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'accept' },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "lua" }
        },
        opts_extend = { "sources.default" }
    },
    { 'numToStr/Comment.nvim', opts = {} }, {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
},
}
