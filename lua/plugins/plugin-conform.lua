return {
    {
        'stevearc/conform.nvim',
        version = "7.1.0",
        opts = {
            formatters_by_ft = {
                ["c"] = {"clang_format"},
                ["cpp"] = {"clang_format"},
                ["c++"] = {"clang_format"},
            }
        },
    }
}
