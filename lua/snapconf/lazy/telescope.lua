return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    map('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope find recent' })
    map('n', '<leader>fc', '<CMD>Telescope find_files search_dirs=~/.config/nvim<CR>', { desc = "Telescope config files" })
  end,
}
