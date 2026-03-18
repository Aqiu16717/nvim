-- Project-specific configuration loader
-- Automatically loads .nvim.lua from project root

local M = {}

function M.setup()
    local group = vim.api.nvim_create_augroup("ProjectConfig", { clear = true })
    
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = group,
        callback = function(args)
            -- Find .nvim.lua in project root
            local nvim_lua = vim.fn.findfile(".nvim.lua", ".;")
            
            if nvim_lua == "" then
                return
            end
            
            -- Check if already loaded for this buffer
            if vim.b[args.buf].project_config_loaded then
                return
            end
            
            -- Load the project config
            local ok, err = pcall(dofile, nvim_lua)
            if ok then
                vim.b[args.buf].project_config_loaded = true
                vim.notify("Loaded project config: " .. nvim_lua, vim.log.levels.INFO)
            else
                vim.notify("Error loading project config: " .. err, vim.log.levels.WARN)
            end
        end,
        desc = "Load project-specific .nvim.lua config",
    })
end

return M
