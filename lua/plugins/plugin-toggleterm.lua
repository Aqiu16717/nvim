return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        keys = {
            { "<leader>tt", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal (horizontal)" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle terminal (float)" },
            { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle terminal (vertical)" },
            { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", desc = "Open lazygit" },
            { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Open python" },
            { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>", desc = "Open node" },
        },
        config = function()
            require("toggleterm").setup({
                size = function(term)
                    if term.direction == "horizontal" then
                        return 15
                    elseif term.direction == "vertical" then
                        return vim.o.columns * 0.4
                    end
                end,
                open_mapping = [[<c-\>]], -- Ctrl+\ to toggle
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                terminal_mappings = true,
                persist_size = true,
                direction = "horizontal", -- horizontal, vertical, float, tab
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
                winbar = {
                    enabled = false,
                },
            })

            -- Custom terminal functions
            local Terminal = require("toggleterm.terminal").Terminal

            -- Lazygit terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                dir = "git_dir",
                direction = "float",
                float_opts = {
                    border = "double",
                },
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                end,
                on_close = function()
                    vim.cmd("checktime")
                end,
            })

            function _LAZYGIT_TOGGLE()
                lazygit:toggle()
            end

            -- Python terminal
            local python = Terminal:new({
                cmd = "python3",
                direction = "horizontal",
                on_open = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            function _PYTHON_TOGGLE()
                python:toggle()
            end

            -- Node terminal
            local node = Terminal:new({
                cmd = "node",
                direction = "horizontal",
                on_open = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            function _NODE_TOGGLE()
                node:toggle()
            end

            -- Auto-exit terminal mode on escape
            vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
        end,
    },
}
