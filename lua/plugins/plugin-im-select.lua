return {
    {
        "keaising/im-select.nvim",
        event = "VeryLazy",
        config = function()
            -- Check if im-select binary exists using vim's executable function
            if vim.fn.executable("im-select") ~= 1 then
                vim.notify(
                    "[im-select] Binary not found. Input method auto-switching is disabled.\n" ..
                    "To enable, install im-select:\n" ..
                    "  macOS: brew install im-select\n" ..
                    "  Or: curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install.sh | sh",
                    vim.log.levels.WARN
                )
                return
            end

            require("im_select").setup({
                -- Default input method (English)
                default_im_select = "com.apple.keylayout.US",

                -- Events to switch to default input method
                set_default_events = {
                    "VimEnter",
                    "FocusGained",
                    "InsertLeave",
                    "CmdLineLeave",
                },

                -- Events to restore previous input method
                set_previous_events = {
                    "InsertEnter",
                },

                -- Events to keep default input method
                keep_default_events = {
                    "FocusLost",
                },

                -- Async execution (non-blocking)
                async = true,
            })
        end,
    },
}
