-- Auto-detect .clang-format and set indentation accordingly
-- This ensures editor indentation matches the project's format during editing

local M = {}

-- Style presets for BasedOnStyle
local style_presets = {
    Google = { indent_width = 2, use_tab = "Never" },
    LLVM = { indent_width = 2, use_tab = "Never" },
    Chromium = { indent_width = 2, use_tab = "Never" },
    Mozilla = { indent_width = 2, use_tab = "Never" },
    WebKit = { indent_width = 4, use_tab = "Never" },
    Microsoft = { indent_width = 4, use_tab = "Always" },
    GNU = { indent_width = 2, use_tab = "Never" },
}

-- Parse .clang-format file to extract indentation settings
function M.parse_clang_format()
    -- Search for .clang-format or _clang-format in current directory and parents
    local clang_format_file = vim.fn.findfile(".clang-format", ".;")
    
    if clang_format_file == "" then
        clang_format_file = vim.fn.findfile("_clang-format", ".;")
    end
    
    if clang_format_file == "" then
        return nil
    end
    
    local settings = {}
    local file = io.open(clang_format_file, "r")
    
    if not file then
        return nil
    end
    
    local content = file:read("*all")
    file:close()
    
    -- Check for BasedOnStyle first
    local based_on = content:match("BasedOnStyle%s*:%s*(%w+)")
    if based_on and style_presets[based_on] then
        -- Apply preset defaults
        local preset = style_presets[based_on]
        settings.indent_width = preset.indent_width
        settings.use_tab = preset.use_tab
        settings.based_on = based_on
    end
    
    -- Check for IndentWidth (handles "IndentWidth: 2" or "IndentWidth:    2")
    -- This will override the preset if explicitly set
    local indent_width = content:match("IndentWidth%s*:%s*(%d+)")
    if indent_width then
        settings.indent_width = tonumber(indent_width)
    end
    
    -- Check for UseTab (Never, ForIndentation, ForContinuationAndIndentation, Always)
    local use_tab = content:match("UseTab%s*:%s*(%w+)")
    if use_tab then
        settings.use_tab = use_tab
    end
    
    -- Check for TabWidth
    local tab_width = content:match("TabWidth%s*:%s*(%d+)")
    if tab_width then
        settings.tab_width = tonumber(tab_width)
    end
    
    -- Also store the config file path for debugging
    settings.config_file = clang_format_file
    
    return settings
end

-- Apply indentation settings from .clang-format
function M.apply_indentation()
    -- Only apply to C/C++ files
    local ft = vim.bo.filetype
    if ft ~= "c" and ft ~= "cpp" and ft ~= "objc" and ft ~= "objcpp" then
        return
    end
    
    local settings = M.parse_clang_format()
    
    if not settings then
        return
    end
    
    local changes = {}
    
    -- Set shiftwidth and tabstop based on .clang-format
    if settings.indent_width then
        vim.bo.shiftwidth = settings.indent_width
        vim.bo.softtabstop = settings.indent_width
        
        -- If using tabs, set tabstop
        if settings.tab_width then
            vim.bo.tabstop = settings.tab_width
        else
            vim.bo.tabstop = settings.indent_width
        end
        
        table.insert(changes, string.format("sw=%d", settings.indent_width))
    end
    
    -- Set expandtab based on UseTab
    if settings.use_tab then
        if settings.use_tab == "Never" then
            vim.bo.expandtab = true
        elseif settings.use_tab == "Always" then
            vim.bo.expandtab = false
        else
            -- ForIndentation or ForContinuationAndIndentation - use spaces
            vim.bo.expandtab = true
        end
        
        table.insert(changes, string.format("et=%s", vim.bo.expandtab and "true" or "false"))
    else
        -- Default: use spaces
        vim.bo.expandtab = true
    end
    
    -- Show notification if changes were made
    if #changes > 0 then
        local msg = string.format("Applied .clang-format (%s): %s", 
            vim.fn.fnamemodify(settings.config_file, ":~:."),
            table.concat(changes, ", "))
        
        -- Use vim.schedule to avoid interrupting during startup
        vim.schedule(function()
            vim.notify(msg, vim.log.levels.INFO, { title = "Clang Format" })
        end)
    end
end

-- Setup autocommand for C/C++ files
function M.setup()
    local group = vim.api.nvim_create_augroup("ClangFormatDetector", { clear = true })
    
    -- Apply when reading or creating C/C++ files
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        group = group,
        pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.cxx", "*.c++", "*.m", "*.mm" },
        callback = function()
            M.apply_indentation()
        end,
        desc = "Auto-detect .clang-format and set indentation",
    })
    
    -- Also apply when entering a buffer (for already open files)
    vim.api.nvim_create_autocmd("BufEnter", {
        group = group,
        pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.cxx", "*.c++", "*.m", "*.mm" },
        callback = function()
            -- Only if not already set
            if vim.b.clang_format_applied ~= true then
                M.apply_indentation()
                vim.b.clang_format_applied = true
            end
        end,
        desc = "Apply .clang-format on buffer enter",
    })
end

-- Manual command to check and apply
vim.api.nvim_create_user_command("ClangFormatInfo", function()
    local settings = M.parse_clang_format()
    if settings then
        print("Found .clang-format: " .. settings.config_file)
        print("IndentWidth: " .. (settings.indent_width or "not set"))
        print("UseTab: " .. (settings.use_tab or "not set"))
        print("TabWidth: " .. (settings.tab_width or "not set"))
        print("")
        print("Current buffer settings:")
        print("shiftwidth: " .. vim.bo.shiftwidth)
        print("tabstop: " .. vim.bo.tabstop)
        print("expandtab: " .. tostring(vim.bo.expandtab))
    else
        print("No .clang-format found")
    end
end, { desc = "Show .clang-format info" })

-- Quick set commands for common styles
vim.api.nvim_create_user_command("SetGoogleStyle", function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.notify("Applied Google Style (2 spaces)", vim.log.levels.INFO)
end, { desc = "Set indentation to Google Style (2 spaces)" })

vim.api.nvim_create_user_command("SetLLVMStyle", function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.notify("Applied LLVM Style (2 spaces)", vim.log.levels.INFO)
end, { desc = "Set indentation to LLVM Style (2 spaces)" })

vim.api.nvim_create_user_command("SetChromiumStyle", function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.notify("Applied Chromium Style (2 spaces)", vim.log.levels.INFO)
end, { desc = "Set indentation to Chromium Style (2 spaces)" })

vim.api.nvim_create_user_command("SetMozillaStyle", function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.notify("Applied Mozilla Style (2 spaces)", vim.log.levels.INFO)
end, { desc = "Set indentation to Mozilla Style (2 spaces)" })

vim.api.nvim_create_user_command("SetWebKitStyle", function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
    vim.notify("Applied WebKit Style (4 spaces)", vim.log.levels.INFO)
end, { desc = "Set indentation to WebKit Style (4 spaces)" })

vim.api.nvim_create_user_command("SetMicrosoftStyle", function()
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = false  -- Microsoft uses tabs
    vim.notify("Applied Microsoft Style (4 tabs)", vim.log.levels.INFO)
end, { desc = "Set indentation to Microsoft Style (4 tabs)" })

return M
