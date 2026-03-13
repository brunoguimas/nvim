return {
    'nvim-pack/nvim-spectre',

    config = function()
        local map = vim.keymap.set

        map('n', '<leader>S', '<CMD>lua require ("spectre").toggle()<CR>', { desc = "Search and replace" })
        map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
            desc = "Search current word"
        })
        map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
            desc = "Search current word"
        })
    end
}
