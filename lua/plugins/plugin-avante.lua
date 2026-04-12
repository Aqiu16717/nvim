return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        build = "make",
        opts = {
            provider = "claude",
            providers = {
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-5-sonnet-20241022",
                    timeout = 30000,
                    extra_request_body = {
                        temperature = 0,
                        max_tokens = 4096,
                    },
                },
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    },
}
