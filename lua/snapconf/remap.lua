local map = vim.keymap.set

-- Basic commands
map('n', '<leader>q', ':qa<CR>')
map('n', '<leader>w', ':w<CR>')

-- Move lines using alt + hjkl
map('n', '<A-j>', ":m .+1<CR>==")
map('n', '<A-k>', ":m .-2<CR>==")
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable the fucking annoying command history bind
map('n', 'q:', '<nop')
