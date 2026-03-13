return {
    'lewis6991/gitsigns.nvim',

    config = function()
        require('gitsigns').setup({
            current_line_blame = true,
        })


        vim.keymap.set('n', '<leader>gb', '<CMD>Gitsigns toggle_current_line_blame<CR>', {})
    end
}
