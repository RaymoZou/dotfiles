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

	{ "hrsh7th/nvim-cmp" }, -- completion plugin

	-- completion sources
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- buffer completions

	{ "williamboman/mason.nvim" },
	-- { "williamboman/mason-lspconfig.nvim" },
	-- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	-- { "neovim/nvim-lspconfig" },
	-- { "hrsh7th/cmp-nvim-lsp" },
	-- { "L3MON4D3/LuaSnip" },

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
-- require("mason-lspconfig").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},
})
require("Comment").setup()
local cmp = require("cmp")
require("cmp").setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function()
			if (cmp.visible()) then
				cmp.select_next_item()
			end
		end,
	}),
	sources = {
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
