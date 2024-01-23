-- treesitter config
--
-- use Cclang compiler to compile C/C++ parsers
require 'nvim-treesitter.install'.compilers = { "clang" }
require("nvim-treesitter.configs").setup({
	-- add languages here as necessary
	ensure_installed = { "c", "lua", "rust" },
	modules = {},
	sync_install = false,
	ignore_install = {},
	auto_install = true,
	highlight = {
		enable = true,
	},
})
