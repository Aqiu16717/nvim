return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup({
                view = {
                    side = "left",
                },
                on_attach = function(bufnr)
                    local api = require("nvim-tree.api")
                    api.config.mappings.default_on_attach(bufnr)
                end,
            })

            -- Fix cursorline when toggling nvim-tree
            local group = vim.api.nvim_create_augroup("NvimTreeFix", { clear = true })
            
            -- When leaving nvim-tree window, ensure cursorline is enabled in next window
            vim.api.nvim_create_autocmd("BufLeave", {
                group = group,
                pattern = "NvimTree_*",
                callback = function()
                    -- Schedule to run after window switch
                    vim.schedule(function()
                        local win = vim.api.nvim_get_current_win()
                        local buf = vim.api.nvim_win_get_buf(win)
                        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                        
                        -- Enable cursorline in non-nvim-tree windows
                        if ft ~= "NvimTree" then
                            vim.api.nvim_win_set_option(win, "cursorline", true)
                        end
                    end)
                end,
            })
            
            -- Also handle when nvim-tree is closed
            vim.api.nvim_create_autocmd("WinClosed", {
                group = group,
                callback = function(args)
                    local win_id = tonumber(args.match)
                    if not win_id then
                        return
                    end
                    
                    -- Check if the closed window was nvim-tree
                    local buf = vim.api.nvim_win_get_buf(win_id)
                    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                    
                    if ft == "NvimTree" then
                        -- Schedule to enable cursorline in the new current window
                        vim.schedule(function()
                            local current_win = vim.api.nvim_get_current_win()
                            vim.api.nvim_win_set_option(current_win, "cursorline", true)
                        end)
                    end
                end,
            })
        end,
    },
}
