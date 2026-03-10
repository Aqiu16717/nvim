return {
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/github-theme",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer
                    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
                    transparent = false, -- Disable setting bg (make bg transparent)
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false, -- Non focused panes set to alternative background
                    module_default = true, -- Default enable or disable all modules
                    styles = {
                        -- Style to be applied to different syntax groups
                        comments = "italic",
                        functions = "NONE",
                        keywords = "NONE",
                        variables = "NONE",
                        conditionals = "NONE",
                        constants = "NONE",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "NONE",
                    },
                    inverse = {
                        -- Inverse highlight for different types
                        match_paren = false,
                        visual = false,
                        search = false,
                    },
                    darken = {
                        -- Darken floating windows and sidebar-like windows
                        floats = false,
                        sidebars = {
                            enable = true,
                            list = {}, -- Apply dark background to specific windows
                        },
                    },
                    modules = { -- List of various plugins and additional options
                        coc = { enabled = false },
                        -- ... you can add more module configurations here
                    },
                },
                palettes = {},
                specs = {},
                groups = {},
            })

            -- Set the colorscheme to github_light (GitHub's light theme)
            vim.cmd("colorscheme github_light")

            -- Optional: You can also use other variants:
            -- vim.cmd("colorscheme github_light_default")
            -- vim.cmd("colorscheme github_light_high_contrast")
            -- vim.cmd("colorscheme github_light_colorblind")
            -- vim.cmd("colorscheme github_light_tritanopia")
        end,
    },
}
