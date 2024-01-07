print("hello")

vim.g.maplocalleader = " "
vim.keymap.set("i", "kj", "<Esc>")

-- show lines
vim.cmd.set("number")
vim.cmd.set("relativenumber")
vim.api.nvim_set_option("clipboard", "unnamed") -- global clipboard

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},

	-- commenting
	{ "numToStr/Comment.nvim" },
	{ "nvim-lualine/lualine.nvim" },

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completions
			"hrsh7th/cmp-path", -- buffer completions
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "neovim/nvim-lspconfig" },
	-- { "L3MON4D3/LuaSnip" },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- conform (for formatting)
	{
		"stevearc/conform.nvim",
		opts = {},
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
})

require("mason").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
require("Comment").setup()

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("lspconfig").lua_ls.setup({})
