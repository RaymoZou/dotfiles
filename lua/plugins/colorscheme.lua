-- various color schemes with onedark loaded by default

return {
    {
        "navarasu/onedark.nvim",
        -- priority = 1000,
        -- config = function()
        --     require("onedark").setup({
        --         style = "darker",
        --     })
        --     require("onedark").load()
        -- end,
    },
    { "folke/tokyonight.nvim" }, -- tokyonight-{night, storm, day, moon}
    {
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end,
    } -- catppucin-{latte, frappe, macchiato, mocha}
}
