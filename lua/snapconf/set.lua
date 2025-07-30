local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes:1"
opt.scrolloff = 8
opt.showcmd = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true
opt.clipboard = "unnamed"

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase =true

opt.termguicolors = true

opt.showmode = false

vim.opt.fillchars:append({ eob = " " })
-- No automatic comment insertion
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
