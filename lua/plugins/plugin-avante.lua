return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        opts = {
            -- Provider selection
            provider = "claude", -- 也可以选择 "openai", "azure", etc.
            
            -- Claude configuration (需要 ANTHROPIC_API_KEY 环境变量)
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-5-sonnet-20241022",
                temperature = 0,
                max_tokens = 4096,
            },
            
            -- OpenAI configuration (可选)
            -- openai = {
            --     endpoint = "https://api.openai.com/v1",
            --     model = "gpt-4o",
            --     temperature = 0,
            --     max_tokens = 4096,
            -- },
            
            -- 行为配置
            behaviour = {
                auto_suggestions = false, -- 自动建议
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                support_paste_from_clipboard = false,
                minimize_diff = true,
            },
            
            -- UI 配置
            windows = {
                position = "right", -- 侧边栏位置: left, right, top, bottom
                wrap = true,
                width = 30,
                sidebar_header = {
                    enabled = true,
                    align = "center",
                    rounded = true,
                },
                input = {
                    prefix = "> ",
                    height = 8,
                },
                edit = {
                    border = "rounded",
                    start_insert = true,
                },
                ask = {
                    floating = false,
                    start_insert = true,
                    border = "rounded",
                    focus_on_apply = "ours",
                },
            },
            
            -- 高亮配置
            highlights = {
                diff = {
                    current = "DiffText",
                    incoming = "DiffAdd",
                },
            },
            
            -- 冲突解决器
            --- @class AvanteConflictUserConfig
            diff = {
                autojump = true,
                list_opener = "copen",
                override_timeoutlen = 500,
            },
        },
        
        -- 依赖
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
