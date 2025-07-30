local map = vim.keymap.set

-- Basic commands
map('n', '<leader>o', '<CMD>wqa<CR>', { desc = "Quit and save" })
map('n', '<leader>q', '<CMD>qa<CR>', { desc = "Quit" })
map('n', '<leader>w', '<CMD>w<CR>', { desc = "Write" })
map('n', '<leader>n', '<CMD>enew<CR>', { desc = "Create new file" })

-- Restore session
map('n', '<leader>sr', '<CMD>SessionRestore<CR>', { desc = "Restore session" })

-- Buffers
map('n', '<Tab>', '<CMD>bnext<CR>', { desc = "Next buffer" })
map('n', '<S-Tab>', '<CMD>bprevious<CR>', { desc = "Previous buffer" })

-- Move between windows with ctrl + hjkl
map('n', '<C-h>', '<C-w>h', { desc = "Move to left window"})
map('n', '<C-j>', '<C-w>j', { desc = "Move to down window"})
map('n', '<C-k>', '<C-w>k', { desc = "Move to up window"})
map('n', '<C-l>', '<C-w>l', { desc = "Move to right window"})
-- Move lines using alt + hjkl
map('n', '<A-j>', "<CMD>m .+1<CR>==")
map('n', '<A-k>', "<CMD>m .-2<CR>==")
map('v', '<A-j>', "<CMD>m '>+1<CR>gv=gv")
map('v', '<A-k>', "<CMD>m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable the fucking annoying command history bind
map('n', 'q<CMD>', '<nop')
