return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            -- Neovim 0.11+ has built-in treesitter support
            -- This plugin mainly provides parsers and query files

            -- Auto-install parsers
            local ensure_installed = {
                "lua", "vim", "vimdoc", "markdown", "markdown_inline",
                "c", "cpp", "python", "go", "javascript", "typescript",
                "json", "yaml", "toml", "bash", "regex", "query",
            }

            -- Check and install missing parsers
            local function ensure_parsers()
                local installed = require("nvim-treesitter.info").installed_parsers()
                for _, lang in ipairs(ensure_installed) do
                    if not vim.tbl_contains(installed, lang) then
                        vim.cmd("TSInstall " .. lang)
                    end
                end
            end

            -- Run after startup
            vim.defer_fn(ensure_parsers, 100)
        end,
    },
}
