return {
    {
        "keaising/im-select.nvim",
        event = "VeryLazy",
        config = function()
            require("im_select").setup({
                -- 默认输入法（英文）
                default_im_select = "com.apple.keylayout.US",

                -- 切换到默认输入法的触发事件
                set_default_events = {
                    "VimEnter",       -- 进入 Neovim
                    "FocusGained",    -- 窗口获得焦点
                    "InsertLeave",    -- 离开插入模式
                    "CmdLineLeave",   -- 离开命令行
                },

                -- 恢复之前输入法的触发事件
                set_previous_events = {
                    "InsertEnter",    -- 进入插入模式
                },

                -- 保持默认输入法的事件
                keep_default_events = {
                    "FocusLost",      -- 窗口失去焦点
                },

                -- 异步执行（避免阻塞）
                async = true,
            })
        end,
    },
}
