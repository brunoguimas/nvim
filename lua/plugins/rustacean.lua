return {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy

    config = function()
        local map = vim.keymap.set

        map('n', '<leader>rh', '<CMD>RustLsp hover actions<CR>', { desc = "Rust code action" })
        map('n', '<leader>rr', '<CMD>RustLsp! runnables<CR>', { desc = "Rust runnables" })
        map('n', '<leader>rd', '<CMD>RustLsp debuggables<CR>', { desc = "Rust debuggables" })
        map('n', '<leader>rb', '<CMD>CargoBuild<CR>', { desc = "Cargo build" })
        map('n', '<leader>rc', '<CMD>CargoDoc --open<CR>', { desc = "Cargo docs" })
    end,
}
