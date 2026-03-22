return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        -- Neovim 0.11+ has built-in treesitter support
        -- This plugin provides parsers only
    },
}
