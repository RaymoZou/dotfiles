-- set up lsp and lsp related features here
require("mason").setup()
require("neodev").setup()

local servers = { -- lspconfig server names (add servers here as needed)
	lua_ls = {
		Lua = { workspace = { checkThirdParty = false }, telemetry = { enable = false } },
	},
	clangd = {},
	tsserver = {},
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- function taken form kickstart.nvim [https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua]
local on_attach = function(_, bufnr)
	local ts_builtin = require("telescope.builtin")
	vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "gd", ts_builtin.lsp_definitions, { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "gr", ts_builtin.lsp_references, { buffer = bufnr, desc = "Go to References" })
	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format with LSP" })
end

local handler = {
	function(server_name)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
			capabilities = capabilties,
		})
	end,
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = handler,
})

-- autocompletion setup
local cmp = require("cmp")
-- TODO: add max number of autocomplete suggestions
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
		{ name = "luasnip" },
		{ name = "path" },
	},
})
