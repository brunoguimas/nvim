-- lua/voidconf/remap.lua

local map = vim.keymap.set

-- Move lines with vmode + J or K
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Split screen
map("n", "<leader>v", "<CMD>vsplit<CR>")
--map("n", "<leader>h", "<CMD>split<CR>")

-- Unmap q:
map("n", "q:", "<nop>")

-- Move between windows with ctrl + hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Buffers
map("n", "<leader>x", "<CMD>bdelete<CR>", { desc = "Close buffer" })
map("n", "<C-n>", "<CMD>bnext<CR>", { desc = "Next buffer" })
map("n", "<C-p>", "<CMD>bprevious<CR>", { desc = "Previous buffer" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlights text when yanking",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
