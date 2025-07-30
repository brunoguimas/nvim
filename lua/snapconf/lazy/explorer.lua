return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself

  config = function()
    local map = vim.keymap.set
    map('n', '<leader>e', '<CMD>Neotree reveal dir=./<CR>', { desc = "Open file explorer"})
    map('n', '<leader>pe', '<CMD>Neotree reveal dir=./<CR>', { desc = "Open file explorer float"})

    require('neo-tree').setup({

      close_if_last_window = true,

      filesystem = {
        filtered_items = {
          visible = true,
        }
      }
    }
  )
end,
}
