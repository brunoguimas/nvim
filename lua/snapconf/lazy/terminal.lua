return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},

    config = function()
        require('toggleterm').setup({})
        local map = vim.keymap.set

        map('n', '<leader>h', '<CMD>ToggleTerm dir=./<CR>', { desc = "Horizontal terminal" })
        map('n', '<leader>v', '<CMD>ToggleTerm direction=vertical dir=./<CR>', { desc = "Vertical terminal" })
        map('n', '<leader>pt', '<CMD>ToggleTerm direction=float dir=./<CR>', { desc = "Float terminal" })

        map('t', '<C-k>', [[<C-\><C-N><C-w>k]])

    end,
    }
