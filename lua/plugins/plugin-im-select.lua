return {
    {
        "keaising/im-select.nvim",
        event = "VeryLazy",
        config = function()
            -- Check if im-select is available
            -- First try vim.fn.executable (checks PATH)
            -- Then try common paths as fallback
            local function find_im_select()
                -- Method 1: Check PATH via vim.fn.executable
                if vim.fn.executable("im-select") == 1 then
                    return "im-select"
                end

                -- Method 2: Check common installation paths
                local common_paths = {
                    "/opt/homebrew/bin/im-select",      -- macOS Apple Silicon (Homebrew)
                    "/usr/local/bin/im-select",          -- macOS Intel (Homebrew)
                    vim.fn.expand("~/.local/bin/im-select"), -- User local
                    "/usr/bin/im-select",                -- Linux system
                }

                for _, path in ipairs(common_paths) do
                    if vim.fn.filereadable(path) == 1 then
                        return path
                    end
                end

                return nil
            end

            local im_select_cmd = find_im_select()

            if not im_select_cmd then
                vim.notify(
                    "[im-select] Binary not found. Input method auto-switching is disabled.\n" ..
                    "To enable, install im-select:\n" ..
                    "  macOS: brew install im-select\n" ..
                    "  Or: https://github.com/daipeihust/im-select",
                    vim.log.levels.WARN
                )
                return
            end

            require("im_select").setup({
                -- Command to switch input method
                -- Uses "im-select" if in PATH, otherwise uses absolute path
                default_command = im_select_cmd,

                -- Default input method (English)
                -- macOS: com.apple.keylayout.ABC (or com.apple.keylayout.US)
                -- Change this to match your system's English input method
                default_im_select = "com.apple.keylayout.ABC",

                -- Events to switch to default (English) input method
                set_default_events = {
                    "VimEnter",       -- When entering Neovim
                    "FocusGained",    -- When window gets focus
                    "InsertLeave",    -- When leaving insert mode (press Esc)
                    "CmdLineLeave",   -- When leaving command line
                },

                -- Events to restore previous input method
                set_previous_events = {
                    "InsertEnter",    -- When entering insert mode (press i)
                },

                -- Events to keep default input method
                keep_default_events = {
                    "FocusLost",      -- When window loses focus
                },

                -- Async execution (non-blocking)
                async = true,
            })
        end,
    },
}
