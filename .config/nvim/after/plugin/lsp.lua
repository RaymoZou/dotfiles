vim.api.nvim_create_autocmd('LspAttach', {


    callback = function(ev)
        -- local client = vim.lsp.get_client_by_id(ev.data.client_id)

        vim.keymap.set('n', '<leader>f', function()
            -- add specific LSPs you want to use to format otherwise it will use all the LSPs
            -- that are connected to the current buffer
            local whitelist = { ruff = true, lua_ls = true }
            vim.lsp.buf.format({
                filter = function(client) return whitelist[client.name] == true end
            })
        end
        , { buffer = true, desc = "[LSP] Format" })
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.type_definition,
            { buffer = true, desc = "[LSP] Definition" })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
            { buffer = true, desc = "[LSP] Rename" })
        vim.keymap.set('n', '<leader>ss', require("telescope.builtin").lsp_document_symbols,
            { buffer = true, desc = "[LSP] Symbol" })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
            { desc = "[LSP] Code Action" })
        vim.keymap.set('n', '<leader>gr', require("telescope.builtin").lsp_references,
            { desc = "[LSP] References" })
    end
})
