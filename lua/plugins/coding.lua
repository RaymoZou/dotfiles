return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- buffer completions
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "folke/neodev.nvim", opts = {} },
	-- formatter
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
	-- commenting
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				pre_hook = function()
					return vim.bo.commentstring
				end,
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
}
