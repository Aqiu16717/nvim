return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                -- Ensure these parsers are installed
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                    "c",
                    "cpp",
                    "python",
                    "go",
                    "javascript",
                    "typescript",
                    "json",
                    "yaml",
                    "toml",
                    "bash",
                    "regex",
                    "query",
                },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                auto_install = true,
                -- Enable highlighting
                highlight = {
                    enable = true,
                    -- Disable highlighting for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    -- Use treesitter highlighting in addition to vim syntax
                    additional_vim_regex_highlighting = false,
                },
                -- Enable indentation
                indent = {
                    enable = true,
                },
                -- Enable incremental selection
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            })
        end,
    },
}
