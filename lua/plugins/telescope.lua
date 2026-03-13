return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        local map = vim.keymap.set

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<c-d>"] = actions.delete_buffer,
                    },
                    n = {
                        ["<c-d>"] = actions.delete_buffer,
                        ["dd"] = actions.delete_buffer,
                    },
                },
            },
        })

        map("n", "<leader>ff", "<CMD>Telescope find_files search_dirs=./<CR>", { desc = "Telescope find files" })
        map("n", "<leader>fg", "<CMD>Telescope live_grep search_dirs=./<CR>", { desc = "Telescope live grep" })
        map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        map("n", "<leader>fh", "<CMD>Telescope harpoon marks<CR>", { desc = "Telescope harpoon marks" })
        map("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent" })
        map("n", "<leader>fm", builtin.marks, { desc = "Telescope find marks" })
        map(
            "n",
            "<leader>fc",
            "<CMD>Telescope find_files search_dirs=~/.config/nvim<CR>",
            { desc = "Telescope config files" }
        )
    end,
}
