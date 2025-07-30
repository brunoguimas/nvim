return {
  "AstroNvim/astrotheme",

  config = function()
    require('astrotheme').setup({})
    vim.cmd([[colorscheme astrodark]])
  end,
}
