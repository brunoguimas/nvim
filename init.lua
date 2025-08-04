require('snapconf')
require("config.lsp")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.rs",
  callback = function()
    local cargo_toml = vim.fn.findfile("Cargo.toml", ".;")
    if cargo_toml ~= "" then
      local cargo_dir = vim.fn.fnamemodify(cargo_toml, ":h")
      vim.cmd("lcd " .. cargo_dir) -- muda o diretório local do Neovim
    end
  end,
})

