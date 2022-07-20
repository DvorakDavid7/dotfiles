local M = {}

M.setup = function()
end


local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]       ,
            false
        )
    end
end

local function lsp_keymaps()
    print("setting up lsp keymaps")
    local opts = { buffer = 0 }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_next, opts)

    -- ctrl + q = puts it to quick list
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- formating
    vim.keymap.set("n", "<leader>fa", vim.lsp.buf.formatting)
end

M.on_attach = function(client)
    if client.name == "tsserver" then
        client.resolved_capabilities.document_formatting = false
    end
    lsp_keymaps()
    lsp_highlight_document(client)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
