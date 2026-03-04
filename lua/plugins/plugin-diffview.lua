return {
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewFileHistory",
        },
        keys = {
            -- 打开 Diffview 查看工作区修改
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diff view" },
            -- 查看当前文件历史
            { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
            -- 查看整个项目历史
            { "<leader>gF", "<cmd>DiffviewFileHistory<cr>", desc = "Project history" },
            -- 关闭 Diffview
            { "<leader>gC", "<cmd>DiffviewClose<cr>", desc = "Close diff view" },
        },
        opts = {
            diff_binaries = false,
            enhanced_diff_hl = true,
            git_cmd = { "git" },
            use_icons = true,
            icons = {
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
            },
            view = {
                default = {
                    layout = "diff2_horizontal",
                },
                merge_tool = {
                    layout = "diff3_horizontal",
                    disable_diagnostics = true,
                },
                file_history = {
                    layout = "diff2_horizontal",
                },
            },
            file_panel = {
                listing_style = "tree",
                tree_options = {
                    flatten_dirs = true,
                    folder_statuses = "only_folded",
                },
                win_config = {
                    position = "left",
                    width = 35,
                },
            },
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                },
                win_config = {
                    position = "bottom",
                    height = 16,
                },
            },
            commit_log_panel = {
                win_config = {},
            },
            default_args = {
                DiffviewOpen = {},
                DiffviewFileHistory = {},
            },
            hooks = {
                diff_buf_read = function(bufnr)
                    -- 在 diff buffer 中禁用光标行，避免视觉干扰
                    vim.opt_local.cursorline = false
                end,
            },
            keymaps = {
                disable_defaults = false,
                view = {
                    -- 自定义 diffview 窗口内的快捷键
                    ["q"] = "<cmd>DiffviewClose<cr>",
                    ["<tab>"] = "<cmd>DiffviewToggleFiles<cr>",
                },
                file_panel = {
                    ["q"] = "<cmd>DiffviewClose<cr>",
                    ["j"] = "next_entry",
                    ["k"] = "prev_entry",
                    ["o"] = "select_entry",
                    ["<cr>"] = "select_entry",
                    ["-"] = "toggle_stage_entry",
                    ["S"] = "stage_all",
                    ["U"] = "unstage_all",
                    ["X"] = "restore_entry",
                    ["R"] = "refresh_files",
                    ["<tab>"] = "<cmd>DiffviewToggleFiles<cr>",
                },
                file_history_panel = {
                    ["q"] = "<cmd>DiffviewClose<cr>",
                    ["j"] = "next_entry",
                    ["k"] = "prev_entry",
                    ["o"] = "select_entry",
                    ["<cr>"] = "select_entry",
                    ["<tab>"] = "<cmd>DiffviewToggleFiles<cr>",
                },
            },
        },
    },
}
