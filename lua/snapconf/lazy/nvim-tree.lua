return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- ícones para o nvim-tree
  },
  config = function()
    -- Desativa o netrw no início
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Ativa suporte a 24 bits de cor
    vim.opt.termguicolors = true

    -- Configuração do nvim-tree
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })

    local map = vim.keymap.set

    map('n', '<leader>e', require('nvim-tree.api').tree.toggle, { desc = "Opens nvim-tree" })
  end,
}

