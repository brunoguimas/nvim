return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({})

        local map = vim.keymap.set

        map("n", "<leader>e", "<CMD>NvimTreeFindFile<CR>", { desc = "Open explorer" })

        require("nvim-tree").setup({
            diagnostics = {
                enable = true,
            },
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
                custom = { '^.git$' }
            },
        })
    end,
}
