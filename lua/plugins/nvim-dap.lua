return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },

        config = function()
            local dap = require("dap")

            require('dap-go')

            vim.api.nvim_set_hl(0, "DapSign", { fg = "#ffffff" })

            vim.fn.sign_define("DapBreakpoint", {
                text = "●",
                texthl = "DapSign",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapBreakpointCondition", {
                text = "◆",
                texthl = "DapSign",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapBreakpointRejected", {
                text = "○",
                texthl = "DapSign",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapLogPoint", {
                text = "■",
                texthl = "DapSign",
                linehl = "",
                numhl = "",
            })

            local function go_mod_root()
                local buf = vim.api.nvim_get_current_buf()
                local fname = vim.api.nvim_buf_get_name(buf)
                local start = (fname ~= "" and vim.fs.dirname(fname)) or vim.fn.getcwd()
                local mod = vim.fs.find("go.mod", { path = start, upward = true })[1]
                if mod then
                    return vim.fs.dirname(mod)
                end
                return vim.fn.getcwd()
            end

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            local last_exec = nil
            dap.configurations.c = {
                {
                    name = "Debug C",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        if last_exec == nil then
                            local exec = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                            last_exec = exec
                            return exec
                        else
                            print(last_exec)
                            return last_exec
                        end
                    end,
                    cwd = "${workspaceFolder}",
                },
            }

            local map = vim.keymap.set

            map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
            map("n", "<Leader>dc", dap.continue, { desc = "Continue" })
            map("n", "<Leader>di", dap.step_into, { desc = "Step into" })
            map("n", "<Leader>do", dap.step_out, { desc = "Step out" })
            map("n", "<Leader>dv", dap.step_over, { desc = "Step over" })
            map("n", "<Leader>dt", dap.terminate, { desc = "Terminate" })
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "rcarriga/nvim-dap-ui" },
        event = "VeryLazy",

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            require("nvim-dap-virtual-text").setup()

            dapui.setup({
                expand_lines = true,
                icons = { expanded = "", collapsed = "", circular = "" },
                mappings = {
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.33 },
                            { id = "breakpoints", size = 0.17 },
                            { id = "stacks",      size = 0.25 },
                            { id = "watches",     size = 0.25 },
                        },
                        size = 0.33,
                        position = "right",
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.45 },
                            { id = "console", size = 0.55 },
                        },
                        size = 0.27,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = 0.9,
                    max_width = 0.5,             -- Floats will be treated as percentage of your screen.
                    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
            }) -- use defa

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.api.nvim_create_user_command("DapCloseUI", function()
                require("dapui").close()
            end, {})
        end,
    },
}
