-- Auto-detect .clang-format and set indentation accordingly
-- This ensures editor indentation matches the project's format during editing

local M = {}

-- Parse .clang-format file to extract indentation settings
function M.parse_clang_format()
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
    
    -- Check for IndentWidth
    local indent_width = content:match("IndentWidth:%s*(%d+)")
    if indent_width then
        settings.indent_width = tonumber(indent_width)
    end
    
    -- Check for UseTab (Never, ForIndentation, Always)
    local use_tab = content:match("UseTab:%s*(%w+)")
    if use_tab then
        settings.use_tab = use_tab
    end
    
    -- Check for TabWidth
    local tab_width = content:match("TabWidth:%s*(%d+)")
    if tab_width then
        settings.tab_width = tonumber(tab_width)
    end
    
    return settings
end

-- Apply indentation settings from .clang-format
function M.apply_indentation()
    local settings = M.parse_clang_format()
    
    if not settings then
        return
    end
    
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
    end
    
    -- Set expandtab based on UseTab
    if settings.use_tab then
        if settings.use_tab == "Never" then
            vim.bo.expandtab = true
        elseif settings.use_tab == "Always" then
            vim.bo.expandtab = false
        else
            -- ForIndentation or ForContinuationAndIndentation
            vim.bo.expandtab = true
        end
    else
        -- Default: use spaces
        vim.bo.expandtab = true
    end
    
    -- Notify user (optional, comment out if too noisy)
    -- vim.notify(string.format("Applied .clang-format: %d spaces%s", 
    --     settings.indent_width or 4,
    --     vim.bo.expandtab and "" or " (tabs)"), vim.log.levels.INFO)
end

-- Setup autocommand for C/C++ files
function M.setup()
    local group = vim.api.nvim_create_augroup("ClangFormatDetector", { clear = true })
    
    vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
        group = group,
        pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.cc", "*.cxx", "*.c++" },
        callback = function()
            M.apply_indentation()
        end,
        desc = "Auto-detect .clang-format and set indentation",
    })
end

return M
