return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            preset = "modern",
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            win = {
                border = "rounded",
                padding = { 2, 2, 2, 2 },
            },
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            },
            show_help = true,
            show_keys = true,
            disable = {
                ft = {},
                bt = {},
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            -- Register keymap groups
            wk.add({
                { "<leader>b", group = "Buffer" },
                { "<leader>f", group = "Find" },
                { "<leader>h", group = "Git Hunk" },
                { "<leader>t", group = "Toggle" },
            })
        end,
    },
}
