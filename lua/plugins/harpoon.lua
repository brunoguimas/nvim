return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("harpoon").setup({})

		local map = vim.keymap.set

		map("n", "<leader>a", function()
			require("harpoon.mark").add_file()
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>l", function()
			require("harpoon.ui").toggle_quick_menu()
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>1", function()
			require("harpoon.ui").nav_file(1)
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>2", function()
			require("harpoon.ui").nav_file(2)
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>3", function()
			require("harpoon.ui").nav_file(3)
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>4", function()
			require("harpoon.ui").nav_file(4)
		end, { desc = "Harpoon mark file" })
		map("n", "<leader>5", function()
			require("harpoon.ui").nav_file(5)
		end, { desc = "Harpoon mark file" })
	end,
}
