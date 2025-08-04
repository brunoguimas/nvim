return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
    vim.fn.sign_define("DapStopped", { text = "🢂", texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticHint" })

    -- Mapeamentos de teclas
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<F1>", function() dap.continue() end, { desc = "Start/Continue Dap" })
    map("n", "<F2>", function() dap.step_over() end, { desc = "Step Over" })
    map("n", "<F3>", function() dap.step_into() end, { desc = "Step Into" })
    map("n", "<F4>", function() dap.step_out() end, { desc = "Step Out" })
    map("n", "<F5>", function() dapui.close() dap.terminate() end, { desc = "Terminate" })
    map("n", "<F6>", function() dapui.toggle() end, { desc = "Toggle DAP UI" })

    map("n", "<leader>B", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

    map("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { desc = "Log Point" })

    map("n", "<leader>dr", function() dap.repl.open() end, { desc = "Abrir REPL" })
    map("n", "<leader>K", function() require("dap.ui.widgets").hover() end, { desc = "Hover de variáveis" })

    map("n", "<leader>dq", function()
      dap.terminate()
      dapui.close()
    end, { desc = "Finalizar Debug" })
  end
}

