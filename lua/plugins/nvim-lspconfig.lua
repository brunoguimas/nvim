return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = bufnr,
                    callback = vim.lsp.buf.document_highlight,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                    buffer = bufnr,
                    callback = vim.lsp.buf.clear_references,
                })
            end
        end

        local config_lsp = function(lsp)
            vim.lsp.config[lsp] = {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            vim.lsp.enable(lsp)
        end

        config_lsp("lua_ls")
        config_lsp("rust-analyzer")
        config_lsp("ts_ls")
        config_lsp("clangd")
        config_lsp("checkmake")
        config_lsp("bashls")
        config_lsp("pylsp")
        config_lsp("docker")
        config_lsp("gopls")
        config_lsp("postgres_lsp")
    end,
}
