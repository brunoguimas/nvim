return {
  'goolord/alpha-nvim',
  config = function ()

    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button('n', "  > New file", '<CMD>enew<CR>'),
      dashboard.button('s', "󰑓  > Restore session", '<CMD>SessionRestore<CR>'),
      dashboard.button('f', "  > Find file", '<CMD>SessionRestore<CR>'),
      dashboard.button('r', "  > Recent", '<CMD>Telescope oldfiles<CR>'),
      dashboard.button('c', "  > Config", '<CMD>Telescope find_files search_dirs=~/.config/nvim<CR>'),
      dashboard.button('q', "󰗼  > Quit", '<CMD>qa<CR>'),
    }

    local function footer()
      return "Don't stop"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
}
