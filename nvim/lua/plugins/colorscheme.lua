-- various color schemes with catppuccin loaded by default

return {
    {
        {
            "navarasu/onedark.nvim",
            name = "onedark",
            lazy = false,
            priority = 1000
        },
        {
            "folke/tokyonight.nvim",
            name = "tokyonight",
            lazy = false,
            priority = 1000
        },
        {
            "catppuccin/nvim",
            name = "catppuccin",
            lazy = false,
            priority = 1000,
        },
        {
            "bluz71/vim-moonfly-colors",
            name = "moonfly",
            lazy = false,
            priority = 1000,
            init = function()
                vim.cmd.colorscheme("moonfly")
            end,
        },
    },
}
