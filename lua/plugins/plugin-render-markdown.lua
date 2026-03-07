return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        ft = { "markdown", "markdown.mdx", "codecompanion" },
        opts = {
            -- Enable rendering
            enabled = true,

            -- Render modes: 'normal', 'insert', 'visual', 'cmdline', 'replace'
            -- 'all' to render in all modes
            render_modes = { "n", "c", "t" },

            -- Anti-conceal settings (show hidden text on cursor line)
            anti_conceal = {
                enabled = true,
                -- Which elements to always show
                ignore = {
                    code_background = true,
                    sign = true,
                },
            },

            -- Padding settings
            padding = {
                -- Highlight to use for adding padding
                highlight = "Normal",
            },

            -- Heading settings
            heading = {
                -- Turn on / off heading icon & background rendering
                enabled = true,
                -- Turn on / off any sign column related rendering
                sign = true,
                -- Replaces '#+' of 'atx_h._marker'
                -- The number of '#' in the heading determines the 'level'
                -- The 'level' is used to index into the list using a cycle
                icons = { " ", " ", " ", " ", " ", " " },
                -- Added to the sign column if enabled
                -- The 'level' is used to index into the list using a cycle
                signs = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
                -- Width of the heading background
                width = "full",
                -- Amount of margin to add to the left of headings
                -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
                left_margin = 0,
                -- Minimum width to use for headings
                min_width = 0,
                -- Determines how the icon fills the available space
                --  right:   '#'s are concealed and icon is right aligned
                --  inline:  '#'s are concealed and icon is left aligned
                --  overlay: icon is left aligned but takes up no space
                position = "overlay",
                -- Highlight groups for heading backgrounds & foreground
                backgrounds = {
                    "RenderMarkdownH1Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH3Bg",
                    "RenderMarkdownH4Bg",
                    "RenderMarkdownH5Bg",
                    "RenderMarkdownH6Bg",
                },
                foregrounds = {
                    "RenderMarkdownH1",
                    "RenderMarkdownH2",
                    "RenderMarkdownH3",
                    "RenderMarkdownH4",
                    "RenderMarkdownH5",
                    "RenderMarkdownH6",
                },
            },

            -- Code block settings
            code = {
                -- Turn on / off code block & inline code rendering
                enabled = true,
                -- Turn on / off any sign column related rendering
                sign = true,
                -- Determines how code blocks & inline code are rendered
                --  normal:   adds highlight group to code blocks & inline code
                --  language: adds language icon to sign column and icon + name above code blocks
                --  full:     normal + language
                style = "full",
                -- Amount of padding to add to the left of code blocks
                left_margin = 0,
                -- Amount of padding to add to the right of code blocks when width is 'block'
                right_margin = 0,
                -- Width of the code block background
                --  block: width of the code block
                --  full:  full width of the window
                width = "full",
                -- Minimum width to use for code blocks when width is 'block'
                min_width = 0,
                -- Determins how the top / bottom of code block are rendered
                --  thick: use the same highlight as the code body
                --  thin:  when lines are empty overlay the above & below icons
                border = "thin",
                -- Used above code blocks for thin border
                above = "▄",
                -- Used below code blocks for thin border
                below = "▀",
                -- Highlight for code blocks & inline code
                highlight = "RenderMarkdownCode",
                -- Highlight for language, overrides icon provider value
                highlight_language = nil,
                -- Icon provider for code blocks
                --  inline:  uses the icon directly
                --  above:   adds the icon above the code block
                --  above_s: adds the icon and language name above the code block
                icon_provider = function(language)
                    local icons = {
                        python = "",
                        lua = "",
                        javascript = "",
                        typescript = "",
                        rust = "",
                        go = "",
                        bash = "",
                        shell = "",
                        sh = "",
                        markdown = "",
                        html = "",
                        css = "",
                        json = "",
                        yaml = "",
                        vim = "",
                        sql = "",
                        dockerfile = "",
                        make = "",
                        cmake = "",
                        cpp = "",
                        c = "",
                        java = "",
                        ruby = "",
                        php = "",
                        perl = "",
                        r = "",
                        scala = "",
                        kotlin = "",
                        swift = "",
                        objectivec = "",
                        julia = "",
                        haskell = "",
                        clojure = "",
                        erlang = "",
                        elixir = "",
                        dart = "",
                        flutter = "",
                    }
                    return icons[language] or ""
                end,
            },

            -- Dash settings (horizontal lines)
            dash = {
                -- Turn on / off thematic break rendering
                enabled = true,
                -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
                -- The icon gets repeated across the window's width
                icon = "─",
                -- Width of the generated line
                --  <number>: a hard coded width value
                --  full:     full width of the window
                width = "full",
                -- Highlight for the line
                highlight = "RenderMarkdownDash",
            },

            -- Bullet point settings
            bullet = {
                -- Turn on / off list bullet rendering
                enabled = true,
                -- Replaces '-'|'*'|'+' of 'list_item'
                -- How deeply nested the list is determines the 'level'
                -- The 'level' is used to index into the list using a cycle
                icons = { "●", "○", "◆", "◇" },
                -- Padding to add to the right of bullet point
                right_pad = 1,
                -- Highlight for the bullet icon
                highlight = "RenderMarkdownBullet",
            },

            -- Checkbox settings
            checkbox = {
                -- Turn on / off checkbox state rendering
                enabled = true,
                -- Determines how icons fill the available space
                --  inline:  underlying text is concealed resulting in a left aligned icon
                --  overlay: result is left padded with spaces to hide any underlying text
                position = "inline",
                unchecked = {
                    -- Replaces '[ ]' of 'task_list_marker_unchecked'
                    icon = "  ",
                    -- Highlight for the unchecked icon
                    highlight = "RenderMarkdownUnchecked",
                    -- Highlight for item associated with unchecked checkbox
                    scope_highlight = nil,
                },
                checked = {
                    -- Replaces '[x]' of 'task_list_marker_checked'
                    icon = "  ",
                    -- Highlight for the checked icon
                    highlight = "RenderMarkdownChecked",
                    -- Highlight for item associated with checked checkbox
                    scope_highlight = nil,
                },
                -- Define custom checkbox states
                custom = {
                    todo = { raw = "[-]", rendered = "  ", highlight = "RenderMarkdownTodo" },
                },
            },

            -- Quote settings
            quote = {
                -- Turn on / off block quote rendering
                enabled = true,
                -- Replaces '>' of 'block_quote_marker'
                icon = "▋",
                -- Whether to repeat icon on wrapped lines
                repeat_linebreak = false,
                -- Highlight for the quote icon
                highlight = "RenderMarkdownQuote",
            },

            -- Table settings
            pipe_table = {
                -- Turn on / off pipe table rendering
                enabled = true,
                -- Preconfigured settings known to work well
                --  heavy:  use thicker lines
                --  double: use double lines
                --  round:  use round corners
                --  none:   no alignment
                preset = "none",
                -- Determines how the table as a whole is rendered
                --  full:   renders each table cell with a border
                --  normal: renders a border line between rows
                --  none:   disables table rendering
                style = "full",
                -- Determines how cells in a table are rendered
                --  overlay: writes directly over the buffer, concealing underlying text
                --  raw:     leaves cells as is, directly in the buffer
                cell = "overlay",
                -- Gets placed in delimiter row for each column
                alignment_indicator = "━",
                -- Characters used to replace table border
                border = {
                    "┌", "┬", "┐",
                    "├", "┼", "┤",
                    "└", "┴", "┘",
                    "│", "─",
                },
                -- Highlight for table heading
                head = "RenderMarkdownTableHead",
                -- Highlight for table row
                row = "RenderMarkdownTableRow",
                -- Highlight for inline code used in table cell
                filler = "RenderMarkdownTableFill",
            },

            -- Inline link settings
            link = {
                -- Turn on / off inline link icon rendering
                enabled = true,
                -- Inlined with 'image' elements
                image = "",
                -- Inlined with 'inline_link' elements
                hyperlink = "",
                -- Applies to the inlined icon as a fallback
                highlight = "RenderMarkdownLink",
                -- Define custom destination patterns so icons can quickly inform you of what
                -- the link leads to
                custom = {
                    web = { pattern = "^http[s]?://", icon = "  ", highlight = "RenderMarkdownLink" },
                    github = { pattern = "github%.com", icon = "", highlight = "RenderMarkdownLink" },
                },
            },

            -- LaTeX settings
            latex = {
                -- Turn on / off LaTeX block rendering
                enabled = true,
                -- Additional modes to render LaTeX
                render_modes = false,
                -- Executable used to convert latex formula to rendered unicode
                converter = "latex2text",
                -- Highlight for LaTeX blocks
                highlight = "RenderMarkdownMath",
                -- Amount of empty lines above LaTeX blocks
                top_pad = 0,
                -- Amount of empty lines below LaTeX blocks
                bottom_pad = 0,
            },

            -- Spacing between lines
            win_options = {
                -- See :h 'conceallevel'
                conceallevel = {
                    -- Used when not being rendered, get user setting
                    default = vim.api.nvim_get_option_value("conceallevel", {}),
                    -- Used when being rendered, concealed text is completely hidden
                    rendered = 3,
                },
                -- See :h 'concealcursor'
                concealcursor = {
                    -- Used when not being rendered, get user setting
                    default = vim.api.nvim_get_option_value("concealcursor", {}),
                    -- Used when being rendered, disable concealing in all modes
                    rendered = "",
                },
            },

            -- Markdown files to ignore
            ignore = function(bufnr)
                return false
            end,

            -- Completions from markdown source (computed value with default `cmp`)
            completions = {
                -- Settings for blink.cmp completions source
                blink = { enabled = false },
                -- Settings for coq_nvim completions source
                coq = { enabled = false },
                -- Settings for in-process language server completions source
                lsp = { enabled = false },
                -- Settings for nvim-cmp completions source
                nvim_cmp = { enabled = false },
            },
        },
        config = function(_, opts)
            require("render-markdown").setup(opts)

            -- Create toggle command
            vim.api.nvim_create_user_command("RenderMarkdownToggle", function()
                require("render-markdown").toggle()
            end, { desc = "Toggle markdown rendering" })

            -- Create keymap to toggle
            vim.keymap.set("n", "<leader>mp", "<cmd>RenderMarkdownToggle<cr>", { desc = "Toggle markdown preview (inline)" })
        end,
    },
}
