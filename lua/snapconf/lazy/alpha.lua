return {
  'goolord/alpha-nvim',
  config = function ()

    local status_ok, alpha = pcall(require, "alpha")
    if not status_ok then
      return
    end

    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.buttons.val = {
      dashboard.button("SPC e", "  > New file"),
      dashboard.button("SPC f f", "  > Find file"),
      dashboard.button("SPC f r", "  > Recent"),
      dashboard.button("s", "  > Settings", ":NvimTreeOpen ~/.config/nvim<CR>"),
      dashboard.button("q", "󰗼  > Quit", ":qa<CR>"),
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
