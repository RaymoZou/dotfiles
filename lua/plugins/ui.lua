-- plugins relating to UI
-- TODO: add plugin for visualizing git differences in files
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	{ "j-hui/fidget.nvim", opts = {} },
}
