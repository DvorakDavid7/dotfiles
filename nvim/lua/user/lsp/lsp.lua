
require("lspconfig").tsserver.setup{
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, {buffer = 0})

        -- ctrl + q = puts it to quick list
        vim.keymap.set("n", "<leader>ll", "<cmd>Telescope diagnostics<cr>", {buffer = 0})

        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
    end
}

