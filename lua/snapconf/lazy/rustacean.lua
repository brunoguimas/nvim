return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    config = function()
        local map = vim.keymap.set

        map('n', '<leader>rh', '<CMD>RustLsp hover actions<CR>', { desc = "Rust code action" })
        map('n', '<leader>rr', '<CMD>RustLsp runnables<CR>', { desc = "Rust runnables" })
        map('n', '<leader>rd', '<CMD>RustLsp debuggables<CR>', { desc = "Rust debuggables" })
        map('n', '<leader>rb', '<CMD>CargoBuild<CR>', { desc = "Cargo build" })
        map('n', '<leader>rc', '<CMD>CargoDoc --open<CR>', { desc = "Cargo docs" })

        vim.g.rustaceanvim = {
            server = {
                on_attach = function(_, bufnr)
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                    end
                    map("n", "<leader>ca", function() vim.cmd("RustLsp codeAction") end, "Rust Code Action")
                    map("n", "K", vim.lsp.buf.hover, "Hover")
                    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                end,
            },
        }
    end,
}
