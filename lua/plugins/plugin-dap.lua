return {
    -- Core DAP (Debug Adapter Protocol) plugin
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- UI for DAP
            "rcarriga/nvim-dap-ui",
            -- Required by nvim-dap-ui
            "nvim-neotest/nvim-nio",
            -- Virtual text for current line
            "theHamsta/nvim-dap-virtual-text",
            -- Mason integration for automatic adapter installation
            "jay-babu/mason-nvim-dap.nvim",
        },
        keys = {
            -- Debugging controls
            { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
            { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", desc = "Conditional breakpoint" },
            { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Start/Continue debugging" },
            { "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate debugging" },
            { "<leader>dp", "<cmd>DapPause<cr>", desc = "Pause" },
            { "<leader>dr", "<cmd>DapRestart<cr>", desc = "Restart" },
            -- Step controls
            { "<leader>dj", "<cmd>DapStepOver<cr>", desc = "Step over" },
            { "<leader>dk", "<cmd>DapStepInto<cr>", desc = "Step into" },
            { "<leader>do", "<cmd>DapStepOut<cr>", desc = "Step out" },
            -- UI toggle
            { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle debug UI" },
            { "<leader>de", "<cmd>lua require('dapui').eval()<cr>", desc = "Evaluate expression" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Setup mason-nvim-dap for automatic adapter installation
            require("mason-nvim-dap").setup({
                automatic_installation = true,
                ensure_installed = {
                    "cppdbg",      -- Microsoft C++ debug adapter
                    "codelldb",    -- LLDB-based C++ debug adapter
                },
            })

            -- Configure C++ debugging adapters

            -- 1. codelldb (recommended for macOS/Linux)
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            -- 2. cppdbg (Microsoft C/C++ extension)
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
            }

            -- C++ configurations
            dap.configurations.cpp = {
                {
                    name = "Launch file (codelldb)",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
                {
                    name = "Launch file (cppdbg)",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
                {
                    name = "Attach to gdbserver :1234",
                    type = "cppdbg",
                    request = "launch",
                    MIMode = "gdb",
                    miDebuggerServerAddress = "localhost:1234",
                    miDebuggerPath = "/usr/bin/gdb",
                    cwd = "${workspaceFolder}",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                },
            }

            -- C uses same config as C++
            dap.configurations.c = dap.configurations.cpp
            -- Rust uses same config as C++
            dap.configurations.rust = dap.configurations.cpp

            -- Setup DAP UI
            dapui.setup({
                icons = {
                    expanded = "▾",
                    collapsed = "▸",
                    current_frame = "▸",
                },
                mappings = {
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
                            { id = "scopes", size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks", size = 0.25 },
                            { id = "watches", size = 0.25 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil,
                    max_width = nil,
                    border = "rounded",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil,
                    max_value_lines = 100,
                },
            })

            -- Setup virtual text
            require("nvim-dap-virtual-text").setup({
                enabled = true,
                enabled_commands = true,
                highlight_changed_variables = true,
                highlight_new_as_changed = false,
                show_stop_reason = true,
                commented = false,
                only_first_definition = true,
                all_references = false,
                filter_references_pattern = ".*",
                virt_text_pos = "eol",
                all_frames = false,
                virt_lines = false,
                virt_text_win_col = nil,
            })

            -- Auto open/close DAP UI
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- Signs for breakpoints
            vim.fn.sign_define("DapBreakpoint", {
                text = "●",
                texthl = "DapBreakpoint",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapBreakpointCondition", {
                text = "◆",
                texthl = "DapBreakpoint",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapLogPoint", {
                text = "◆",
                texthl = "DapLogPoint",
                linehl = "",
                numhl = "",
            })
            vim.fn.sign_define("DapStopped", {
                text = "▶",
                texthl = "DapStopped",
                linehl = "DapStopped",
                numhl = "DapStopped",
            })
            vim.fn.sign_define("DapBreakpointRejected", {
                text = "✖",
                texthl = "DapBreakpoint",
                linehl = "",
                numhl = "",
            })
        end,
    },
}
