return {
    {
        "keaising/im-select.nvim",
        event = "VeryLazy",
        config = function()
            -- Find im-select binary path
            local im_select_path = nil

            -- Check common paths
            local possible_paths = {
                "/opt/homebrew/bin/im-select",
                "/usr/local/bin/im-select",
                vim.fn.expand("~/.local/bin/im-select"),
            }

            for _, path in ipairs(possible_paths) do
                if vim.fn.filereadable(path) == 1 then
                    im_select_path = path
                    break
                end
            end

            -- Fallback to system which
            if not im_select_path then
                im_select_path = vim.fn.system("which im-select 2>/dev/null"):gsub("%s+$", "")
                if im_select_path == "" then
                    im_select_path = nil
                end
            end

            if not im_select_path then
                vim.notify(
                    "[im-select] Binary not found. Input method auto-switching is disabled.\n" ..
                    "To enable, install im-select:\n" ..
                    "  macOS: brew install im-select\n" ..
                    "  Or visit: https://github.com/daipeihust/im-select",
                    vim.log.levels.WARN
                )
                return
            end

            require("im_select").setup({
                -- Use absolute path to im-select
                default_command = im_select_path,

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
