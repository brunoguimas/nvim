return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local map = vim.keymap.set

        map('n', '<leader>bo', '<CMD>BufferLineCloseOthers<CR>', { desc = "Close other buffers" })
        require("bufferline").setup({
            options = {
                always_show_bufferline = false,
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            },
        })
    end,
}
