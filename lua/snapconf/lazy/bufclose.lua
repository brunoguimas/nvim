return {
    'Asheq/close-buffers.vim',

    config = function()
        local map = vim.keymap.set

        map('n', '<leader>bd', '<CMD>Bdelete this<CR>', { desc = "Close buffer" })
        map('n', '<leader>bo', '<CMD>Bdelete other<CR>', { desc = "Close other buffers" })
    end,
}
