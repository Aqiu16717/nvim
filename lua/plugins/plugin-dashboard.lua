return {
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local dashboard = require("dashboard")

            -- Custom center section with actions
            dashboard.setup({
                theme = "hyper", -- or "doom"
                config = {
                    -- Header logo
                    header = {
                        "",
                        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                        "",
                        "                    [ Neovim IDE ]                      ",
                        "",
                    },

                    -- Shortcut actions
                    shortcut = {
                        {
                            desc = "📁  Find File",
                            group = "Label",
                            action = "Telescope find_files",
                            key = "f",
                        },
                        {
                            desc = "📄  Recent Files",
                            group = "Label",
                            action = "Telescope oldfiles",
                            key = "r",
                        },
                        {
                            desc = "🔍  Find Text",
                            group = "Label",
                            action = "Telescope live_grep",
                            key = "g",
                        },
                        {
                            desc = "⚙️   Config",
                            group = "Label",
                            action = "edit ~/.config/nvim/init.lua",
                            key = "c",
                        },
                        {
                            desc = "📦  Update Plugins",
                            group = "Label",
                            action = "Lazy sync",
                            key = "u",
                        },
                        {
                            desc = "❌  Quit",
                            group = "Label",
                            action = "qa",
                            key = "q",
                        },
                    },

                    -- Project list (recent projects)
                    project = {
                        enable = true,
                        limit = 5,
                        icon = "🗂️  ",
                        label = " Recent Projects",
                        action = "Telescope find_files cwd=",
                    },

                    -- Recent files
                    mru = {
                        enable = true,
                        limit = 5,
                        icon = "📝 ",
                        label = " Recent Files",
                        cwd_only = false,
                    },

                    -- Footer message
                    footer = {
                        "",
                        "🚀  Neovim loaded successfully!",
                        "",
                    },

                    -- Packages loaded info
                    packages = { enable = true },

                    -- Week info
                    week = { enable = false },
                },

                -- Hide statusline and tabline on dashboard
                hide = {
                    statusline = true,
                    tabline = true,
                    winbar = true,
                },
            })

            -- Open dashboard when no args provided
            vim.api.nvim_create_autocmd("VimEnter", {
                callback = function()
                    -- Only open dashboard if no file argument provided
                    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
                        dashboard.open()
                    end
                end,
            })

            -- Keymap to open dashboard (using <leader>H to avoid conflict with window navigation)
            vim.keymap.set("n", "<leader>H", "<cmd>Dashboard<cr>", { desc = "Open dashboard" })
        end,
    },
}
