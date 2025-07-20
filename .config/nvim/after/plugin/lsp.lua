vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = true, desc = "[LSP] Format" })
        vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions,
            { buffer = true, desc = "[LSP] Definition" })
        vim.keymap.set('n', '<leader>gr', require("telescope.builtin").lsp_references,
            { desc = "[LSP] References" })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
            { buffer = true, desc = "[LSP] Rename" })
    end
})
