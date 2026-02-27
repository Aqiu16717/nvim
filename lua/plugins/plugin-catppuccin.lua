return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "auto", -- auto 会自动检测系统主题
            background = {
                light = "latte",
                dark = "mocha", -- 深色主题使用 mocha
            },
            transparent_background = false,
            show_end_of_buffer = false,
            term_colors = false,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.15,
            },
            no_italic = false,
            no_bold = false,
            no_underline = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = function(colors)
                return {
                    -- Make cursorline more visible
                    CursorLine = { bg = colors.surface1 },
                    CursorLineNr = { fg = colors.lavender, bg = colors.surface1, bold = true },
                    -- Visual selection
                    Visual = { bg = colors.surface2 },
                }
            end,
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)

            -- Function to get system theme (macOS/Linux)
            local function get_system_theme()
                local theme = "light"
                -- macOS
                local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
                if handle then
                    local result = handle:read("*a")
                    handle:close()
                    if result:match("Dark") then
                        theme = "dark"
                    end
                end
                return theme
            end

            -- Auto-detect and set theme
            local function apply_theme()
                local bg = get_system_theme()
                vim.o.background = bg
                vim.cmd.colorscheme("catppuccin")
            end

            -- Apply theme on startup
            apply_theme()

            -- Create user command to toggle theme
            vim.api.nvim_create_user_command("ThemeToggle", function()
                if vim.o.background == "dark" then
                    vim.o.background = "light"
                else
                    vim.o.background = "dark"
                end
                vim.cmd.colorscheme("catppuccin")
            end, { desc = "Toggle between light and dark theme" })

            -- Create user command to set specific theme
            vim.api.nvim_create_user_command("Theme", function(args)
                local flavour = args.args
                if flavour == "light" or flavour == "latte" then
                    vim.o.background = "light"
                elseif flavour == "dark" or flavour == "mocha" then
                    vim.o.background = "dark"
                else
                    print("Invalid theme. Use: light/latte or dark/mocha")
                    return
                end
                vim.cmd.colorscheme("catppuccin")
            end, { 
                nargs = 1, 
                desc = "Set theme (light/latte or dark/mocha)",
                complete = function()
                    return { "light", "dark", "latte", "mocha" }
                end
            })
        end,
    },
}
